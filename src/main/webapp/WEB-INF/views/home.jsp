<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body onload="getInstance()">
<section >
	<div class="board">
		<fieldset>
			<h1 class="boardTitle" style="margin-left:550px;display:inline-block;">CPU</h1>
			
			<b style="margin-left:450px; display:inline-block;" id="count">총 상품 개수 : ${count }개</b>
			<br>
			
			
			<select class="slc" name='and' id="newProduct" onchange="sort()">
						<option value="">신상품순</option>
						<option value="on">on</option>
						<option value="off">off</option>
			</select>
			
			<select class="slc" name='and' id="priceOrder" onchange="sort()">
						<option value="">가격순</option>
						<option value="pdesc">가격높은순</option>
						<option value="pasc">가격낮은순</option>
			</select>
			
			<select class="slc" name='and' id="nameOrder" onchange="sort()">
						<option value="">상품명순</option>
						<option value="cdesc">가나다순</option>
						<option value="casc">다나가순</option>
			</select>
			<br><br>
			
			
			
			<hr>
			
			<br>
			
			<select class="slc" name='or' id="madeby" onchange="sort()">
						<option value="">제조사</option>
						<option value="Intel">인텔</option>
						<option value="AMD">AMD</option>
			</select>
			
			<select class="slc" name='or' id="cpuname" onchange="sort()">
						<option value="">인텔 CPU종류</option>
						<option value="I9-10">코어 i9-10세대</option>
						<option value="I7-10">코어 i7-10세대</option>
			</select> 
			
			<select class="slc" name='or' id="socket" onchange="sort()">
						<option value="">소켓 구분</option>
						<option value="1200">인텔(소켓1200)</option>
						<option value="1151v2">인텔(소켓1151v2)</option>
			</select> 
			
			
			<br><br>
			
			
			<select class="slc" name='or' id="manufac" onchange="sort()">
						<option value="">제조 공정</option>
						<option value="7">7nm</option>
						<option value="12">12nm</option>
			</select> 
			
			<select class="slc" name='or' id="cores" onchange="sort()">
						<option value="">코어 수</option>
						<option value="12">12코어</option>
						<option value="8">옥타(8)코어</option>
			</select> 
			
			<select class="slc" name='or' id="threads" onchange="sort()">
						<option value="">쓰레드 수</option>
						<option value="96">쓰레드96개</option>
						<option value="128">쓰레드128개</option>
			</select> 
			
			
			<br><br>
			
			
			<select class="slc" name='or' id="clock" onchange="sort()">
						<option value="">기본 쿨럭</option>
						<option value="3.0~3.49">3.0 ~ 3.49 GHZ</option>
						<option value="2.5~2.99">2.5 ~ 2.99 GHZ</option>
			</select> 
			
			<select class="slc" name='or' id="operation" onchange="sort()">
						<option value="">연산 체계</option>
						<option value="64">64 비트</option>
						<option value="32">32 비트</option>
			</select> 
			
			<select class="slc" name='or' id="gpu" onchange="sort()">
						<option value="">GPU 유무</option>
						<option value="1">GPU 내장</option>
						<option value="0">GPU 비포함</option>
			</select> 
			
				
			
		</fieldset>
		
		<div class="error"></div>
		
		<div class="boardList">
			<iframe id="iframeA" src="${pageContext.request.contextPath }/iframeData/" onload="access()" frameborder="0" runat="server" scrolling="yes" style="min-height:800px;width: 100%;"></iframe>
		</div>
		
		
	</div>
</section>
</body>

<!-- 자바스크립트 파일 -->
<%@ include file="filterJS.jsp"%>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/WEB-INF/views/filters.js"></script> --%>

<%@ include file="footer.jsp"%>




