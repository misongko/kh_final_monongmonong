<%@page import="com.kh.monong.member.model.dto.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="모농모농-회원정보수정"></jsp:param>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/member.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#btn-email-sendKey{
		margin-top: 10px;
		float: right;
	}
</style>
<div id="member-update-container" class="mx-auto mt-10">
	<div class="mb-3 text-center">
		<h1>회원정보수정</h1>
	</div>	
	<nav class="nav justify-content-end">
		<a class="nav-link" href="${pageContext.request.contextPath}/member/memberPwUpdate.do"><h5>비밀번호 변경</h5></a>
	</nav>
	<form:form name="memberUpdateFrm" 
			   action="${pageContext.request.contextPath}/member/memberUpdate.do" 
			   method="post"
			   id="memberUpdateFrm">

		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<label for="memberId">아이디</label>
				<sec:authentication property="principal.username"  var="memberId"/>
				<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" value='${memberId}'readonly required/>
				<br />
			</div>
		</div>

		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<label for="memberName">이름<span class="enroll-form-required">*</span></label>
				<input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" value='<sec:authentication property="principal.memberName"/>'required/>
				<br />
			</div>
		</div>
		
		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<label for="memberPhone">전화번호<span class="enroll-form-required">*</span></label>
				<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="memberPhone" id="memberPhone" maxlength="11" value='<sec:authentication property="principal.memberPhone"/>'required/>
				<span class="invalid-feedback feedback-phone">띄어쓰기없이	번호만 입력해주세요.</span>
				<br />
			</div>
		</div>
		
		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<label for="memberEmail">이메일<span class="enroll-form-required">*</span></label> 
				<span id="memberEmail-container"> 
					<input type="email" name="memberEmail" class="form-control" id="memberEmail"
					placeholder="abc@xyz.com"
					value='<sec:authentication property="principal.memberEmail"/>' required> 
					<span class="valid-feedback feedback-email">사용가능한 이메일입니다.</span> 
					<span class="invalid-feedback feedback-email">이미 사용중이거나 유효하지 않은 이메일형식입니다.</span> 
					<input type="hidden" id="emailValid" value="1" /><!-- 사용불가 0, 사용가능 1 -->
				</span> 
				<input type="button" class="enroll-info-btn btn btn-outline-success" id="btn-email-sendKey" value="이메일 인증"/><!-- 완성후 기능 살려놓기 -->
			</div>
		</div>
		
		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<input type="text" id="emailKey" placeholder="인증코드를 입력하세요."/><!-- 프로젝트 완성 후 readolny해제 -->
				<input type="hidden" id="emailKeyValid" value="1" /><!-- 불일치 0, 일치 1 -->
				<input type="button" class="enroll-info-btn btn btn-outline-success" id="btn-email-enterKey" value="확인"/><!-- 프로젝트 완성 후 disabled해제 -->
			</div>
		</div>
	
		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<label for="memberAddress">주소<span class="enroll-form-required">*</span></label> 
				<input type="text" name="memberAddress" class="form-control" id="address" value="<sec:authentication property='principal.memberAddress'/>" readonly required>
			</div>
		</div>

		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">
				<label for="address-ex">상세주소</label> 
				<sec:authentication property='principal.memberAddressEx'  var="addrEx"/>
				<input type="text" name="memberAddressEx" class="form-control" id="address-ex" value="${addrEx != null? addrEx : ''}">
			</div>
		</div>
		
		<div class="row mb-2 col-md-13 justify-content-center">
			<div class="col-sm-9">	
				<label for="memberBirthday">생일<span class="enroll-form-required">*</span></label>
				<input type="date" class="form-control" placeholder="생일" name="memberBirthday" id="memberBirthday" value='<sec:authentication property="principal.memberBirthday"/>' required/>
				<br />
			</div>
		</div>
		
		<br />
		<div class="mb-3 text-center">
			<input type="submit" class="btn btn-EA5C2B-reverse" value="수정" >&nbsp;
			<input type="reset" class="btn btn-outline-success" value="취소">
		</div>
	</form:form>
	<form name="memberQuitFrm" action="${pageContext.request.contextPath}/member/memberQuit.do" method="POST">
		<button type="button" id="btn-memberQuit">회원탈퇴</button>
		<div class="quit-gide" style="display:none;">탈퇴하시려면 아래 문장을 똑같이 작성해 주세요.</div>
		<div>
			<input type="hidden" name="chkQuitGuide" style="width: 500px;" class="quit-gide" value="회원 ${memberId}는 모농모농 회원 탈퇴를 신청합니다." readOnly>
		</div>
		<div>
			<input type="hidden" name="chkQuit" style="width: 500px;"/>
		</div>
		<button type="submit" class="bnt-quit-submit" style="display:none;">탈퇴신청</button>
		<sec:csrfInput />
	</form>
</div>
<script>
/**
 * 탈퇴확인 폼
 */
document.memberQuitFrm.addEventListener('submit', (e)=>{
	e.preventDefault();
	console.log("핸들러 작동")
	const {chkQuit, chkQuitGuide} = e.target;
	if(chkQuit.value != chkQuitGuide.value){
		console.log("글자틀림")
		return;
	}
	else{
		if(confirm("정말로 탈퇴하시겠습니까?")){
			console.log("탈퇴처리하기")
			e.target.submit();			
		}
	}
});

document.querySelector("#btn-memberQuit").addEventListener('click', (e)=>{
	const frm = document.memberQuitFrm;
	const {chkQuit, chkQuitGuide} = frm;
	const guideText = frm.querySelector(".quit-gide");
	const btnSubmit = frm.querySelector(".bnt-quit-submit");
	console.log(guideText, chkQuit, chkQuitGuide)
	
	guideText.style.display = "block";
	btnSubmit.style.display = "block";
	chkQuit.type = "text";
	chkQuitGuide.type = "text";
})


/**
 * 제출 전 입력값 valid확인
 */
document.memberUpdateFrm.addEventListener('submit', (e) => {	
	if(emailValid.value === "0"){
		e.preventDefault();
		alert("유효한 이메일을 입력해주세요.");
		return;
	}
	
	//이메일 인증
	/*테스트용 가입처리시 인증 불가능. 전체 사이트 완성 후 주석풀기
	*/
	if(emailKeyValid === "0"){
		e.preventDefault();
		alert("이메일 인증코드를 확인해주세요.");
		return;
	}
});

/**
 * 전화번호 자릿수
 */
const invalidPhoneFeedback = document.querySelector(".invalid-feedback.feedback-phone");
document.querySelector("#memberPhone").addEventListener("blur", (e)=>{
	const phone = e.target;
	const regExp = /^[0-9]{9,12}$/;
	
	if(!regExp.test(phone.value)){
		invalidPhoneFeedback.style.display = "inline";
		phone.value = "";
	}
	else{
		invalidPhoneFeedback.style.display = "none";
	}
});

/**
 * email 유효성, 중복
 */
const rememberEmail = document.querySelector("#memberEmail").value;

document.querySelector("#memberEmail").addEventListener('keyup', (e) => {
const validEmailFeedBack = document.querySelector(".valid-feedback.feedback-email");
const invalidEmailFeedBack = document.querySelector(".invalid-feedback.feedback-email");
const emailKey = document.querySelector("#emailKey");
console.log(emailKey);
	//기존 이메일을 수정했을 경우 유효성 검사를 위해 0으로 변경
	emailValid.value = "0";
	emailKeyValid.value = "0";
	
	const {value : email} = e.target;
	console.log(email);	

	if(email.length < 7){
		emailValid.value = "0";
		emailKeyValid.value = "0";
		emamilKey.setAttribute('required');
		invalidEmailFeedBack.style.display = "none";
		validEmailFeedBack.style.display = "none";
		return;
	}
	//post요청 전 기존 이메일 다시 입력시 검사하지 않고 리턴 
	if(rememberEmail === email){
		emailValid.value = "1";
		emailKeyValid.value = "1";
		return;
	}
	
	const regExp = /^[\w\d]{4,}@[\w]+(\.[\w]+){1,3}$/;	
	
	const headers = {};
	headers['${_csrf.headerName}'] = '${_csrf.token}';
	console.log(headers);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/checkEmailDuplicate.do",
		method : "POST",
		headers, 
		data : {email},
		success(response){
			const {available} = response;
			console.log(available);//xml mapper의존주석처리, 메세지컨버터의존활성화함 
			
			if(available && regExp.test(email)){
				invalidEmailFeedBack.style.display = "none";
				validEmailFeedBack.style.display = "inline";
				emailValid.value = "1";
			}
			else {
				invalidEmailFeedBack.style.display = "inline";
				validEmailFeedBack.style.display = "none";
				emailValid.value = "0";
			}
			
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
		}
	});
	
});

//주소입력 라이브러리
document.querySelector("#address").addEventListener('click', function(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            document.querySelector("#address").value = data.address;
            document.querySelector("#address-ex").focus();
        }
    }).open();
});  

//이메일 인증코드 전송
document.querySelector("#btn-email-sendKey").addEventListener('click', (e)=>{
	if(emailValid.value == "0"){
		alert("유효한 이메일을 입력해주세요.");
		return;
	}
	
	//인증코드 전송 클릭시 입력된 이메일value 가져오기
	const newEmail = document.querySelector("#memberEmail").value;
	if(rememberEmail == newEmail){
		alert("이미 인증된 이메일입니다.");
		return;
	}
	
	const headers = {};
	headers['${_csrf.headerName}'] = '${_csrf.token}';
	console.log(headers);
	
	const email = document.querySelector("#memberEmail").value;
	console.log(email);
	$.ajax({
		url : "${pageContext.request.contextPath}/member/sendEmailKey.do",
		method : "POST",
		headers, 
		data : {email},
		success(response){
			const {msg} = response;
			alert(msg);
			
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
		}
	});
	
});

//인증코드 확인
document.querySelector("#btn-email-enterKey").addEventListener("click", (e)=>{
	const emailKey = document.querySelector("#emailKey");
	const email = document.querySelector("#memberEmail");
	const headers = {};
	headers['${_csrf.headerName}'] = '${_csrf.token}';
	$.ajax({
		url : "${pageContext.request.contextPath}/member/checkEmailKey.do",
		method : "POST",
		headers,
		data : {"email" : email.value, "emailKey" : emailKey.value},
		success(response){
			const {isIdentified, msg} = response;
			if(isIdentified){
				emailKeyValid.value = "1";
				e.disabled = true;
				email.readOnly = true;
				emailKey.readOnly = true;	
			}
			alert(msg);
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
		}		
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>