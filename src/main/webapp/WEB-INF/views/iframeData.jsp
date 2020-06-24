<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

<script>
	
// 	array = []
// 	<c:forEach items="${list}" var="tmp">
// 		bascket = {
// 			imgsrc : '${tmp.imgsrc}',
// 			madeby : '${tmp.madeby}',
// 			title : '${tmp.title}',
// 			content : '${tmp.content}',
// 			price : '${tmp.price}' * 1
// 		}
// 		array.push(bascket);
		
// 	</c:forEach>

// 	filters = document.getElementsByTagName('select');
	
// 	for (key in filters) {
// 		console.log(filters[key]);
// 	}
	
	
</script>
<form name="iframe">
	<div class="boardList">
				<c:forEach var="vo" items="${list }">
					<div name="totalLine" class="boardLine">
						<div name="line" class="num" ><img height="100%" src="${vo.imgsrc}"></div>
						<div name="line" class="writer">${vo.madeby }</div>
						<div name="line" class="title">
							<a href="${pageContext.request.contextPath }/board/read/${vo.macaddr }/">${vo.title }</a>
							<div name="line" class="content">
								${vo.content }
							</div>
						</div>
						<div name="line" class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}"/>원</div>
						<div name="line" class="catch"><button class="btn">담기</button></div>
					</div>
				</c:forEach>
	</div>
</form>