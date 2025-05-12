<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title>ユーザー情報新規登録画面</title>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Site.css" />

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"
	type="text/javascript"></script>
<style>
.row {
	min-height: 35px;
	padding-bottom: 3px;
}

td {
	border: 1px solid #69A4D8;
}

.TEXTBOX {
	width: 300px;
}

.TEXTAREA {
	width: 300px;
	height: 100px;
}

.PARENTCONTAINER {
	width: 1000px; /* 白い背景の枠の幅：1000px */
	height: auto; /* 白い背景の枠の高さ：ウィンドウのサイズに合わせる */
	min-height: calc(100% - 58px); /* 白い背景の枠の高さ：ウィンドウのサイズに合わせる */
	margin: 0 auto; /* 白い背景の枠の位置：全画面の均等割付 */
	display: block; /* 白い背景の枠の位置：全画面の均等割付 */
	background-color: white; /* 背景色：ホワイト */
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-xs-12 TOPBAR">
			ユーザー情報新規登録
			<div class="TOPBAR"></div>
		</div>
	</div>
	<div class="PARENTCONTAINER">
		<div class="container-fluid">
			<form id="Form1" method="post" action="UserInfoRegister">
				<div class="row">
					<div class="col-xs-12 TITLE">
						基本情報新規登録確認
						<div class="TITLELINE"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">ユーザーID</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="userId" id="txtユーザーID" data-type="alphanumeric" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">メールアドレス</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="email" id="txtメール" data-type="email" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">パスワード</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="password" id="txtパスワード" data-type="alphanumeric" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">パスワード確認</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="checkpassword" type="text" data-type="alphanumeric" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 TITLE">
						プロファイル新規登録確認
						<div class="TITLELINE"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">ニックネーム</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="nickName" id="txtニックネーム" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">氏名</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="userName" id="txt氏名" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">性別</div>

					<div class="col-xs-8">
						<input required name="sex" type="radio" value="1"><span>男</span>
						<input required name="sex" type="radio" value="2"><span>女</span>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">生年月日</div>
					<div class="col-xs-8">
						<select required class="SELECT" name="birthday1" id="txt生年" style="width:80px">
   						 <option selected=""></option>
						</select>

						<script>
    						document.addEventListener("DOMContentLoaded", function() {
        					const select = document.getElementById("txt生年");
        					for (let year = 2025; year >= 1925; year--) {
           					let option = document.createElement("option");
            				option.value = year;
            				option.textContent = year + "年";  // ✅ 연도 값 + "年" 추가
            				select.appendChild(option);
        						}
    						});
						</script>

						<select required class="SELECT" name="birthday2" id="txt生月" style="width:50px">
    						<option selected=""></option>
						</select>

						<select required class="SELECT" name="birthday3" id="txt生日" style="width:50px">
    						<option selected=""></option>
						</select>

						<script>
   							document.addEventListener("DOMContentLoaded", function() {
        					// 月 생성 (1월~12월) - 앞에 0 추가
        					const monthSelect = document.getElementById("txt生月");
        					for (let month = 1; month <= 12; month++) {
            					let option = document.createElement("option");
            					let monthValue = month < 10 ? "0" + month : month; // ✅ 앞에 0 추가
            					option.value = monthValue;
            					option.innerText = monthValue + "月";
            					monthSelect.appendChild(option);
        					}

        					// 日 생성 (1일~31일) - 앞에 0 추가
        					const daySelect = document.getElementById("txt生日");
        					for (let day = 1; day <= 31; day++) {
            					let option = document.createElement("option");
            					let dayValue = day < 10 ? "0" + day : day; // ✅ 앞에 0 추가
           						option.value = dayValue;
            					option.innerText = dayValue + "日";
            					daySelect.appendChild(option);
        					}
    					});
					</script>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">電話番号</div>
					<div class="col-xs-8">
						<input required maxlength="3" class="TEXTBOX" type="text" name="tel1" data-type="numeric" id="txt電話番号" style="width: 60px">
						<input required maxlength="4" class="TEXTBOX" name="tel2" type="text" data-type="numeric" style="width: 120px">
						<input required maxlength="4" class="TEXTBOX" name="tel3" type="text" data-type="numeric" style="width: 120px">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">郵便番号</div>
					<div class="col-xs-8">
						<input required maxlength="3" class="TEXTBOX" type="text" data-type="numeric" class="TEXTBOX" name="postcode1" style="width: 70px">
						<input required maxlength="4" class="TEXTBOX" name="postcode2" data-type="numeric" type="text" data-type="numeric" style="width: 120px">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">住所</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="address" id="txt住所" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3"></div>
					<div class="col-xs-8">
						<input class="TEXTBOX" name="addressLine" type="text" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">入社日</div>
					<div class="col-xs-8">
						<select required class="SELECT" name="hireDate1" id="txt入社年" style="width:80px">
    						<option selected=""></option>
						</select>

						<script>
    						document.addEventListener("DOMContentLoaded", function() {
        					const select = document.getElementById("txt入社年");
        					for (let year = 2025; year >= 1925; year--) {
            					let option = document.createElement("option");
            					option.value = year;
            					option.textContent = year + "年";  // ✅ 연도 값 + "年" 추가
            					select.appendChild(option);
        						}
    						});
						</script>

						<select required class="SELECT" name="hireDate2" id="txt入社月" style="width:50px">
    						<option value=""></option>
						</select>

						<select required class="SELECT" name="hireDate3" id="txt入社日" style="width:50px">
    						<option value=""></option>
						</select>

						<script>
    						document.addEventListener("DOMContentLoaded", function() {
        					// 月 생성 (1월~12월) - 앞에 0 추가
        					const monthSelect = document.getElementById("txt入社月");
        					for (let month = 1; month <= 12; month++) {
            					let option = document.createElement("option");
           						let monthValue = month < 10 ? "0" + month : month; // ✅ 앞에 0 추가
            					option.value = monthValue;
            					option.innerText = monthValue + "月";
            					monthSelect.appendChild(option);
        						}

        					// 日 생성 (1일~31일) - 앞에 0 추가
        					const daySelect = document.getElementById("txt入社日");
        					for (let day = 1; day <= 31; day++) {
            					let option = document.createElement("option");
            					let dayValue = day < 10 ? "0" + day : day; // ✅ 앞에 0 추가
            					option.value = dayValue;
            					option.innerText = dayValue + "日";
            					daySelect.appendChild(option);
        					}
    					});
					</script>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">所属</div>
					<div class="col-xs-8">
						<select required class="SELECT" name="affiliation" id="cbx所属"
							style="width: 100px">
							<option selected=""></option>
							<option value="営業部">営業部</option>
							<option value="技術部">技術部</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">役職</div>
					<div class="col-xs-8">
						<input required class="TEXTBOX" name="position" id="txt役職" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">趣味</div>
					<div class="col-xs-8">
						<input class="TEXTBOX" name="hobby" id="txt趣味" type="text"
							value="">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3">特技</div>
					<div class="col-xs-8">
						<input class="TEXTBOX" name="specialSkill" id="txt特技" type="text"
							value="">
					</div>
				</div>

				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-3" style="vertical-align: top; padding-top: 3px">
						座右銘</div>
					<div class="col-xs-8">
						<textarea class="TEXTAREA" cols="20" id="txt座右銘" name="comment"
							rows="2"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-2"></div>
					<div class="col-xs-4">
						<input type="button" class="BUTTON" id="btn登録" value="登録"
							style="width: 180px" onclick="submitForm()">
					</div>
					<div class="col-xs-6">
						<input type="button" class="BUTTON" value="キャンセル"
							style="width: 180px;" onclick="location.href='/OfficeSystem/Login'">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
function submitForm() {
    // エラーメッセージを格納する配列 (에러 메시지를 저장할 배열)
    var errors = [];

    // フォームの各入力要素をチェック (폼의 모든 입력 요소를 반복 검증)
    $('input, select').each(function() { //폼의 모든 input,select를 반복 검사
        var element = $(this); //jQuery를 사용하여 현재 반복 중인 요소(this)를 jQuery객체로 변환하는 코드 여기서 jQuery는 javascript의 라이브러리로 웹 개발에서 html요소 조작,이벤트처리 ajax요청 등을 쉽게 할 수 있도록 도와주는 도구
        var value = element.val().trim();  // 입력값 앞뒤 공백 제거
        var dataType = element.data('type');  // 요소의 데이터 타입 속성값 가져오기
        var name = element.attr('name');  // 요소의 name 속성 가져오기

        // 必須フィールドのチェック (필수 입력 필드 확인)
        if (element.prop('required') && value === '') {
            errors.push(name + 'は必須です。');  // 필수 필드가 비어 있으면 에러 메시지 추가
        }

        // 半角数字のチェック (숫자만 입력 가능 여부 확인)
        if (dataType === 'numeric' && !/^\d+$/.test(value)) {
            errors.push(name + 'は半角数字で入力してください。');  // 숫자가 아닐 경우 에러 추가
        }

        // 半角英数字のチェック (영문자+숫자만 입력 가능 여부 확인)
        if (dataType === 'alphanumeric' && !/^[a-zA-Z0-9]+$/.test(value)) {
            errors.push(name + 'は半角英数で入力してください。');  // 특수문자나 공백 포함 시 에러 추가
        }

        // メールアドレスの形式チェック (이메일 형식 확인)
        if (dataType === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
            errors.push(name + 'は有効なメールアドレスを入力してください。');  // 이메일 형식이 틀릴 경우 에러 추가
        }
    });

    // パスワードの一致確認 (비밀번호 확인)
    if ($('input[name="password"]').val() != $('input[name="checkPassword"]').val()) {
        errors.push("パスワードが一致していません。");  // 비밀번호 입력값이 다를 경우 에러 추가
    }

    // 生年月日チェック (생년월일 확인)
    var date = new Date($('select[name="birthday1"]').val() + '-' + $('select[name="birthday2"]').val() + '-' + $('select[name="birthday3"]').val());
    var month = date.getMonth() + 1;  // getMonth()는 0부터 시작하므로 +1 처리

    if ($('select[name="birthday2"]').val() != month) {
        errors.push("生年月日は不正な日付です。");  // 입력한 월 값과 실제 월 값이 다르면 에러 추가
    }

    // 入社日チェック (입사일 확인)
    date = new Date($('select[name="hireDate1"]').val() + '-' + $('select[name="hireDate2"]').val() + '-' + $('select[name="hireDate3"]').val());
    month = date.getMonth() + 1;

    if ($('select[name="hireDate2"]').val() != month) {
        errors.push("入社日は不正な日付です。");  // 입력한 월 값과 실제 월 값이 다르면 에러 추가
    }

    // エラーがあればアラート表示しフォーム送信を中止 (에러가 있으면 알림창 출력 후 폼 제출 방지)
    if (errors.length > 0) {
        alert(errors.join('\n'));  // 에러 메시지들을 줄 단위로 표시
        return;  // 폼 제출 중단
    }

	$("#btn登録").click(function() {
		$.ajax({url : "${pageContext.request.contextPath}/registerUser",
		type : "post",
		data : $("#Form1").serialize(),//폼 데이터를 URL인코딩된 문자열로 변환한다
		success : function(data) {//success는 콜백함수 서버에서 데이터를 정상적으로 응답받으면 실행된다
		window.location.href = "${pageContext.request.contextPath}/UserInfoSuccess";
		},
		error : function() {
		alert("システムエラーが発生しました");
			}
				});
		});
}
</script>

</html>