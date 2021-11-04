<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="keywords"
	content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="Codedthemes" />
<!-- Favicon icon -->

<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet" href="assets/pages/waves/css/waves.min.css"
	type="text/css" media="all">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/icofont/css/icofont.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/font-awesome/css/font-awesome.min.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">

<meta charset="UTF-8">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#inputch").change(function() {
			if ($("#inputch").is(":checked")) {
				$('#chch').text("감사합니다!");
			} else {
				$('#chch').text("전화번호를 통한 알림서비스에 동의하시나요?");
			}
		});
		$('#idList').DataTable({
			ajax : {
				url : "ajaxMemberList.do",
				dataSrc : '' /* "data"  json type  여긴 변수명을 써주면 된다.*/

			},
			columns : [ {
				data : 'id'
			} ]

		});
		$('#idList_wrapper').hide();  
		$("#id").on("keyup",function() {
		    frm.hiddenId.value="0";
		    console.log(frm.hiddenId.value);
		});
	});

	

	
	function idCk() {
		let cnt=0;
		let id =  document.getElementById("id").value;
		console.log(document.getElementById("id").value);
		if (id == "") {
			$('#idCheck').text("아이디를 입력해주세요.");
			$('#idCheck').css('color', 'red');
		}else{
		 	for(let i=1;i<=$('#idList > tbody tr').length;i++){
		 	
				if($('#idList > tbody tr:nth-child('+i+') td').eq(0).text()==id)
					{
					cnt++;
					}
			}
			if(cnt!=0){
				$('#idCheck').text("아이디 중복입니다.");
				$('#idCheck').css('color', 'red');
			}
			else{
				$('#idCheck').text("사용가능한 아이디입니다.");
				$('#idCheck').css('color', 'blue');
				frm.hiddenId.value="1";
				   console.log(frm.hiddenId.value);
			} 
			
		}

	}

	function Checkitems() {
		if ($("#terms").is(":checked")) {
			if (frm.id.value != "") {
				if(frm.hiddenId.value!="0"){
					if (frm.password.value != "") {
						if (frm.password.value == frm.confirmPassword.value) {
							if (frm.name.value != "") {
								if ((frm.tel.value != "" && $("#inputch").is(
									":checked"))
									|| !($("#inputch").is(":checked"))) {
									if (frm.address.value != "") {
										if (frm.detailAddress.value != "") {
											if (frm.email.value != "") {
													frm.submit();
												}

											else {
												alert("이메일을 입력해주세요.");
												frm.tel.focus();
												return null;
										}
									} else {
										alert("상세주소를 입력하세요");
										frm.detailAddress.focus();
										return null;
									}
								} else {
									alert("주소를 입력해주세요");
									return null;
								}

							} else {
								alert("알림서비스에 동의하셨다면 전화번호를 입력해주세요.");
								frm.tel.focus();
								return null;
							}
						} else {
							alert("이름을 입력해주세요.");
							frm.name.focus();
							return null;
						}
					} else {
						alert("비밀번호가 다릅니다.")
						frm.password.value = "";
						frm.confirmPassword.value = "";
						frm.password.focus();
						return null;
					}
				} else {
					alert("비밀번호를 입력해주세요.");
					frm.password.focus();
					return null;
				}
					}else{
					alert("아이디 중복체크를 해주세요.");
					return null;
					}
				} else {
				alert("아이디를 입력해주세요.");
				frm.id.focus();
				return null;
			}
		} else {
			alert("약관에 동의해주세요.");
			return null;
		}
	};

	window.onload = function() {
		document
				.getElementById("address_kakao")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							document.getElementById("address_kakao").value = " ";
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("address_kakao").value = data.address; // 주소 넣기
											document
													.querySelector(
															"input[name=detailAddress]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
</script>
</head>

<body themebg-pattern="theme1">
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->
	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<form class="md-float-material form-material" id="frm" name="frm"
						action="registerMember.do">
						<div class="text-center">
							<img src="assets/images/logo.png" alt="logo.png">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center txt-primary">회원가입</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-8">
										<div class="form-group form-primary">
											<input type="text" id="id" name="id" class="form-control">
											<span class="form-bar"></span> <label class="float-label">&#11088
												ID를 입력해주세요!</label>
										</div>
										<div class="form-group form-primary">
											<div class="check_font" id="idCheck"></div>
										</div>
									</div>

									<div class="col-sm-4">
										<div class="form-group form-primary">
											<button type="button" id="btid" name="btid" onclick="idCk()"
												class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
												ID체크</button>
											<span class="form-bar"></span>


										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<input type="password" id="password" name="password"
												class="form-control"> <span class="form-bar"></span>
											<label class="float-label">&#11088 비밀번호</label>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<input type="password" id="confirmPassword"
												class="form-control"> <span class="form-bar"></span>
											<label class="float-label">&#11088 비밀번호 확인</label>
										</div>
									</div>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="name" class="form-control"> <span
										class="form-bar"></span> <label class="float-label">&#11088
										이름을 입력해주세요!</label>
								</div>
								<div class="form-group form-primary">
									<input type="tel" name="tel" class="form-control"> <span
										class="form-bar"></span> <label class="float-label">전화번호를
										입력해주세요!</label>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="address" class="form-control"
										id="address_kakao"> <span class="form-bar"></span> <label
										class="float-label">&#11088 주소를 입력해주세요!</label>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="detailAddress" class="form-control">
									<span class="form-bar"></span> <label class="float-label">&#11088
										상세 주소를 입력해주세요!</label>
								</div>
								<div class="row">
									<div class="col-sm-8">
										<div class="form-group form-primary">
											<input type="email" id = "email" name="email" class="form-control">
											<span class="form-bar"></span> <label class="float-label">&#11088
												이메일을 입력해주세요</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group form-primary">
											<button type="button" id="eamilAuthBtn" onclick="emailAuthentication()"
												class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
											<span class="form-bar"></span> 인증번호 받기</button>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-8">
										<div class="form-group form-primary">
											<input type="text" id="emailConfirm" class="form-control">
											<span class="form-bar"></span> <label class="float-label">&#11088
												이메일 인증번호 입력</label>
										</div>
										<div class="form-group form-primary">
											<div class="check_font" id="emCheck"></div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group form-primary">
											<button type="button" id="authCodeCheckBtn" onclick="authCodeCheck()"
												class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
											<span class="form-bar"></span> 인증번호 확인</button>
										</div>
									</div>
									
								</div>

								<br> <br>
								<div class="row m-t-25 text-left">
									<div class="col-md-12">
										<div class="checkbox-fade fade-in-primary">
											<label> <input type="checkbox" id="inputch" value="">
												<span class="cr"><i
													class="cr-icon icofont icofont-ui-check txt-primary"></i></span> <span
												class="text-inverse" id="chch">전화번호를 통한 알림서비스에
													동의하시나요?</span>
											</label>
										</div>
									</div>
									<div class="col-md-12">
										<div class="checkbox-fade fade-in-primary">
											<label> <input type="checkbox" id="terms" value="">
												<span class="cr"><i
													class="cr-icon icofont icofont-ui-check txt-primary"></i></span> <span
												class="text-inverse">개인정보 관리에 대한 <a href="#">&#11088약관</a>을
													읽었고 이에 동의합니다.
											</span>
											</label>
										</div>
									</div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<button type="button"
											class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20"
											onclick="Checkitems()">가입하기!!</button>
									</div>
								</div>
								<hr />
								<div class="row">
									<div class="col-md-10">
										<p class="text-inverse text-left m-b-0">감사합니다.</p>
										<br>
										<p class="text-inverse text-left">
											<a href="home.do"><b>메인페이지로 돌아가기</b></a>
										</p>
									</div>
									<div class="col-md-2">
										<img src="assets/images/auth/Logo-small-bottom.png"
											alt="small-logo.png">
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="hiddenId" value="0"> <input
							type="hidden" name="author" value="0">
					</form>
					<table id="idList">
						<thead>
							<tr>
								<th>id</th>
							</tr>
						</thead>

					</table>
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>

	<!-- Required Jquery -->
	<script type="text/javascript" src="assets/js/jquery/jquery.min.js "></script>
	<script type="text/javascript"
		src="assets/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="assets/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script src="assets/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script type="text/javascript" src="assets/js/common-pages.js"></script>
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
</body>
</html>