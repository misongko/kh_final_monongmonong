<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

</head>
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
	font-weight: 400;
	font-size: 16px;
	color: #333;
}

.btn-EA5C2B {
	color: #fff;
	background-color: #EA5C2B;
}

.btn-EA5C2B:hover {
	color: #EA5C2B;
	border: 1px solid #EA5C2B;
	background-color: inherit;
}

.btn-EA5C2B-reverse {
	color: #EA5C2B;
	border: 1px solid #EA5C2B;
}

.btn:focus {
	box-shadow: none;
}

.btn-116530{
	color: #fff;
	background-color : #116530;
}

.m-s-review-section{
    width: 520px;
    margin: 0 auto;
    text-align: center;
    padding: 30px 0;
}

.m-s-review-title{
	margin-bottom: 20px;
	font-weight: bold;
}

.m-s-review-times{
    margin: 10px 0;
}

.m-s-review-container{
    border-top: 1px solid lightgrey;
    padding: 20px 0;
}

.m-s-review-info{
    margin: 0;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
}

.stars-wrapper{
	width: fit-content;
    margin: 0 auto;
}

.m-s-review-stars{
	font-size: 50px;
	background-color: white;
	border: none;
	color: #aaa9a9;
	padding: 0;
    line-height: 55px;
	cursor: pointer;
}

.m-s-review-stars:focus {
	outline: none;
}

.m-s-review-stars.filled{
	color: #F6D860;;
}

.m-s-review-content-container{
    border: 1px solid black;
    width: 400px;
    margin: 10px auto;
}

.m-s-review-content{
    resize: none;
    width: 380px;
    height: 200px;
    border: none;
    padding: 10px;
}

.m-s-review-content:focus {
	outline: none;
}

.content-length-wrapper{
    text-align: right;
    margin: 0 10px 5px 0;
}

.m-s-review-attach-container{
	padding: 20px 0;
}

.attach-info{
	display: inline-block;
	cursor: pointer;
}

.attach-info:hover{
	color: #116530;
}

.attach-info.active{
	border-bottom: 3px solid #116530;
}

.attach-sub-info{
	margin-bottom: 5px;
}

.m-s-review-attachs{
	display: none;
}

.m-s-review-attachs.active{
	display: block;
}

.m-s-review-attachs img{
	cursor: pointer;
}

.m-s-review-attach{
    padding: 10px;
    width: 300px;
    border: 2px solid lightgrey;
    border-radius: 5px;
    margin: 5px 0;
}

.img-wrapper-delete{
	border: 3px solid red;
    background-color: #eda9a9;
    width: fit-content;
    height: fit-content;
    margin: 0 auto;
    display: absolute;
}

</style>
<body>

<section class="m-s-review-section">
<h2 class="m-s-review-title">후기 수정</h2>
<div class="m-s-review-container">
	<div class="m-s-review-times">정기구독 ${sReview.STimes}회차</div>
</div>
<form name="reviewUpdateFrm">
    <input type="hidden" name="sReviewNo" value="${sReview.SReviewNo}"/>
    <div class="m-s-review-container">
        <p class="m-s-review-info">이번 구독에 만족하셨나요?</p>
        <div class="stars-wrapper">
        <button type="button" class="m-s-review-stars star1">★</button>
        <button type="button" class="m-s-review-stars star2">★</button>
        <button type="button" class="m-s-review-stars star3">★</button>
        <button type="button" class="m-s-review-stars star4">★</button>
        <button type="button" class="m-s-review-stars star5">★</button>
        </div>
        <input type="hidden" class="m-s-review-stars-selected" name="sReviewStar" value="${sReview.SReviewStar}">
    </div>
    <div class="m-s-review-container">
        <p class="m-s-review-info content-info">어떤 점이 좋았나요?</p>
        <div class="m-s-review-content-container">
            <textarea class="m-s-review-content" name="sReviewContent">${sReview.SReviewContent}</textarea>
            <div class="content-length-wrapper">
                <span class="m-s-review-content-length">${fn:length(sReview.SReviewContent)}</span>
                <span>/</span>
                <span>500</span>
            </div>
        </div>
		<div class="m-s-review-attach-container">
	        <p class="m-s-review-info attach-info"></p>
	        <div class="m-s-review-attachs">
		        <p class="attach-sub-info">최대 3개까지 첨부 가능합니다.</p>
		        <c:forEach items="${sReview.SAttachments}" var="attach">
		        	<div onclick="delImg(this)" style="margin: 10px 0;">
			        	<input type="checkbox" id="delFile${vs.count}" name="delFiles" value="${attach.SAttachNo}" style="display:none;">
			        	<div>
			        		<img src="${pageContext.request.contextPath}/resources/upload/subscribe/review/${attach.SReviewRenamedFilename}" width="300px"/>
			        	</div>
		        	</div>
		        </c:forEach>
		        <input type="hidden" class="attached-cnt" value="${fn:length(sReview.SAttachments)}"/>
		        <div class="attach-container"></div>
		 	</div>
		</div>
    </div>
    <button class="btn btn-EA5C2B btn-m-s-review-submit">후기 수정</button>

</form>
</section>
<script>
// 첨부된 사진 개수
let attachedCnt = Number(document.querySelector(".attached-cnt").value);
console.log('attachedCnt', attachedCnt);

window.onload = () => {
	const starVal = document.querySelector(".m-s-review-stars-selected").value;
	console.log('starVal', starVal);
	
	// 기존에 선택했던 별점 나타내기
	for(let i = 1; i <= starVal; i++){
		document.querySelector(`.star\${i}`).classList.add('filled');
	}
	
	// 기존후기 사진첨부 개수에 따라 가능한만큼 사진첨부창 추가
	for(let i = 1; i <= 3 - attachedCnt; i++){
		document.querySelector(".attach-container").innerHTML +=
			`<input type="file" class="m-s-review-attach" name="upFiles" id="upFile\${i}" accept="image/*" multiple>`;
	}
	
	// 기존후기 사진첨부 유무에 따라 첨부 안내문구 다르게 하기
	if(attachedCnt === 0){
		document.querySelector(".attach-info").innerHTML = '사진 첨부하기';
	}
	else{
		document.querySelector(".attach-info").innerHTML = '사진첨부목록 확인 및 수정';
		document.querySelector(".attach-sub-info").insertAdjacentHTML('afterend', '<p>사진을 클릭한 상태로 제출하시면 해당 사진은 삭제됩니다.</p>'); 
	}
};


const delImg = (img) => {
	const delCheckbox = img.firstElementChild;
	const delImg = img.lastElementChild.firstElementChild;
	const attachContainer = document.querySelector(".attach-container");
	const delImgWrapper = img.lastElementChild;
		
	let upFileNum;
	
	// 삭제를 위해 사진이 선택되어 있는 경우 -> 사진 선택 초기화 및 사진첨부창 초기화 후 추가
	if(delCheckbox.checked){
		delCheckbox.checked = false;
		delImg.style.opacity = "1";
		delImgWrapper.classList.remove("img-wrapper-delete"); // 선택된 사진임을 나타내는 css가 적용된 클래스 제거
		
		attachContainer.innerHTML =''; // 기존 사진첨부창 초기화
		attachedCnt++; // 기존 첨부된 사진 개수 증가
		
		// 첨부 가능한 개수만큼 사진첨부창 추가
		for(let i = 1; i <= 3 - attachedCnt; i++){
			attachContainer.innerHTML +=
				`<input type="file" class="m-s-review-attach" name="upFiles" id="upFile\${i}" accept="image/*" multiple>`;
		}
	}
	// 사진이 선택되어 있지 않은 경우 -> 사진 선택 및 사진첨부창 추가
	else{
		delCheckbox.checked = true;
		delImg.style.opacity = "0.4";
		delImgWrapper.classList.add("img-wrapper-delete"); // 선택된 사진임을 나타내는 css가 적용된 클래스 추가
		
		upFileNum = 3 - attachedCnt + 1;
		// 사진첨부창 추가
		attachContainer.innerHTML += 
			`<input type="file" class="m-s-review-attach" name="upFiles" id="upFile\${upFileNum}" accept="image/*" multiple>`;
			
		attachedCnt--; // 기존 첨부된 사진 개수 감소
		
	}
}


document.querySelector(".attach-info").addEventListener('click', (e) => {	
	document.querySelector(".m-s-review-attachs").classList.toggle('active');
	document.querySelector(".attach-info").classList.toggle('active');
});

document.reviewUpdateFrm.addEventListener('submit', (e) => {
	e.preventDefault();
	
	// 첨부파일 확장자 제한
	const frm = e.target;
	const upFiles = frm.upFiles;
	console.log('upFiles', upFiles);
	
	let msg = null;
	if(upFiles.length >= 2){
		upFiles.forEach(function(file){
			const filePath = file.value;
			const fileExt = filePath.substr(filePath.length-3).toLowerCase();
			
			if(fileExt !== ''){
				if(!(fileExt === 'jpg' || fileExt === 'png')){
					msg = '확장자가 jpg와 png인 파일만 첨부 가능합니다.';
				}
			}
		});
	}
	else{
		const filePath = upFiles.value;
		const fileExt = filePath.substr(filePath.length-3).toLowerCase();
		if(fileExt !== ''){
			if(!(fileExt === 'jpg' || fileExt === 'png')){
				msg = '확장자가 jpg와 png 파일만 첨부 가능합니다.';
			}
		}
	}
	
	if(msg !== null){
		alert(msg);
		return false;
	}
	
	
	const frmData = new FormData(e.target); 
	
	for(const key of frmData.keys()){
		console.log(key, frmData.get(key));
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/memberSubscribeReviewUpdate.do",
		data: frmData,
		contentType: false,
        	processData: false,
		method : "POST",
		beforeSend : function(xhr){  
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		       		 },
		success(result){
			console.log(window.opener.document);
			alert('후기를 성공적으로 수정하였습니다.');
			self.close();
			window.opener.location.reload();
		},
		error : console.log
	});
	
});


const checkSubmissionAvailablity = () => {
    const contentLen = document.querySelector(".m-s-review-content").value.length;
	const btnSubmit = document.querySelector(".btn-m-s-review-submit");
	
    if(contentLen >= 10){
    	btnSubmit.disabled = false;
    	btnSubmit.classList.remove('btn-EA5C2B-reverse');
        btnSubmit.classList.add('btn-EA5C2B');
    }
    else{
        btnSubmit.disabled = true;
        btnSubmit.classList.remove('btn-EA5C2B');
        btnSubmit.classList.add('btn-EA5C2B-reverse');
    }
};


const stars = document.querySelectorAll(".m-s-review-stars");
stars.forEach(function(star, index) {
	
    star.addEventListener('mouseover', () => {
        if(!star.classList.contains('filled')){
            console.log('star', star, 'index', index);
            star.classList.add('filled');
            
            for (let i = 0; i < index; i++) {
                stars[i].classList.add('filled');
            }
        }
        else{
            console.log('filled-star', star, 'filled-index', index);
            for (let i = index + 1; i < 5; i++) {
                stars[i].classList.remove('filled');
            }
        }
        
    });
    

    star.addEventListener('click', () => {
    	const rate = index + 1;
        document.querySelector(".m-s-review-stars-selected").value = rate;

        /* if(!star.classList.contains('filled')){
            console.log('star', star, 'index', index);
            star.classList.add('filled');
            
            for (let i = 0; i < index; i++) {
                stars[i].classList.add('filled');
            }
        }
        else{
            console.log('filled-star', star, 'filled-index', index);
            for (let i = index + 1; i < 5; i++) {
                stars[i].classList.remove('filled');
            }
        } */
        
        const contentInfo = document.querySelector(".content-info");
        contentInfo.innerHTML = '만족도 ' + rate + '점을 주셨네요.<br/>';
        if(rate >= 3){
        	contentInfo.innerHTML += '어떤 점이 좋았나요?';
        }
        else{
        	contentInfo.innerHTML += '어떤 점이 아쉬웠나요?';
        }
        
    });
    
   

});


document.querySelector(".stars-wrapper").addEventListener('mouseleave', () => {
	const starVal = document.querySelector(".m-s-review-stars-selected").value;
		
	for(let i = 1; i <= 5; i++){
		if(i <= starVal){
			document.querySelector(`.star\${i}`).classList.add('filled');
		}
		else{
			document.querySelector(`.star\${i}`).classList.remove('filled');
		}
	}
   
});


document.querySelector(".m-s-review-content").addEventListener('keyup', (e) => {
    // console.log(e.target.value.length);
    const contentLength = document.querySelector(".m-s-review-content-length");
    const maxLength = 500;
    
    if(e.target.value.length >= maxLength){
    	contentLength.nextElementSibling.nextElementSibling.style.color = "red";
    	e.target.value = e.target.value.substr(0, maxLength);
    }
    else{
    	contentLength.nextElementSibling.nextElementSibling.style.color = "black";
    }
    
	contentLength.innerHTML = e.target.value.length;
    
    checkSubmissionAvailablity();
});
</script>
</body>
</html>