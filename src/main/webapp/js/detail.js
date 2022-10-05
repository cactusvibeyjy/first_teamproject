let crawlingData = [];
const sectbasemovie = document.querySelector(
    '.sect-base-movie'
);

document.addEventListener('DOMContentLoaded', () => {
    add();
});

// 데이터 가져오기
function add() {
    $.ajax({
        url: 'detailcrawling.do',
        type: 'get',

        success: function(data) {
            crawlingData = JSON.parse(data);
            console.log(crawlingData);
            console.log(data);
            if(crawlingData.length === 0){
            	location.href="moveMain.do";
            }
            console.log(crawlingData.img);  
            setList(crawlingData); 
        },
    });
}
 //<i class="cgvIcon etc age12"> ${data.movieAge}</i></span>
            
function setList(data) {
	let html="";
	let temp = crawlingData.img;
	let largeImg = temp.substring(0, temp.lastIndexOf('_'));
	largeImg += "_1000.jpg";
    sectbasemovie.innerHTML = html + `
    <div class="box-image">
		<a href="${largeImg}" target="_blank"> 
			<span class="thumb-image"><img src = "${data.img}" height="260px" width="185px">
            <span class="ico-grade grade-12"> ${data.movieAge}</span></span>
           
		</a>
	</div>
	<div class="box-contents">
		<div class="title">
			<strong>${data.movieTitle}</strong> <em class="round lightblue"><span>${data.nowShow}</span></em>
			<p>${data.engTitle}</p>
		</div>
		<div class="score">
			<strong class="percent">예매율&nbsp;<span>${data.movieRate}</span></strong>
		</div>
		<div class="spec">${data.detail}</div>
	</div>
    <div class="sect-story-movie">${data.story}</div>`;
    return html;
}