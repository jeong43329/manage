<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table id="searchList" style="border: 2px solid #69A4D8; width: 100%; ">
<tr>
		<td colspan="5" style="width:auto;border-right:none">
			<c:choose>
				<c:when test="${findModel.getAllUserList() != null}">
					総件数：<span id="totalCount">${findModel.getAllUserList().size()}</span>件
				</c:when>
				<c:otherwise>
					総件数：<span id="totalCount">0</span>件
				</c:otherwise>
			</c:choose>
		</td>
		<td style="width:100px;border:none;text-align:right">
			表示件数：
		</td>
		<td style="width:80px;border:none">
			<c:set var="disabled" value=""/>
			<c:if test="${findModel.getAllUserList() == null}">
				<c:set var="disabled" value="disabled"/>
			</c:if>
			<select class="Select" name="showNumber" id="showNumber" style="width:100%;float:right" ${disabled}>
				<c:set var="array" scope="request">0,5,10,20,50,100</c:set>
				<c:forEach var="item" items="${array}">
					<c:choose>
						<c:when test="${findModel.getShowNumber() == item}">
   							<c:set var="selected" value="selected" scope="request"/>
						</c:when>
						<c:otherwise>
							<c:set var="selected" value="" scope="request"/>
						</c:otherwise>
					</c:choose>
   					<c:choose>
						<c:when test="${item == 0}">
   							<c:set var="text" value="すべて" scope="request"/>
						</c:when>
						<c:otherwise>
							<c:set var="text" value="${item}件" scope="request"/>
						</c:otherwise>
					</c:choose>
					<option value="${item}" ${selected}>${text}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
<tr style="border-bottom: 2px solid #69A4D8; height: 40px;">
		<td style="width: 6%;" class="TextCenter">選択</td>
		<c:set var="array" scope="request">氏名,生年月日,性別,電話番号,メール,郵便番号,住所,所属,役職</c:set>
		<c:forEach var="item" items="${array}">
			<td onclick="sort(this)"><%--유저ID열이 클릭됬을때 sort메소드에 this오브젝트를 넘긴다(this오브젝트는 현재의 td오브젝트이다)--%>
				${item}
				<span>
					<c:if test="${findModel.getSortColumn()==item}"><%--만약 현재의 소트열이 유저ID이면 열이름의 아래에 소트순(▲,▼)를 추가한다 --%>
						<br />${findModel.getSortOrder()}
					</c:if>
				</span>
			</td>
		</c:forEach>
	</tr>
<c:forEach var="item" items="${findModel.getShowUserList()}">
    <tr>
    	<td class="TextCenter"><input type="checkbox" id="selectUser_${item.getUserId() }"/></td>
    	<td>${item.getUserName() }</td>
    	<td>${item.getBirthday() }</td>
    	<td class="TextCenter">
						<c:choose>
							<c:when test="${item.getSex() == 1 }">
								<c:out value="男"/>
							</c:when>
							<c:when test="${item.getSex() == 2 }">
								<c:out value="女"/>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</td>
        <td>${item.getTel() }</td>
        <td>${item.getEmail()}</td>
        <td>${item.getPostcode()}</td>
        <td>${item.getAddress()}</td>
        <td>${item.getAffiliation()}</td>
        <td>${item.getPosition()}</td>

    </tr>
</c:forEach>

</table>