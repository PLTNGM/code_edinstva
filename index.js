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
    if(window.scrollY % 100 == 0){
    console.log('Позиция скролла:', window.scrollY);
    }
    else if(window.scrollY < 10){
        console.clear()
    }
    else if(window.scrollY > 2300  && flag == 0){
        flag++;
            num190()
            num270()
    }
});


// QWIZ НЕЕЕЕТ
document.getElementById('submit')

let ques = document.getElementsByClassName('question');

let radio1 = document.getElementById('one');
let radio2 = document.getElementById('two');
let radio3 = document.getElementById('three');
let radio4 = document.getElementById('four');


const submit = document.getElementById('submit').addEventListener('click', function(){
    alert('haloo')
})