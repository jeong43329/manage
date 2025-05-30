<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>ログイン画面d</title>
		<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>

		<style type="text/css">


			.LABEL{
				color:red;
				margin:0 auto;
				display:block;
				text-align:center;
			}
			.CONTAINER
			{
				width:250px;
				margin:0 auto;
				margin-bottom:5px;
			}
			.TEXTBOX
			{
				width:250px;
				height:30px;
				margin-bottom:5px;
			}
			.LEFT
			{
				float:left;
			}
			.RIGHT
			{
				float:right;
			}
			.BUTTON
			{
				width:250px;
			}
			.TEXTAREA
			{
				width:500px;
				height:200px;
				margin:0 auto;
				display:block;
				resize:none;
				clear:both;
			}
		</style>


	</head>
<body>
	<form method="post" action="/OfficeSystem/Login">
	<label class="LABEL">  ${error}  </label>
	<div class="CONTAINER">
		<input type="text" class="TEXTBOX" id="userId" name="userId" placeholder="ユーザーID"/>
		<input type="password" class="TEXTBOX" id="password" name="password" placeholder="パスワード"/>
		<input type="text" class="TEXTBOX" id="email" name="email" placeholder="メールアドレス"/>
		<input type="button" class="BUTTON" value="ログイン" />
		<a href="" class="LEFT" >パスワード忘れ</a>
		<a href="" class="RIGHT" >新規登録</a>
	</div>
	</form>
	<textarea class="TEXTAREA">お知らせ</textarea>
</body>
<script type="text/ecmascript">
		$(".BUTTON").click(function () {
			if($("#userId").val() == "") {
				alert("ユーザーIDを入力してください");
				return false;
			}

			if($("#password").val() == "") {
				alert("パスワードを入力してください");
				return false;
			}

			if($("#email").val() == "") {
				alert("メールアドレスを入力してください");
				return false;
			}


			$.ajax({
				url:"/OfficeSystem/Login",
				type:"post",
				data:{userId: $("#userId").val(), password: $("#password").val(), email: $("#email").val()},//전하는 값
				success: function(data) {
					if(data == "") {
						window.location.href = "次の画面"
					}else {
						alert(data);
					}
				},
				error: function(){
					alert("システムエラーが発生しました");
				}
			});
		});
		</script>

</html>