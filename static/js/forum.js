async function renderForum() {
    try {
        const response = await fetch('/api/get_forum_posts');
        const posts = await response.json();
        
        // Ищем ГЛАВНЫЙ контейнер, который у тебя в HTML
        const mainFeed = document.getElementById('main-feed');
        if (!mainFeed) return console.error("Контейнер #main-feed не найден!");
        
        mainFeed.innerHTML = ''; 

        const avatarPath = 'static/img/avatars/'; 
        const mediaPath = 'static/img/posts/';
        const asideImg = 'static/img/aside2.png'; 

        posts.forEach(item => {
            // Создаем обертку для каждого поста (с твоей стилистикой .content-news)
            const newsBlock = document.createElement('div');
            newsBlock.className = 'content-news';

            const mediaHtml = item.images.map(imgName => `
                <img src="${mediaPath}${imgName}" class="forum-media-img">
            `).join('');

            // Вставляем структуру внутрь newsBlock
            newsBlock.innerHTML = `
                <img class="asideL2" src="${asideImg}">
                <img class="asideR2" src="${asideImg}">

                <div class="forum-item">
                    <div class="forum-header">
                        <img src="${avatarPath}${item.avatar}" class="forum-avatar">
                        <span class="forum-username">${item.name}</span>
                    </div>
                    <div class="forum-body">
                        <h3 class="forum-idea">${item.idea}</h3>
                        <div class="forum-gallery">
                            ${mediaHtml}
                        </div>
                        <p class="forum-text">${item.text}</p>
                    </div>
                </div>
            `;
            // Добавляем готовый блок в ленту
            mainFeed.appendChild(newsBlock);
        });
    } catch (err) {
        console.error("Ошибка загрузки форума:", err);
    }
}

document.addEventListener('DOMContentLoaded', renderForum);