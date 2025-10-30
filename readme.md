# How to run this project

## Requirements:
- Make
- python3
- docker


## Run:
### with make:
```
make install-all
```
To install project dependencies. The notebooks live in src/etl/notebooks
```
make run
```
To start docker containers (db & pgadmin)

### without make

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt

docker compose up -d
```
L'exercice  1 est dans  src/etl/ex1.ipynb
            2                   ex2_jointures.ipynb
            3                   ex3_talend.ipynb

