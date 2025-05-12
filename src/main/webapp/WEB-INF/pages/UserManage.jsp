<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>


    <meta charset="UTF-8">
    <title>管理画面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Site.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>

        <style>
        * {
				font-family:'MS Mincho','MS PMincho','MS Gothic','MS PGothic', Arial, Helvetica, sans-serif;
			}
			body, html {
			    height:100%;
			    background-color:#e9ebee;
			}
			body {
				height:auto;
			    margin:8px;
			}
			.TOPBAR
			{
				width:100%; /* 幅：全画面 */
				min-width:1000px;
				height:50px; /* 高さ：50px */
				background-color:#5B9BD5; /* 背景色：#5B9BD5 */
				color:white; /* テキスト色：ホワイト */
				font-size:24px; /* フォントサイズ：24px */
				font-weight:bold; /* フォントの太さ：太 */
				text-align:center; /* テキストの位置：トップバーの中央 */
				display:flex; /* テキストの位置：トップバーの中央 */
				justify-content:center; /* テキストの位置：トップバーの中央 */
				align-items:center; /* テキストの位置：トップバーの中央 */
				margin-bottom:8px;/* 白色背景枠との間の幅：8px */
			}
			.TITLE
			{
			    font-size:24px;
			    font-weight:bold;
			}
			.TEXTBOX
			{
			    color:#494949;
			    border:1px solid #69A4D8;
			    border-radius:5px;
			    height:30px;
			    font-size:18px;
			    padding-left:5px;
			    padding-right:5px;
			}
			.TEXTAREA
			{
			    color:#494949;
			    border:1px solid #69A4D8;
			    border-radius:5px;
			    font-size:18px;
			    padding-left:5px;
			    padding-right:5px;
			    resize:none;
			}
			.BUTTON
			{
			    background-color:#5B9BD5;
			    color:white;
			    border:1px solid #43729D;
			    border-radius:5px;
			    height:36px;
			    font-size:18px;
			    font-weight:bold;
			}
			.BUTTONDISABLE {
			    background-color:#dddddd;
			    color:white;
			    border:1px solid #cccccc;
			    border-radius:5px;
			    height:36px;
			    font-size:18px;
			    font-weight:bold;
			}
			.BUTTONDISABLE:hover {
			    cursor:pointer;
			}
			.LABEL {
			    color:#494949;
			    font-size:18px;
			    text-align:left;
			}
			.SELECT {
			    color:#494949;
			    border:1px solid #69A4D8;
			    border-radius:5px;
			    height:30px;
			    font-size:18px;
			}
			.TITLELINE {
			    border-bottom:3px solid #5B9BD5;
			    width:100%;
			    margin-top:5px;
			    margin-bottom:5px;
			}
			.TEXTBOX:focus, .TEXTAREA:focus, .SELECT:focus {
				outline:none !important;
				border-color:red;
				box-shadow:0 0 5px #ce7171;
			}
			.BUTTON:hover {
				cursor:pointer;
			}
			.BUTTON:focus {
				outline:none !important;
				border-color:#43729D;
				box-shadow:0 0 5px #608db8;
			}
			tr {
			    height:35px;
			    font-size:18px;
			}
			td {
			    text-align:left;
			    width:auto;
			}
			a {
			    font-size:18px;
			}
			.row {
				min-height:35px;
				padding-bottom:3px;
			}
			td {
				border:1px solid #69A4D8;
			}
			.TEXTBOX {
				width:300px;
			}
			.TEXTAREA {
				width:300px;
				height:100px;
				resize:none;
			}
			.PARENTCONTAINER
			{
				width:1000px; /* 白い背景の枠の幅：1000px */
				height:auto; /* 白い背景の枠の高さ：ウィンドウのサイズに合わせる */
				min-height:calc(100% - 58px); /* 白い背景の枠の高さ：ウィンドウのサイズに合わせる */
				margin:0 auto; /* 白い背景の枠の位置：全画面の均等割付 */
				display:block; /* 白い背景の枠の位置：全画面の均等割付 */
				background-color:white; /* 背景色：ホワイト */
			}
			#container
			{
		    	width: 1000px;
		    	margin: 0 auto;
		    	background-color:white;
		    }
    </style>
</head>
<body>
<div class="TOPBAR">ユーザー管理画面</div>
<div class="PARENTCONTAINER">
    <form id="Form1" method="POST">
    <table style="border: 2px solid #69A4D8; width: 100%;">
        <tr>

            <td style="width: 170px">表示区分:
                <select class="Select" id="statusSelect" name="type">
                    <option value="0">新規登録申請中</option>
                    <option value="1">新規登録発行中</option>
                    <option value="2">登録済</option>
                </select>
            </td>
			<td style="width: 500px; text-align: right; border: none;">
				<input type="button" class="BUTTON" name="検索" id="btn検索" value="検索" style="width: 130px;">
			</td>

        </tr>
    </table>
</form>
</div>
    <div id="container">
        <tiles:insertAttribute name="content" />
    </div>
</body>

<script type="text/javascript">
/*$(document).ready(function(){
    $.ajax({
        url: "${pageContext.request.contextPath}/UserManage",
        type: "POST",
        data: $("#Form1").serialize(),
        success: function(data){
            $("#container").html(data); // 서버에서 반환한 HTML을 그대로 삽입
        },
        error: function(){
            alert("システムエラーが発生しました");
        }
    });
});*/
$("#btn検索").click(function(){

    $.ajax({
        url: "${pageContext.request.contextPath}/ChangeStatus",
        type: "post",
        data: $("#Form1").serialize(),
        success: function(data){
            $("#container").html(data);
        },
        error: function(){
            alert("システムエラーが発生しました");
        }
    });
});

$(document).on('change', "[id^='showNumber']", function () {
	if ($('#totalCount').text() == "0") {
		return;
	}
	$.ajax({
		url: "${pageContext.request.contextPath}/GetGetPage",
		type: "post",
		data: { showNumber:$("#showNumber").val(), currentPage: 1 },
		success: function (data) {
			$("#container").html(data);
		},
		error: function () {
			alert("システムエラーが発生しました");
		}
	});
});
$(document).on('change',"[id='currentPage']",function(){
	if($('#totalCount').text()=="0"){
		return;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/GetGetPage",
		type:"post",
		data:{showNumber:$("#showNumber").val(), currentPage:$('#currentPage').val()},
		success:function(data){
			$("#container").html(data);
		},
		error:function(){
			alert("システムエラーが発生しました");
		}
	});
});
function sort(obj){
	if($('#totalCount').text()=="0"){
		return;
	}

	var span=$(obj).find("span");//sort함수에 넘겨진obj(this-<td>태그오브젝트)안에 있는<span>태그오브젝트를 취득한다

	var sortOrder=span.text().trim();//<span>태그로 감싸진 텍스트이 앞위 공백을 제거한다.공백을 제거한 후 남아 있는 텍스트가 빈 문자열(공백),특정 기호(▲또는▼)로 전환된다

	var sortColumn = $(obj).text().replace("▲", "").replace("▼", "").trim();//<td>태그의 텍스트(열의 타이틀)에서 소트순을 나타내는 문자를 지우면 현재 소트된 열이름을 습득할수있다

	$("#searchList").find("tr:nth-child(1) td").each(function(){//'serchList.find는 검색결과일람',tr:nth-child(1) td는 2행째,td는안에있는열(<td>태그)
		$(this).find("span").text("");//그 열에 감싸진<span>태그의 텍스트를 제거
	});

	if(sortOrder == "" || sortOrder == "▼") {
		sortOrder = "▲";
	}
	else{
		sortOrder = "▼";
	}

	$('#previousPage').attr("src","${pageContext.request.contextPath}/img/left_triangle_disable.png");
	$('#currentPage').val(1);
	$('#nextPage').attr("src","${pageContext.request.contextPath}/img/right_triangle.png");

	$.ajax({
		url:"${pageContext.request.contextPath}/SortSort",
		type:"post",
		data: {  sortColumn: sortColumn,  sortOrder: sortOrder  },
		success:function(data){
			$("#container").html(data);
		},
		error:function(){
			alert("システムエラーが発生しました");
		}
	});
}

/*$("#statusSelect").change(function(){
    $.ajax({
        url: "${pageContext.request.contextPath}/ChangeStatus",
        type: "POST",
        data: { status: $(this).val() }, // 선택된 값을 서버로 전달
        success: function(data) {
            $("#container").html(data); // 서버에서 반환한 데이터를 업데이트
        },
        error: function() {
            alert("システムエラーが発生しました");
        }
    });
});*/



</script>
</html>