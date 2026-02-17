let okno = document.getElementById('okno');
let but = document.getElementById('langs');
let currentLang = 'tt';

// ОТКРЫТИЕ ПО КНОПКЕ
but.onclick = function(e) {
    e.stopPropagation(); // ВАЖНО: не дает клику закрыть окно сразу
    
    if (okno.classList.contains('show-okno')) {
        closeMenu();
    } else {
        okno.classList.remove('hide-okno');
        okno.classList.add('show-okno');
    }
};

// ЗАКРЫТИЕ ПРИ КЛИКЕ МИМО
document.addEventListener('click', function(e) {
    if (!okno.contains(e.target) && okno.classList.contains('show-okno')) {
        closeMenu();
    }
});

function closeMenu() {
    okno.classList.add('hide-okno');
    // Ждем конца анимации и скрываем полностью
    setTimeout(() => {
        okno.classList.remove('show-okno');
        okno.classList.remove('hide-okno');
    }, 200);
}

// ВЫБОР ЯЗЫКА
okno.onclick = function(e) {
    if (e.target.classList.contains('lang-item')) {
        currentLang = e.target.getAttribute('data-lang');
        document.querySelector('.transl h1').innerText = `Русский — ${e.target.innerText}`;
        closeMenu();
        runTranslation(); // Сразу переводим
    }
};

// ПЕРЕВОД
async function runTranslation() {
    let input = document.getElementById('upper-box').value; // .value для textarea!
    let output = document.getElementById('lower-box');

    if (!input.trim()) return;

    let response = await fetch('/api/translate_standalone', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ text: input, lang: currentLang })
    });

    let data = await response.json();
    output.value = data.result; // .value для textarea!
}