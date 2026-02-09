document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.Active-region').forEach(region => {
        region.addEventListener('click', function() {
            const regionId = this.id;
            const d = this.getAttribute('d'); // Берем координаты пути
            
            // ПОМЕНЯЛ: добавляем класс 'active' вместо изменения display напрямую
            const overlay = document.getElementById('focus-overlay');
            overlay.classList.add('active');
            
            // Клонируем путь в большое окно
            const bigSvg = document.getElementById('focused-region-svg');
            bigSvg.innerHTML = `<path d="${d}" fill="#2B2DB1">`;
            
            // Автоматически подгоняем размер
            const bbox = this.getBBox();
            bigSvg.setAttribute('viewBox', `${bbox.x} ${bbox.y} ${bbox.width} ${bbox.height}`);
            
            document.getElementById('region-name').innerText = regionId;
        });
    });
});

// закрывашка
function closeFocus() {
    const overlay = document.getElementById('focus-overlay');
    
    // Добавляем класс для анимации закрытия
    overlay.classList.add('closing');
    
    // Ждем окончания анимации и скрываем
    setTimeout(() => {
        overlay.classList.remove('active', 'closing');
    }, 300); // Время должно совпадать с transition
}