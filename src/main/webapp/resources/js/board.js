/**
 * 
 */

var promotion = document.querySelector('.promotion');
var sharing = document.querySelector('.sharing');
var listTitle = document.querySelector('.listTitle');
var listWriter = document.querySelector('.listWriter');


promotion.addEventListener('click',function(e){
    e.target.style.backgroundColor = 'black';
    e.target.style.color = 'white';
    sharing.style.backgroundColor = 'white';
    sharing.style.color = 'black';
    
    listTitle.textContent = "홍보내용";
    listWriter.textContent = "아티스트";
});

sharing.addEventListener('click',function(e){
    e.target.style.backgroundColor = 'black';
    e.target.style.color = 'white';
    promotion.style.backgroundColor = 'white';
    promotion.style.color = 'black';
    
    listTitle.textContent = "제목";
    listWriter.textContent = "작성자";
});