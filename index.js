let num1 = document.getElementById('narod');
function num190(){
let count = 0;
let maxCount = 190;
let duration = 2000;
let intervalTime = duration / maxCount;
    const counterInterval = setInterval(() => {
        count++;
        num1.innerHTML = count + '+';
        
        if (count >= maxCount) {
            clearInterval(counterInterval);
        }
    }, intervalTime);
}


let num2 = document.getElementById('lang');
function num270(){
let count = 0;
let maxCount = 270;
let duration = 2000;
let intervalTime = duration / maxCount;
    const counterInterval = setInterval(() => {
        count++;
        num2.innerHTML = count + '+';
        
        if (count >= maxCount) {
            clearInterval(counterInterval);
        }
    }, intervalTime);
}

let flag = 0;
window.addEventListener('scroll', function() {
    if(window.scrollY > 2300  && flag == 0){
        flag++;
            num190()
            num270()
    }
});


// QWIZ НЕЕЕЕТ
document.getElementById('submit')

const quizData = [
    {
        q: "1. Какой из этих народов является вторым по численности в России и проживает преимущественно в Поволжье?",
        a: ["Татары", "Ненцы", "Карелы", "Удмурты"],
        correct: 0 
    },
    {
        q: "2. Традиционным жилищем какого северного народа является чум, покрытый оленьими шкурами?",
        a: ["Калмыки", "Татары", "Ненцы", "Удмурты"],
        correct: 2 
    },
    {
        q: "3. Какой из перечисленных народов исповедует буддизм, являясь единственным таким этносом в европейской части России?",
        a: ["Карелы", "Калмыки", "Удмурты", "Татары"],
        correct: 1 
    },
    {
        q: "4. На основе фольклора какого народа был создан знаменитый карело-финский эпос «Калевала»?",
        a: ["Карелы", "Ненцы", "Удмурты", "Калмыки"],
        correct: 0 
    },
    {
        q: "5. Какой народ Поволжья традиционно славится своим гостеприимством и блюдом перепечи (открытые ватрушки)?",
        a: ["Татары", "Ненцы", "Калмыки", "Удмурты"],
        correct: 3 
    },
    {
        q: "6. Как называется традиционный калмыцкий чай, который готовят с добавлением соли, молока и масла?",
        a: ["Джомба", "Кумыс", "Айран", "Сбитень"],
        correct: 0 
    },
    {
        q: "7. Какое животное является главным спутником и основой жизни для ненцев?",
        a: ["Лошадь", "Северный олень", "Верблюд", "Ездовая собака"],
        correct: 1 
    },
    {
        q: "8. Какое из этих блюд татарской кухни представляет собой пирамидки из теста с мясной и картофельной начинкой?",
        a: ["Чак-чак", "Кыстыбый", "Калитки", "Эчпочмак"],
        correct: 3 
    },
    {
        q: "9. Как называются традиционные карельские открытые пирожки из ржаного теста с начинкой из каши или картофеля?",
        a: ["Перепечи", "Калитки", "Беляши", "Шаньги"],
        correct: 1 
    },
    {
        q: "10. К какой языковой семье относится большинство представленных в списке народов (карелы, удмурты, ненцы)?",
        a: ["Индоевропейская", "Алтайская", "Уральская", "Кавказская"],
        correct: 2 
    }
];

let currentQuestion = 0;
let score = 0;
let userAnswers = new Array(quizData.length).fill(null);


function loadQuestion(index) {
    const question = quizData[index];
    document.querySelector('.question').textContent = question.q;
    
   
    document.querySelector('.txt1').textContent = question.a[0];
    document.querySelector('.txt2').textContent = question.a[1];
    document.querySelector('.txt3').textContent = question.a[2];
    document.querySelector('.txt4').textContent = question.a[3];
    
    
    if (userAnswers[index] !== null) {
        document.querySelector(`input[value="${userAnswers[index] + 1}"]`).checked = true;
    } else {
        document.getElementById('one').checked = true;
    }
    
    
}


function checkAnswer() {
    const selected = document.querySelector('input[name="people"]:checked');
    const selectedValue = parseInt(selected.value) - 1; // Преобразуем 1-4 в 0-3
    
    
    userAnswers[currentQuestion] = selectedValue;
    
  
    const isCorrect = (selectedValue === quizData[currentQuestion].correct);
    
    if (isCorrect) {
        score++;
        showResult("Правильно! ✓", "green");
    } else {
        const correctAnswer = quizData[currentQuestion].a[quizData[currentQuestion].correct];
        showResult("Неправильно! ✗", "red");
    };
}


function showResult(message, color) {
    const resultDiv = document.getElementById('result');
    resultDiv.innerHTML = message;
    resultDiv.style.color = color;
    resultDiv.style.fontWeight = 'bold';
    resultDiv.style.marginTop = '20px';
}



function finishQuiz() {
    const resultDiv = document.getElementById('result');
    const percentage = Math.round((score / quizData.length) * 100);
    
    
    
    resultDiv.innerHTML = `
        <h3>Тест завершен!</h3>
        <p>Правильных ответов: ${score} из ${quizData.length} (${percentage}%)</p>`;
    resultDiv.style.color = 'black';
    
   
    document.getElementById('submit').textContent = 'ЗАВЕРШЕНО';
    document.getElementById('submit').disabled = true;
}


document.getElementById('submit').addEventListener('click', function() {
    
    checkAnswer();
    
    
    if (currentQuestion < quizData.length - 1) {
        currentQuestion++;
        loadQuestion(currentQuestion);
    } else {
       
        finishQuiz();
    }
});


loadQuestion(0);