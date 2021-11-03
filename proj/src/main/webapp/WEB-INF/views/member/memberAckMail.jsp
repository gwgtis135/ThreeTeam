<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center"><h1>회원 가입을 축하드립니다!!</h1>
<h1>
${member.id } 님에게 발송한 이메일의 인증번호입력을 완료하시면 회원가입이 완료됩니다!!</h1></div>
<div>
<button onclick="AckMailInsert.do">인증번호 입력하러가기</button>
</div>
</body>
</html>