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
		<c:set var="array" scope="request">ユーザーID,氏名,性別,電話番号,郵便番号,住所</c:set>
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
		<!--
		<td style="width: 17%;" class="TextCenter">ユーザーID</td>
		<td style="width: 20%;" class="TextCenter">氏名</td>
		<td style="width: 6%;" class="TextCenter">性別</td>
		<td style="width: 15%;" class="TextCenter">電話番号</td>
		<td style="width: 13%;" class="TextCenter">郵便番号</td>
		<td style="width: *;" class="TextCenter">住所</td>
		-->
	</tr>
	<div name="検索結果一覧" id="div検索結果一覧">
		<c:set var="MALE" value="1"/>
		<c:set var="FEMALE" value="2"/>
		<c:if test="${findModel.getAllUserList() != null }">
			<c:set var="i" value="0" scope="request"/>
			<c:forEach var="item" items="${findModel.getShowUserList()}">
				<tr>
					<td class="TextCenter"><input type="checkbox" id="selectUser_${item.getUserId() }"/></td>
					<td>${item.getUserId() }</td>
					<td>${item.getUserName() }</td>
					<td class="TextCenter">
						<c:choose>
							<c:when test="${item.getSex() == MALE }">
								<c:out value="男"/>
							</c:when>
							<c:when test="${item.getSex() == FEMALE }">
								<c:out value="女"/>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${item.getTel() }</td>
					<td>${item.getPostcode() }</td>
					<td>${item.getAddress() }</td>
				</tr>
			</c:forEach>
		</c:if>
	</div>
	<!--  <tr style="border-top: 2px solid #69A4D8;">-->

	<c:if test="${findModel.getShowUserList()!=null
	&&findModel.getShowUserList().size()<findModel.getAllUserList().size()}">
		<tr>

				<td colspan="6" style="border:none;">
					<div style="float:right">

						<c:choose>
							<c:when test="${findModel.getCurrentPage()==1 }">

								<input type="image" src="${pageContext.request.contextPath}/img/left_triangle_disable.png"
									id="previousPage" style="width:30px;float:left" />
							</c:when>


							<c:otherwise>

								<input type="image" src="${pageContext.request.contextPath}/img/left_triangle.png" id="previousPage"
									style="width:30px;float:left" />
							</c:otherwise>
						</c:choose>
						<select class="Select" name="currentPage" id="currentPage"
								style="width:60px;height:30px;float:left;margin:0px 5px 0px 5px;">
							<c:set var="modulo" value="${findModel.getAllUserList().size()%findModel.getShowNumber()}"<%--전체 사용자 수를 한 페이지에 표시할 수있는 사용자 수로 나누고 나머지를 저장합니다 --%>
									scope="request"/>
							<c:set var="plus" value="${(modulo==0?0:1)}" scope="request"/><%--나머지가 0이면 plus를 0으로 설정하고,그렇지 않으면 1로 설정합니다.이는 페이지 개수 계산 시 사용됩니다. --%>
							<c:set var="loopCount" value="${findModel.getAllUserList().size()/findModel.getShowNumber()+plus}"<%--페이지의 총 개수를 계산하여 loopCount에 저장합니다. --%>
									scope="request"/>
							<c:if test="${findModel.getShowNumber()!=0
									&&(findModel.getAllUserList().size()/findModel.getShowNumber()+1)>=1}">
								<c:forEach var="loop" begin="1" end="${loopCount}"><%--foreach전체: 페이지 번호를 반복적으로 생성하여 드롭다운에 추가합니다.현재 페이지 번호(findModel.getCurrentPage()==loop)는 선책된 상태로 표시합니다.나머지 페이지 번호는 일반 옵션으로 표시합니다 --%>
									<c:choose>
										<c:when test="${findModel.getCurrentPage()==loop}">
											<option selected value="${loop}">${loop}</option>
										</c:when>
									<c:otherwise>
										<option value="${loop}">${loop}</option>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</select>
						<fmt:parseNumber var="numberData" value="${findModel.getAllUserList().size()/findModel.getShowNumber()+1}"
								integerOnly="true" /> <%--페이지 개수를 정수로 변환해 numberData에 저장합니다 --%>
						<c:choose>

						<c:when test="${findModel.getCurrentPage()==numberData}"><%--마지막 페이지인 경우 --%>

							<input type="image" src="${pageContext.request.contextPath}/img/right_triangle_disable.png"
									id="nextPage" style="width:30px;float:left" /><%--현재 페이지가 마짐가 페이지일 경우 다음 페이지 버튼을 비활성화된 이미지(right_triangle_disable.png)로 표시합니다 --%>
						</c:when>

						<c:otherwise>

							<input type="image" src="${pageContext.request.contextPath}/img/right_triangle.png" id="nextPage"
									style="width:30px;float:left" /><%--다음 페이지로 이동 가능한 버튼을 활성화된 이미지(right_triangle.png)로 표시합니다. --%>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
	</c:if>
</table>

<!--
<table style="border: 2px solid #69A4D8; width: 100%; ">
	<tr>
		<td colspan="5" style="width: auto; border-right: none;">
			&nbsp;総件数：
			<span name="総件数" id="txt総件数">
				0
			</span>
			件
		</td>
		<td style="width: 40px; border: none; text-align: right;">
			表示件数：
		</td>
		<td style="border: none;">
			<select class="SELECT" name="表示件数" id="txt件数" style="width: 200px; float:right;">
				<option value="0">すべて</option>
				<option value="5">5件</option>
				<option value="10">10件</option>
			</select>
		</td>
	</tr>

	<tr style="border-bottom: 2px solid #69A4D8; height: 40px;">
		<td style="width: 6%;" class="TextCenter">選択</td>
		<td style="width: 17%;" class="TextCenter">ユーザーID</td>
		<td style="width: 20%;" class="TextCenter">氏名</td>
		<td style="width: 6%;" class="TextCenter">性別</td>
		<td style="width: 15%;" class="TextCenter">電話番号</td>
		<td style="width: 13%;" class="TextCenter">郵便番号</td>
		<td style="width: *;" class="TextCenter">住所</td>
	</tr>
	<div name="検索結果一覧" id="div検索結果一覧">
		<c:set var="MALE" value="1"/>
		<c:set var="FEMALE" value="2"/>
		<c:if test="${findModel.getAllUserList() != null }">
			<c:set var="i" value="0" scope="request"/>
			<c:forEach var="item" items="${findModel.getAllUserList() }">
				<tr>
					<td class="TextCenter"><input type="checkbox" id="selectUser_${item.getUserId() }"/></td>
					<td>${item.getUserId() }</td>
					<td>${item.getUserName() }</td>
					<td class="TextCenter">
						<c:choose>
							<c:when test="${item.getSex() == MALE }">
								<c:out value="男"/>
							</c:when>
							<c:when test="${item.getSex() == FEMALE }">
								<c:out value="女"/>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${item.getTel() }</td>
					<td>${item.getPostcode() }</td>
					<td>${item.getAddress() }</td>
				</tr>
			</c:forEach>
		</c:if>
	</div>
	<tr style="border-top: 2px solid #69A4D8;">
		<td colspan="6" style="border: none;">

		</td>
		<td style="border: none; display: block; float: right;">
			<img src="${pageContext.request.contextPath}/img/left_triangle.png" name="前ページ" id="btn前ページ" style="float: left;  width: 30px; margin: 2px;" />
			<select class="SELECT" name="現ページ" id="txt現ページ" style="width: 50px; margin: 2px;">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			<img src="${pageContext.request.contextPath}/img/right_triangle.png" name="次ページ" id="btn次ページ" style="float: right; width: 30px; margin: 2px;" />
		</td>
	</tr>
</table>
-->