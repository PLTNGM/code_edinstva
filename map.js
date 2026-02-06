document.addEventListener("DOMContentLoaded", function() {
document.querySelectorAll('.Active-region').forEach(region => {
    region.addEventListener('click', function() {
        const regionId = this.id;
        const d = this.getAttribute('d'); // Берем координаты пути
        
        // Показываем оверлей
        document.getElementById('focus-overlay').style.display = 'flex';
        
        // Клонируем путь в большое окно
        const bigSvg = document.getElementById('focused-region-svg');
        bigSvg.innerHTML = `<path d="${d}" fill="#ff4d4d">`;
        
        // Автоматически подгоняем размер (важная магия!)
        const bbox = this.getBBox();
        bigSvg.setAttribute('viewBox', `${bbox.x} ${bbox.y} ${bbox.width} ${bbox.height}`);
        
        document.getElementById('region-name').innerText = regionId;
    });
});

function closeFocus() {
    document.getElementById('focus-overlay').style.display = 'none';
}});