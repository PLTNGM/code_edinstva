import psycopg2
from flask import Flask, render_template, jsonify



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

# для карты
@app.route("/get_region/<name>")
def get_region(name):
    conn = connection()
    cur = conn.cursor()
    
    # 1. Берем инфу о республике
    cur.execute("SELECT id, name, text FROM respublic WHERE name = %s", (name,))
    region = cur.fetchone()
    
    if not region:
        cur.close()
        conn.close()
        return jsonify({"error": "Регион не найден"}), 404
    
    region_id, region_name, region_text = region
    
    # 2. Берем все картинки для этой республики
    cur.execute("SELECT img_adress FROM media_respublic WHERE id_respublic = %s", (region_id,))
    images = [row[0] for row in cur.fetchall()]
    
    cur.close()
    conn.close()
    
    return jsonify({
        "name": region_name,
        "text": region_text,
        "images": images
    })


# общий бек страниц
@app.route("/")
def index():
    return render_template('index.html')

@app.route("/forum")
def forum():
    return render_template('forum.html')

if __name__ == '__main__':
    app.run(debug=True)

