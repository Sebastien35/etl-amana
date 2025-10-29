"""
Hide & Seek 2D AI Simulation
Author: ChatGPT (GPT-5)
Description:
    Simple grid-based hide & seek game with AI-driven agents.
    Run: python hide_and_seek.py
"""

import random
import matplotlib
matplotlib.use("TkAgg")  # Enable real-time GUI display

import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
from collections import deque

# ===============================
# 🧩 CONFIGURATION
# ===============================
GRID_SIZE = (25, 25)
N_OBSTACLES = 100
N_HIDERS = 5
N_SEEKERS = 2
MAX_STEPS = 400
VIS_RADIUS_SEEKER = 6
VIS_RADIUS_HIDER = 4
SEED = 42

random.seed(SEED)
np.random.seed(SEED)


# ===============================
# 🧭 WORLD SETUP
# ===============================
def make_grid():
    """Creates a random grid with obstacles."""
    grid = np.zeros(GRID_SIZE, dtype=np.int8)
    for _ in range(N_OBSTACLES):
        r = random.randrange(GRID_SIZE[0])
        c = random.randrange(GRID_SIZE[1])
        grid[r, c] = 1
    return grid


def in_bounds(pos):
    r, c = pos
    return 0 <= r < GRID_SIZE[0] and 0 <= c < GRID_SIZE[1]


def neighbors(pos, grid):
    """Valid neighbor cells (4 directions)."""
    r, c = pos
    for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
        nb = (r + dr, c + dc)
        if in_bounds(nb) and grid[nb] == 0:
            yield nb


def euclid(a, b):
    return np.hypot(a[0] - b[0], a[1] - b[1])


def bfs_path(start, goal, grid):
    """Shortest path using BFS."""
    if start == goal:
        return [start]
    q = deque([start])
    came_from = {start: None}
    while q:
        cur = q.popleft()
        for nb in neighbors(cur, grid):
            if nb not in came_from:
                came_from[nb] = cur
                if nb == goal:
                    path = [goal]
                    while cur is not None:
                        path.append(cur)
                        cur = came_from[cur]
                    return path[::-1]
                q.append(nb)
    return None


# ===============================
# 🧠 AGENT CLASSES
# ===============================
class Hider:
    def __init__(self, pos):
        self.pos = pos
        self.path = None
        self.hidden = False

    def select_hiding_spot(self, hiding_spots, grid):
        """Find nearest accessible hiding spot."""
        best, best_len = None, 1e9
        for spot in hiding_spots:
            path = bfs_path(self.pos, spot, grid)
            if path and len(path) < best_len:
                best, best_len = path, len(path)
        self.path = best

    def step(self, seekers, hiding_spots, free_cells, grid):
        """Move toward hiding spot or flee if seekers too close."""
        # Flee if seeker is nearby
        for sk in seekers:
            if euclid(self.pos, sk.pos) <= VIS_RADIUS_HIDER:
                far_cells = sorted(
                    free_cells,
                    key=lambda c: min(euclid(c, s.pos) for s in seekers),
                    reverse=True,
                )
                for c in far_cells[:200]:
                    path = bfs_path(self.pos, c, grid)
                    if path:
                        self.path = path
                        self.hidden = False
                        return

        # If no current plan, find hiding spot
        if not self.path:
            self.select_hiding_spot(hiding_spots, grid)

        # Follow path
        if self.path and len(self.path) > 1:
            self.pos = self.path[1]
            self.path = self.path[1:]
        else:
            self.hidden = True
            self.path = None

        # Optional: small random movement while hidden
        if self.hidden and random.random() < 0.02:
            possible_moves = list(neighbors(self.pos, grid))
            if possible_moves:
                self.pos = random.choice(possible_moves)


class Seeker:
    def __init__(self, pos):
        self.pos = pos
        self.frontier = deque()

    def visible_hiders(self, hiders, grid):
        """Return list of visible hiders (simple radius + path check)."""
        seen = []
        for h in hiders:
            if euclid(self.pos, h.pos) <= VIS_RADIUS_SEEKER:
                p = bfs_path(self.pos, h.pos, grid)
                if p and len(p) - 1 <= VIS_RADIUS_SEEKER * 1.5:
                    seen.append(h)
        return seen

    def compute_frontier(self, known, free_cells):
        """Rebuild frontier of unexplored cells."""
        unknown = [c for c in free_cells if c not in known]
        unknown.sort(key=lambda c: euclid(c, self.pos))
        self.frontier = deque(unknown)

    def step(self, known, hiders, free_cells, grid):
        """Chase visible hider or explore."""
        seen = self.visible_hiders(hiders, grid)
        if seen:
            target = min(seen, key=lambda h: euclid(self.pos, h.pos))
            path = bfs_path(self.pos, target.pos, grid)
            if path and len(path) > 1:
                self.pos = path[1]
            return

        # Explore unexplored frontier
        while self.frontier and self.frontier[0] in known:
            self.frontier.popleft()

        if not self.frontier:
            self.compute_frontier(known, free_cells)

        if self.frontier:
            goal = self.frontier[0]
            path = bfs_path(self.pos, goal, grid)
            if path and len(path) > 1:
                self.pos = path[1]
            else:
                self.frontier.popleft()


# ===============================
# 🧱 GAME INITIALIZATION
# ===============================
def setup_world():
    grid = make_grid()
    free_cells = [(r, c) for r in range(GRID_SIZE[0]) for c in range(GRID_SIZE[1]) if grid[r, c] == 0]
    hiding_spots = [
        (r, c)
        for r in range(GRID_SIZE[0])
        for c in range(GRID_SIZE[1])
        if grid[r, c] == 0
        and any(
            0 <= r + dr < GRID_SIZE[0] and 0 <= c + dc < GRID_SIZE[1] and grid[r + dr, c + dc] == 1
            for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1))
        )
    ]
    random.shuffle(free_cells)
    hiders = [Hider(free_cells[i]) for i in range(N_HIDERS)]
    seekers = [Seeker(free_cells[N_HIDERS + i]) for i in range(N_SEEKERS)]
    return grid, hiding_spots, free_cells, hiders, seekers


# ===============================
# 🎮 MAIN SIMULATION LOOP
# ===============================
def run_simulation():
    grid, hiding_spots, free_cells, hiders, seekers = setup_world()
    known = set(s.pos for s in seekers)
    caught = set()
    caught_count = 0

    # Setup visualization
    fig, ax = plt.subplots(figsize=(6, 6))
    ax.set_xticks([]); ax.set_yticks([])
    im = ax.imshow(grid, cmap="Greys", vmin=0, vmax=1)
    hider_scat = ax.scatter([], [], c="blue", s=50, label="Hiders")
    seeker_scat = ax.scatter([], [], c="red", s=80, marker="X", label="Seekers")
    step_text = ax.text(0.02, 0.98, "", transform=ax.transAxes, color="white", va="top")
    ax.legend(loc="upper right")

    def update(frame):
        nonlocal caught_count
        if frame >= MAX_STEPS:
            return []

        # --- Hiders update ---
        for h in hiders:
            if h in caught:
                continue
            h.step(seekers, hiding_spots, free_cells, grid)

        # --- Seekers update ---
        for s in seekers:
            # Update known map (seekers explore surroundings)
            for r in range(GRID_SIZE[0]):
                for c in range(GRID_SIZE[1]):
                    if grid[r, c] == 0 and euclid((r, c), s.pos) <= VIS_RADIUS_SEEKER:
                        known.add((r, c))

            # Step (chase or explore)
            s.step(known, [h for h in hiders if h not in caught], free_cells, grid)

        # --- Check catches ---
        for h in hiders:
            if h in caught:
                continue
            for s in seekers:
                if euclid(s.pos, h.pos) < 1:
                    caught.add(h)
                    caught_count += 1
                    break

        # --- Hidden hiders flee if seekers close ---
        for h in hiders:
            if h not in caught and h.hidden:
                for s in seekers:
                    if euclid(h.pos, s.pos) <= VIS_RADIUS_HIDER:
                        h.hidden = False
                        break

        # --- Update visuals ---
        hpos = [h.pos for h in hiders if h not in caught]
        spos = [s.pos for s in seekers]
        hider_scat.set_offsets(np.array([[p[1], p[0]] for p in hpos]) if hpos else np.empty((0, 2)))
        seeker_scat.set_offsets(np.array([[p[1], p[0]] for p in spos]))
        step_text.set_text(f"Step: {frame} | Alive: {len(hiders)-len(caught)} | Caught: {caught_count}")
        return [hider_scat, seeker_scat, step_text]

    ani = animation.FuncAnimation(fig, update, frames=MAX_STEPS, interval=100, blit=True, repeat=False)
    plt.show()


# ===============================
# 🚀 RUN
# ===============================
if __name__ == "__main__":
    run_simulation()
