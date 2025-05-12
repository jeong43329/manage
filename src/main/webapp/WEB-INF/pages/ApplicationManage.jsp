<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <html>

  <head>
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title></title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link type="text/css" rel="new stylesheet" href="${pageContext.request.contextPath}/css/Site.css" />

    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <!--<script src="${pageContext.request.contextPath}/js/jquery.cookie.js" type="text/javascript"></script>-->
    <!--<script src="${pageContext.request.contextPath}/js/jquery.resize.js" type="text/javascript"></script>-->


    <style>
      .TopMenuContainer {
        width: 100%;
        height: 50px;
        display: block;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #5B9BD5;
        z-index: 100;
      }

      .TopMenu {
        width: 1012px;
        height: 50px;
        display: block;
        position: fixed;
        top: 0;
        background-color: #5B9BD5;
        z-index: 101;
      }

      .TopMenuTitle {
        float: left;
        padding-top: 5px;
      }

      .TopMenuSettingImgContainer {
        float: right;
        width: 40px;
        height: 100%;
        right: 0px;
      }

      .TopMenuDropDownComandContainer {
        float: right;
        height: 100%;
      }

      .TopMenuDropDownComandContainer:hover .TopMenuComandContent {
        display: block !important;
      }

      .TopMenuComandContent {
        position: absolute;
        top: 45px;
        right: 0px;
        width: 100px;
        font-size: 12px;
        padding: 3px;
        border: 1px solid #0094ff;
        display: none !important;
        background-color: white;
        z-index: 90;
      }

      .TopMenuSettingImg {
        position: absolute;
        width: 40px;
        height: 40px;
        right: 0px;
      }

      .TopMenuNick {
        float: right;
        font-size: 18px;
        padding-top: 15px;
      }

      .LeftMenu {
        width: 200px;
        height: 100vh;
        background-color: #ffffff;
        color: white;
        position: fixed;
        top: 60px;
        padding: 10px;
        z-index: 90;
      }

      .RightMenu {
        width: 0px;
        height: 100vh;
        background-color: #ffffff;
        color: white;
        position: fixed;
        right: 0;
        top: 60px;
        padding: 10px;
        z-index: 90;
      }

      .TopContainer {
        width: 1012px;
        height: 50xp;
        position: relative;
        left: calc(50% - 506px);
        /* 回答3・追加：画面を中央に寄せる */
      }

      .MidContainer {
        width: 802px;
        height: auto;
        min-height: 100%;
        display: inline-block;
        margin-top: 60px;
        margin-left: 210px;
        margin-right: 0px;
        margin-bottom: 0;
        background-color: #ffffff;
        padding: 10px;
        /* overflow-y:scroll; */
        /* 回答1・削除：白部分の縦スクロールバーを無くす */
      }

      #Form1 {
        height: calc(100vh - 60px);
      }

      .ErrorMsgSuperContainer {
        background-color: rgba(100, 100, 100, 0.5);
      }

      .ErrorMsgContainer1 {
        width: 700px;
        height: auto;
        margin: 0 auto;
        background-color: white;
        border: 1px solid #cccccc;
        padding: 10px;
      }

      .ErrorMsgContent {
        border-bottom: 1px solid #cccccc;
        text-align: left;
      }

      .ErrorMsgSuperContainer span {
        margin-left: 10px;
        margin-right: 10px;
        word-break: break-all;
        font-size: 16px;
      }

      .ErrorMsgClose {
        font-size: 16px;
      }

      #divLoading {
        background-color: rgba(100, 100, 100, 0.5);
      }

      span {
        font-size: 18px;
        color: black;
      }
    </style>


    <style>
      #検索結果一覧 td {
        padding: 3px;
        border: 1px solid #0094ff;
        font-size: 13px;
      }

      #検索結果一覧 tr:first-child td {
        border-top: 0;
      }

      #検索結果一覧 tr:last-child td {
        border-bottom: 0;
      }

      #検索結果一覧 tr td:first-child {
        border-left: 0;
      }

      #検索結果一覧 tr td:last-child {
        border-right: 0;
      }

      #検索結果一覧 tr:hover {
        background-color: peachpuff;
      }

      #tb改ページ,
      #tb改ページ td {
        border: none;
      }

      #btn検索条件表示 {
        background-color: rgba(128, 128, 128, 0.53);
        border-color: white;
      }

      #tb現ページ td {
        border: none;
      }

      .email {
        display: none;
      }
    </style>




    <script>
      function ShowLoading() {
        $("#divLoading").toggleClass('hide loading');
      }

      function HideLoading() {
        $("#divLoading").toggleClass('loading hide');
      }

      function ShowErrMsg(errmsg) {
        if ($(window).width() < $(".ErrorMsgContainer1").width()) {
          $(".ErrorMsgContainer1").css("width", ($(window).width() - 40) + "px")
        }
        $(".ErrorMsgSuperContainer span").html(errmsg.replace("\r\n", "<br />"));
        $(".ErrorMsgSuperContainer").toggleClass('hide loading');
      }

      function HideErrMsg() {
        $(".ErrorMsgContainer1").css("width", "700px");
        $(".ErrorMsgSuperContainer span").html("");
        $(".ErrorMsgSuperContainer").toggleClass('loading hide');
      }

      $.fn.center = function() {
        $(this).css("position", "fixed");
        $(this).css("top", (($(window).height() - $(this).height()) / 2) + "px");
        $(this).css("left", (($(window).width() - $(this).width()) / 2) + "px");
        return this;
      }

      var _wasPageCleanedUp = false;

      function pageCleanup() {
        if (!_wasPageCleanedUp) {
          var path = window.location.pathname;
          var roote = path.split("/");
          var controller = roote[1];
          var action = roote[2] || "index";

          $.ajax({
            type: 'POST',
            url: "/UserManagement/ClearUp",
            async: false,
            data: JSON.stringify({
              controller: controller,
              action: action
            }),
            contentType: 'application/json',
            success: function() {
              _wasPageCleanedUp = true;
            }
          });
        }
      }

      $(window).on('beforeunload', function() {
        //this will work only for Chrome
        if (!_wasPageCleanedUp) {
          pageCleanup();
        }
      });

      //$(window).on("unload", function () {
      //    //this will work for other browsers
      //    if (!_wasPageCleanedUp) {
      //        pageCleanup();
      //    }
      //});

      function SetBodyPadding() {
        if ($(document).height() > $(window).height()) {
          $("body").css("padding-left", "17px");
        } else {
          $("body").css("padding-left", "0px");
        }
      }


      //$(document).on('resize', function(){
      //    var w1 = $(window).height();
      //    alert(w1);
      //});
      //$(document).ready(function () {
      //    SetBodyPadding();

      //    $(window).resize(function () {

      //    });
      //});


      var checker;

      function DownLoadFileByIframe(url) {

        ShowLoading();
        document.cookie = 'fileDownloaded=; Path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        $("#iframeDownload").attr("src", url);

        checker = setInterval(function() {
          var cookie = $.cookie("fileDownloaded");
          if (typeof $.cookie("fileDownloaded") !== "undefined") {
            HideLoading();
            if (cookie != "fileDownloaded=true") {
              ShowErrMsg(cookie.replace("fileDownloaded=", ""));
            }
            document.cookie = 'fileDownloaded=; Path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            clearInterval(checker);
          }
        }, 1000);
      }
    </script>

    <style type="text/css">
      @keyframes resizeanim {
        from {
          opacity: 0;
        }
        to {
          opacity: 0;
        }
      }

      .resize-triggers {
        animation: 1ms resizeanim;
        visibility: hidden;
        opacity: 0;
      }

      .resize-triggers,
      .resize-triggers>div,
      .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
      }

      .resize-triggers>div {
        background: #eee;
        overflow: auto;
      }

      .contract-trigger:before {
        width: 200%;
        height: 200%;
      }
    </style>
  </head>

  <body style="text-align: center; /* padding-left: 17px; */">
    <!-- 回答2・変更：左パネルの左の余白を無くす -->
    <div class="hide ErrorMsgSuperContainer">
      <table style="width:100%;height:100%;vertical-align:middle">
        <tbody>
          <tr>
            <td style="text-align:center">
              <div class="ErrorMsgContainer1">
                <div class="clear_b ErrorMsgContent">
                  <span></span>
                </div>
                <input type="button" class="Button ErrorMsgClose" onclick="HideErrMsg(); return false;" value="閉じる" style="margin-top: 10px;">
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="hide" id="divLoading">
      <table style="width:100%;height:100%;vertical-align:middle">
        <tbody>
          <tr>
            <td style="text-align:center">
              <img src="${pageContext.request.contextPath}/img/loading.gif" alt="検察中" width="130" height="130">
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="TopContainer">
      <div class="TopMenuContainer PageHeader">
      </div>
      <div id="top" class="TopMenu PageHeader">
        <div class="TopMenuTitle">
          書類申請
        </div>

        <div class="TopMenuSettingImgContainer">
          <div class="TopMenuDropDownComandContainer">
            <!-- 回答5・変更・開始：トップバーの画像を設定 -->
            <input type="image" class="TopMenuSettingImg v_middle_a" src="${pageContext.request.contextPath}/img/setting.png">
            <!-- 回答5・変更・完了：トップバーの画像を設定 -->
            <div class="TopMenuComandContent">
              <a href="/BaseInformation/Index" style="font-size:12px">基本情報</a><br>
              <a href="/ProfileInformation/Index" style="font-size:12px">プロファイル</a><br>
              <div class="TitleLine"> </div>
              <a href="/Authentication/Logout" style="font-size:12px">ログアウト</a>
            </div>
          </div>

        </div>
        <div class="TopMenuNick">
          ニックネーム 権限
        </div>
      </div>
      <div id="left" class="LeftMenu">


        <div style="text-align:left;margin-bottom:-5px">
          <span style="margin-left:10px">ニックネーム</span>
        </div>
        <div style="text-align:left">
          <!-- 回答4・変更・開始：左パネルの画像を設定 -->
          <img src="" style="width:150px;max-height:150px;position:relative;z-index:9;border:1px dashed #bbbbbb;margin-bottom:10px">
          <!-- 回答4・変更・完了：左パネルの画像を設定 -->
        </div>

        <div class="TitleLine" style="width:100%"></div>

        <div style="text-align:left;margin-top:5px">
          <span style="padding-left:10px">情報</span>
        </div>
        <div style="text-align:left;margin-top:5px">
          <span style="margin-left:40px">星座</span>
        </div>
        <div style="text-align:left;margin-top:5px">
          <span style="margin-left:40px">役職</span>
        </div>
        <div style="text-align:left;margin-top:5px">
          <span style="margin-left:40px">電話番号</span>
        </div>

        <div class="TitleLine" style="width:100%;margin-top:10px"></div>

        <div style="padding-left:10px">
          <div style="text-align:left;margin-top:5px">
            <span style="margin-left:10px">マイページ</span>
          </div>
          <div style="text-align:left;margin-top:5px">
            <span style="margin-left:10px">掲示板</span>
          </div>
          <div style="text-align:left;margin-top:5px">
            <span style="margin-left:10px">書類申請</span>
          </div>
          <div style="text-align:left;margin-top:5px">
            <span style="margin-left:10px">ユーザー検索</span>
          </div>
          <div style="text-align:left;margin-top:5px">
            <span style="margin-left:10px">E-ランニング</span>
          </div>
          <div style="text-align:left;margin-top:5px">
            <span style="margin-left:10px">ユーザー管理</span>
          </div>
        </div>
      </div>
      <form id="Form1" method="POST">
        <div id="mid" class="MidContainer" style="position: relative;">




          <table style="width:100%">
            <tbody>
              <tr>
                <td style="text-align:left; font-size:25px; font-weight:bold" colspan="3">
                  申請一覧
                </td>
              </tr>
              <tr style="height:5px; vertical-align:top;">
                <td colspan="3">
                  <div class="TitleLine"> </div>
                </td>
              </tr>
            </tbody>
          </table>
          <table>
            <tbody>
              <tr id="errtr" style="height:auto">
                <td style="width:50px"></td>
                <td style="width:auto">
                  <div id="lblエラー" style="color:red;"></div>
                </td>
              </tr>
              <tr>
                <td></td>
                <td colspan="2">

                  <table style="width:100%;">
                    <tbody>

                      <tr style="height:35px">
                        <td style="font-weight:bold;width:110px;text-align:left; font-weight:normal;">
                          状態
                        </td>
                        <!-- 回答6・追加・開始：状態のコンボボックスを作成 -->
                        <td style="width: 350px;">
                         <select name="applyStatus" id="applyStatus" class="Select">
                            <option value="5">すべて</option>
                            <option value="0">未承認</option>
                            <option value="1">承認済</option>
                            <option value="2">自分差し戻し</option>
                            <option value="3">差し戻し</option>
                            <option value="4">削除済み</option>
                        </select>
                        </td>

                        <td style="text-align:right">
                          	<input type="button" class="Button" id="btn回復" value="新規申請" style="width:120px">
                        </td>
                      </tr>

                    </tbody>
                  </table>

                  <div style="margin-top:5px;"></div>
                  <table style="width:100%; border:1px solid #5B9BD5">

                    <tbody>


                      <tr name="tabletest" style="height:35px">
                        <td colspan="4" style=" border: 1px solid #5B9BD5;">
                          <div name="ユーザーの一覧" id="divユーザーの一覧">



                            <table id="検索結果一覧" style="width:100%;word-break:break-all;font-size:13px">


                            </table>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="resize-triggers">
            <div class="expand-trigger">
              <div style="width: 803px; height: 2182px;"></div>
            </div>
            <div class="contract-trigger"></div>
          </div>
        </div>
        <script type="text/javascript">
          $("#mid").resize(function(e) {
            SetBodyPadding();
          });
        </script>
      </form>
    </div>
    <div>
    	<tiles:insertAttribute name="_ApplicationList" />
    </div>
  </body>
	 <script type="text/javascript">
    $("#applyStatus").change(function(){

        $.ajax({
            url: "${pageContext.request.contextPath}/GetPage2",
            type: "post",
            data: $("#Form1").serialize(),
            success: function(data){
                $("#divユーザーの一覧").html(data);
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
			url: "${pageContext.request.contextPath}/GetPage3",
			type: "post",
			data: {
				showNumber: $("#showNumber").val(),
				currentPage: 1
			},
			success: function (data) {
				$("#divユーザーの一覧").html(data);
			},
			error: function () {
				alert("システムエラーが発生しました");
			}
		});
	});

     $(document).on('change', "[id^='cbx表示件数']", function(e) {
       e.preventDefault();
       ShowLoading();

       $.ajax({
         type: "POST",
         url: "/UserManagement/GetPage2",
         data: JSON.stringify({
           viewrow: $("#cbx表示件数").val(),
           currentpage: 1
         }),
         contentType: 'application/json',
         success: function(data) {
           HideLoading();
           $("#divユーザーの一覧").html(data);
           $("#divユーザーの一覧").height($("#検索結果一覧").height());
         },
         error: function(xhr, status, error) {
           HideLoading();
           ShowErrMsg(xhr.responseText);
         }
       });
     });


      $(document).on('change', "[id^='txt現ページ']", function(e) {
        e.preventDefault();
        ShowLoading();
        $.ajax({
          type: "POST",
          url: "/UserManagement/GetPage2",
          data: JSON.stringify({
            viewrow: $("#cbx表示件数").val(),
            currentpage: $("#txt現ページ").val()
          }),
          contentType: 'application/json',
          success: function(data) {
            HideLoading();
            $("#divユーザーの一覧").html(data);
            $("#divユーザーの一覧").height($("#検索結果一覧").height());
          },
          error: function(xhr, status, error) {
            HideLoading();
            ShowErrMsg(xhr.responseText);
          }
        });
      });

      $("#cbx表示区分").change(function(e) {
        ShowLoading();
        $("#Form1").attr("method", "Post");
        $("#Form1").attr("action", "ChangeType");
        $("#Form1").submit();
      });

      $(document).on('change', "[id^='btn前ページ']", function(e) {
        e.preventDefault();
        var currentpage = $('#txt現ページ').val();

        if (currentpage == 1) {
          return;
        }

        $('#txt現ページ').val(Number(currentpage) - 1);
        ShowLoading();
        $.ajax({
          type: "POST",
          url: "/UserManagement/GetPage",
          data: JSON.stringify({
            viewrow: $("#cbx表示件数").val(),
            currentpage: $('#txt現ページ').val()
          }),
          contentType: 'application/json',
          success: function(data) {
            HideLoading();
            $("#divユーザーの一覧").html(data);
            $("#divユーザーの一覧").height($("#検索結果一覧").height());
          },
          error: function(xhr, status, error) {
            HideLoading();
            ShowErrMsg(xhr.responseText);
          }
        });


      });

      $(document).on('change', "[id^='btn次ページ']", function() {
        e.preventDefault();

        var maxvalue = $('#txt現ページ option:last-child').val();
        var currentpage = $('#txt現ページ').val();

        if (currentpage == maxvalue) {
          return;
        }

        var nextPage = currentpage + 1;
        $('#txt現ページ').val(nextPage);

        $('#btn前ページ').attr("src", "/img/left_triangle.png");
        ShowLoading();
        $.ajax({
          type: "POST",
          url: "/UserManagement/GetPage2",
          data: JSON.stringify({
            viewrow: $("#cbx表示件数").val(),
            currentpage: $("#txt現ページ").val()
          }),
          contentType: 'application/json',
          success: function(data) {
            HideLoading();
            $("#divユーザーの一覧").html(data);
            $("#divユーザーの一覧").height($("#検索結果一覧").height());
          },
          error: function(xhr, status, error) {
            HideLoading();
            ShowErrMsg(xhr.responseText);
          }
        });

      });

      $("#cbx表示区分").filter(function() {
        $('#cbx表示区分').val(2);
      }).prop('selected', true);

      $('#cbx表示件数 option').filter(function(index) {
        $('#cbx表示件数').val(0);
      }).prop('selected', true);

      function sort(obj) {
        var span = $(obj).find("span");
        var order = span.text().trim();
        var colName = $(obj).text().replace("▲", "").replace("▼", "").trim();
        $("#検索結果一覧").find("tr:nth-child(2) td").each(function() {
          $(this).find("span").text("");
        });

        if (order == "") {
          order = "▲";
        } else if (order == "▲") {
          order = "▼";
        } else {
          order = "▲";
        }
        var maxvalue = $('#txt現ページ option:last-child').val();
        var selecting = $('#txt現ページ').val();

        if (order == "▲") {
          $.ajax({
            type: "POST",
            url: "/UserManagement/Sort2",
            data: JSON.stringify({
              colName: colName,
              order: order
            }),
            contentType: 'application/json',
            success: function(data) {
              $("#divユーザーの一覧").html(data);
              $("#divユーザーの一覧").height($("#検索結果一覧").height());
            },
            error: function(xhr, status, error) {
              HideLoading();
              ShowErrMsg(xhr.responseText);
            }
          });
        } else {
          $.ajax({
            type: "POST",
            url: "/UserManagement/Sort2",
            data: JSON.stringify({
              colName: colName,
              order: order
            }),
            contentType: 'application/json',
            success: function(data) {
              $("#divユーザーの一覧").html(data);
              $("#divユーザーの一覧").height($("#検索結果一覧").height());
            },
            error: function(xhr, status, error) {
              HideLoading();
              ShowErrMsg(xhr.responseText);
            }
          });
        }
      }
    </script>


  </html>