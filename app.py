import os
import psycopg2
from deep_translator import GoogleTranslator
from flask import Flask, render_template, jsonify, request

from dotenv import load_dotenv

load_dotenv()


DB_CONFIG = {
    "database": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASS"),
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

    cur.execute('''
    CREATE TABLE IF NOT EXISTS post_forum (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        avatar TEXT,
        post_idea VARCHAR(150),
        text TEXT
        );
    ''')

    cur.execute('''
    CREATE TABLE IF NOT EXISTS media_post (
        id SERIAL PRIMARY KEY,
        id_post INTEGER REFERENCES post_forum(id) ON DELETE CASCADE,
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

# форум
@app.route('/api/get_forum_posts')
def get_forum_posts():
    conn = connection()
    cur = conn.cursor()
    try:
        # Используем array_agg, чтобы собрать все картинки поста в один список
        cur.execute('''
            SELECT 
                p.id, p.name, p.avatar, p.post_idea, p.text,
                array_agg(m.img_adress) FILTER (WHERE m.img_adress IS NOT NULL) as images
            FROM post_forum p
            LEFT JOIN media_post m ON p.id = m.id_post
            GROUP BY p.id
            ORDER BY p.id DESC;
        ''')
        
        rows = cur.fetchall()
        posts = []
        for row in rows:
            posts.append({
                "id": row[0],
                "name": row[1],
                "avatar": row[2],
                "idea": row[3],
                "text": row[4],
                "images": row[5] if row[5] else []
            })
            
        return jsonify(posts)
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        conn.commit()
        cur.close() # ОБЯЗАТЕЛЬНО
        conn.close()

# переводчик (временно)
MANUAL_TRANSLATE = { #заглушка для демо версии
    "krl": { # Карельский
        "Привет": "Terveh",
        "Добро пожаловать": "Tulgua tervehenä",
        "Как дела?": "Kui aziet?",
        "Спасибо": "Passibo"
    },
    "yrk": { # Ненецкий
        "Привет": "Ет’ тын’",
        "Добро пожаловать": "Ет’ тын’!",
        "Спасибо": "Тат’ тын’"
    },
    "udm": { # Удмуртский
        "Привет": "Ӟечбуресь",
        "Как дела?": "Кызьы улон-вылонъёс?"
    }
}

@app.route('/api/translate_standalone', methods=['POST'])
def translate_standalone():
    data = request.json
    text = data.get('text', '').strip()
    target = data.get('lang', 'tt')

    # 1. Сначала ищем в ручном словаре (точное совпадение)
    if target in MANUAL_TRANSLATE:
        if text in MANUAL_TRANSLATE[target]:
            return jsonify({"result": MANUAL_TRANSLATE[target][text]})
        else:
            # Если фразы нет в словаре, можно либо пробовать Google, 
            # либо честно сказать, что база пополняется
            return jsonify({"result": f"[{target.upper()}] База данных пополняется..."})

    try:
        translated = GoogleTranslator(source='auto', target=target).translate(text)
        return jsonify({"result": translated})
    except Exception as e:
        print(f"Ошибка перевода: {e}")
        return jsonify({"result": "Сервис временно недоступен"}), 500

# общий бек страниц
@app.route("/")
def index():
    return render_template('index.html')

@app.route("/forum")
def forum():
    return render_template('forum.html')

@app.route("/translate")
def translate():
    return render_template('translate.html')

if __name__ == '__main__':
    app.run(debug=True)

