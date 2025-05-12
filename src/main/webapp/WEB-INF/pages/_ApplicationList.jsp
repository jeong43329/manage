<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>検索画面</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Site.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <style>
	    body {
	        font-family: "Meiryo", sans-serif;
	        background-color: #fff;
	        color: #333;
	    }

	    table#searchList {
	        border: 2px solid #69A4D8;
	        border-collapse: collapse;
	        width: 100%;
	        table-layout: fixed;
	    }

	    table#searchList tr:first-child {
	        border-bottom: 2px solid #69A4D8;
	        height: 40px;
	        background-color: #F4F9FD;
	    }

	    table#searchList td {
	        border: 1px solid #69A4D8;
	        padding: 6px;
	        text-align: left;
	        word-wrap: break-word;
	        word-break: break-all;
	        white-space: normal;
	    }

	    .TextCenter {
	        text-align: center;
	    }

	    button {
	        background-color: #69A4D8;
	        color: white;
	        border: none;
	        padding: 6px 12px;
	        font-size: 14px;
	        border-radius: 4px;
	        cursor: pointer;
	    }

	    button:hover {
	        background-color: #558fc4;
	    }

	    table#searchList tr:last-child td {
	        border: none;
	    }
	</style>


</head>

<body>
<table style="border: 2px solid #69A4D8; width: 100%;" id="searchList">
	<tr>
		<td colspan="5" style="width:auto;border-right:none">
	         <c:choose>
	             <c:when test="${ApplicationInfoModel.getAllApplicationList() != null}">
	                 総件数：<span id="totalCount">${ApplicationInfoModel.getAllApplicationList().size()}</span>件
	             </c:when>
	             <c:otherwise>
	                 総件数：<span id="totalCount">0</span>件
	             </c:otherwise>
	         </c:choose>
	     </td>

	     <td style="border:none;text-align:right">表示件数：</td>
         <td style="border:none">
             <c:set var="disabled" value="" />
             <c:if test="${ApplicationInfoModel.getAllApplicationList() == null}">
                 <c:set var="disabled" value="disabled" />
             </c:if>
             <select class="Select" name="showNumber" id="showNumber" style="width:100%;float:right" ${disabled}>
                 <c:set var="array" scope="request">0,5,10,20,50,100</c:set>
                 <c:forEach var="item" items="${array}">
                     <c:choose>
                         <c:when test="${ApplicationInfoModel.getShowApplicationList () == item}">
                             <c:set var="selected" value="selected" scope="request" />
                         </c:when>
                         <c:otherwise>
                             <c:set var="selected" value="" scope="request" />
                         </c:otherwise>
                     </c:choose>
                     <c:choose>
                         <c:when test="${item == 0}">
                             <c:set var="text" value="すべて" scope="request" />
                         </c:when>
                         <c:otherwise>
                             <c:set var="text" value="${item}件" scope="request" />
                         </c:otherwise>
                     </c:choose>
                     <option value="${item}" ${selected}>${text}</option>
                 </c:forEach>
             </select>
         </td>
	</tr>
    <tr style="border-bottom: 2px solid #69A4D8; height: 40px;">
        <td style="border: 1px solid #69A4D8; width: 7%;" class="TextCenter">状態</td>
        <td style="border: 1px solid #69A4D8; width: 9%;" class="TextCenter">申請ID</td>
        <td style="border: 1px solid #69A4D8; width: 14%;" class="TextCenter">申請種類</td>
        <td style="border: 1px solid #69A4D8; width: 14%;" class="TextCenter">タイトル</td>
        <td style="border: 1px solid #69A4D8; width: 14%;" class="TextCenter">申請日</td>
        <td style="border: 1px solid #69A4D8; width: 14%;" class="TextCenter">承認日</td>
        <td style="border: 1px solid #69A4D8; width: 20%;" class="TextCenter">連絡事項</td>
    </tr>

    <!-- 検索結果一覧 -->
     <c:set var="i" value="0" scope="request" />
     <c:forEach var="item" items="${ApplicationInfoModel.getAllApplicationList()}">
         <tr>
		   <td class="TextCenter">${item.getApplyStatus()}</td>
		   <td class="TextCenter">${item.getApplyId()}</td>
		   <td class="TextCenter">${item.getApplyType()}</td>
		   <td class="TextCenter">${item.getTitle()}</td>
		   <td class="TextCenter">${item.getApplyTime()}</td>
		   <td class="TextCenter">${item.getApproveTime()}</td>
		   <td class="TextCenter">${item.getNoticeMatter()}</td>
		</tr>

     </c:forEach>

       <tr style="border-top: 2px solid #69A4D8; width: 100%">
           <td colspan="6" style="border: none;"></td>
           <td style="border: none; display: block; float: right;"></td>
       </tr>

      <c:if test="${ApplicationInfoModel.getAllApplicationList() != null && ApplicationInfoModel.getShowApplicationList ().size() < ApplicationInfoModel.getAllApplicationList().size()}">
           <tr>
               <td colspan="7" style="border:none;">
                   <div style="float:right">
                       <c:choose>
                           <c:when test="${ApplicationInfoModel.getCurrentPage() == 1}">
                               <input type="image" src="${pageContext.request.contextPath}/img/left_triangle_disable.png"
                                   id="previousPage" style="width:30px;float:left" />
                           </c:when>
                           <c:otherwise>
                               <input type="image" src="${pageContext.request.contextPath}/img/left_triangle.png"
                                   id="previousPage" style="width:30px;float:left" />
                           </c:otherwise>
                       </c:choose>

                       <select class="Select" name="currentPage" id="currentPage"
                           style="width:60px;height:30px;float:left;margin:0px 5px;">
                           <c:set var="modulo" value="${ApplicationInfoModel.getAllApplicationList().size() % ApplicationInfoModel.getShowNumber()}" />
                           <c:set var="plus" value="${(modulo == 0 ? 0 : 1)}" />
                           <c:set var="loopCount" value="${ApplicationInfoModel.getAllApplicationList().size() / ApplicationInfoModel.getShowNumber() + plus}" />
                           <c:if test="${ApplicationInfoModel.getShowNumber() != 0 && loopCount >= 1}">
                               <c:forEach var="loop" begin="1" end="${loopCount}">
                                   <c:choose>
                                       <c:when test="${ApplicationInfoModel.getCurrentPage() == loop}">
                                           <option selected value="${loop}">${loop}</option>
                                       </c:when>
                                       <c:otherwise>
                                           <option value="${loop}">${loop}</option>
                                       </c:otherwise>
                                   </c:choose>
                               </c:forEach>
                           </c:if>
                       </select>

                       <fmt:parseNumber var="numberData"
                           value="${ApplicationInfoModel.getAllApplicationList().size() / ApplicationInfoModel.getShowNumber() + 1}"
                           integerOnly="true" />

                       <c:choose>
                           <c:when test="${ApplicationInfoModel.getCurrentPage() == numberData}">
                               <input type="image"
                                   src="${pageContext.request.contextPath}/img/right_triangle_disable.png"
                                   id="nextPage" style="width:30px;float:left" />
                           </c:when>
                           <c:otherwise>
                               <input type="image" src="${pageContext.request.contextPath}/img/right_triangle.png"
                                   id="nextPage" style="width:30px;float:left" />
                           </c:otherwise>
                       </c:choose>
                   </div>
               </td>
           </tr>
       </c:if>
</table>
</body>
</html>
