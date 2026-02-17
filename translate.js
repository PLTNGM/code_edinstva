let okno = document.getElementById('okno');
let but = document.getElementById('langs');

but.addEventListener('click', function(){
    okno.style.animation = 'oknoanim 0.2s ease-in forwards';
    okno.style.zIndex = '10';

    document.addEventListener('click', function(event) {
    if (!okno.contains(event.target) && !but.contains(event.target)) {
        console.log('Клик вне блока!');
        close(); // ваша функция
    }
});
});




function close(){
    okno.style.animation = 'oknoend 0.2s ease-out forwards';
    okno.style.zIndex = '-100';
}