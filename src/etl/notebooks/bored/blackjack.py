import pandas as pd
import random
import typer
import scipy.stats as stats

app = typer.Typer(no_args_is_help=True)

@app.command()
def play_blackjack():
    def create_deck():
        """Creates a standard deck of 52 cards (values only)."""
        cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11] * 4  # 4 suits
        random.shuffle(cards)
        return cards

    def deal_card(deck):
        """Deals a single card from the deck."""
        return deck.pop()

    def calculate_score(hand):
        """Calculates the score of a hand."""
        if sum(hand) == 21 and len(hand) == 2:
            return 0  # Blackjack
        # Adjust for Aces
        while 11 in hand and sum(hand) > 21:
            hand[hand.index(11)] = 1
        return sum(hand)

    def ai_helper(hand, deck):
        """
        AI helper that uses real probabilities to decide whether to hit or stand.
        It calculates the probability of busting if hitting.
        """
        current_score = calculate_score(hand)
        if current_score == 0:
            return "stand (blackjack)"

        # Count remaining cards
        remaining_cards = deck.copy()

        # Compute probability of busting
        busts = 0
        for card in remaining_cards:
            temp_hand = hand + [card]
            score = calculate_score(temp_hand)
            if score > 21:
                busts += 1

        bust_probability = busts / len(remaining_cards)

        # Decision based on bust probability and current score
        if bust_probability < 0.4 and current_score < 21:
            decision = "hit"
        else:
            decision = "stand"

        print(f"[AI Helper] Bust probability if you hit: {bust_probability:.2%}")
        return decision

    def compare(user_score, computer_score):
        """Compares user and computer scores to determine the winner."""
        if user_score > 21 and computer_score > 21:
            return "You both went over. It's a draw!"
        if user_score == computer_score:
            return "It's a draw!"
        elif computer_score == 0:
            return "Computer has Blackjack! You lose."
        elif user_score == 0:
            return "You have Blackjack! You win!"
        elif user_score > 21:
            return "You went over. You lose."
        elif computer_score > 21:
            return "Computer went over. You win!"
        elif user_score > computer_score:
            return "You win!"
        else:
            return "You lose."

    # --- Game setup ---
    deck = create_deck()
    user_hand = []
    computer_hand = []
    is_game_over = False

    for _ in range(2):
        user_hand.append(deal_card(deck))
        computer_hand.append(deal_card(deck))

    # --- Player Turn ---
    while not is_game_over:
        user_score = calculate_score(user_hand)
        computer_score = calculate_score(computer_hand)
        print(f"\nYour cards: {user_hand}, current score: {user_score}")
        print(f"Computer's first card: {computer_hand[0]}")
        print("AI suggests you should probably", ai_helper(user_hand, deck))

        if user_score == 0 or computer_score == 0 or user_score > 21:
            is_game_over = True
        else:
            should_continue = input("Type 'y' to get another card, type 'n' to pass: ")
            if should_continue == 'y':
                user_hand.append(deal_card(deck))
            else:
                is_game_over = True

    # --- Computer Turn ---
    while computer_score != 0 and computer_score < 17:
        computer_hand.append(deal_card(deck))
        computer_score = calculate_score(computer_hand)

    print(f"\nYour final hand: {user_hand}, final score: {user_score}")
    print(f"Computer's final hand: {computer_hand}, final score: {computer_score}")
    print(compare(user_score, computer_score))


if __name__ == "__main__":
    app()
