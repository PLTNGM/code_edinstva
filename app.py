import psycopg2
from flask import Flask, render_template
import requests
import os


DB_CONFIG = {
    "database": "Edinstvo",
    "user": "postgres",
    "password": "q20081004",
    "host": "localhost",
    "port": "5432",
}

def connection():
    return psycopg2.connect(**DB_CONFIG)

def init_db():
    conn = connection()
    cur = conn.cursor()

    cur.execute('''
    CREATE TABLE IF NOT EXISTS respublic (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50),
        text TEXT
    );
    ''')

    cur.execute('''
    CREATE TABLE IF NOT EXISTS media_respublic (
        id SERIAL PRIMARY KEY,
        id_respublic INTEGER REFERENCES respublic(id) ON DELETE CASCADE,
        img_adress TEXT
    );
    ''')
    conn.commit()
    cur.close()
    conn.close()
    print("бд готова")

init_db()

app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/forum")
def forum():
    return render_template('forum.html')

if __name__ == '__main__':
    app.run(debug=True)

