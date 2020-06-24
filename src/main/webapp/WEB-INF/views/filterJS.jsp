<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	
	var iframe;
	var innerDoc;
	filters = [];
	array = [];
	boardLines = [];
	
	
	// body를 통해 Onload 실행
	function getInstance(){
		array = []
		
		// List형태의 ${list}를 jstl로 받아와서 javascript 형태의 객체를 만들어준다.
		<c:forEach items="${list}" var="tmp">
		
			bascket = {
				// 상자 안에  변수 값을 담고 bacsket 이란 객체안에 넣어준다
				imgsrc : '${tmp.imgsrc}',
				madeby : '${tmp.madeby}',
				title : '${tmp.title}',
				content : '${tmp.content}',
				price : '${tmp.price}' * 1,
				datetime : '${tmp.datetime}',
				
				// 객체안에 map형태의 ob객체를 만들어준다. (OR연산을 위한 객체안의 객체이다.)
				map : ob = {
						madeby : '${tmp.madeby}',
						cpuname : '${tmp.cpuname}',
						socket : '${tmp.socket}',
						manufac : '${tmp.manufac}',
						cores : '${tmp.cores}',
						threads : '${tmp.threads}',
						clock : '${tmp.clock}',
						operation : '${tmp.operation}',
						gpu : '${tmp.gpu}',
				},
			}
			// array에 bascket 객체를 담아준다.
			array.push(bascket);
		</c:forEach>	
	}
	
	// display none 해제 함수
	function displayOn(){
		// totalLine의 div 전체를 가져온다. 즉 하나의 줄 전체를 가져와서 [display none]을 해제시켜준다.
		tl = innerDoc.getElementsByName('totalLine');
		
		for(i=0; i < tl.length; i++)
			tl[i].style.display = '';
		
	}
	
	
	// 정렬함수
	function sort(){
		//필터 객체(select tag)를 전부 가져온다.
		filters = document.getElementsByClassName('slc');
		
		// display none을 해제시켜준다.
		displayOn();
		
		// 필터 객체(select tag)의 개수만큼 for문을 반복시켜준다.		
		for(filter in filters){
			
			// filters[filter]의 값을 pk에 넣어준다.
			pk = filters[filter];
				
			
			
			// 필터 객체(select tag)가 연산이 and이면서 값이 들어있으면 
			if(pk.name == 'and' && pk.value != ''){
				
				// pk.id에 따른 정렬을 실행시켜준다.
				array.sort(function(a,b){
					switch(pk.id){
					
						// 신상품 정렬 (날짜이용)
						case 'newProduct' :
							return pk.value =='on' ? ((a.datetime < b.datetime) ? 1 : -1) : ((a.datetime > b.datetime) ? 1 : -1);
						
						// 가격 정렬 (가격이용)
						case 'priceOrder' :
							return pk.value =='pdesc' ? ((a.price < b.price) ? 1 : -1) : ((a.price > b.price) ? 1 : -1);
								
						// 이름 정렬 (이름이용)
						case 'nameOrder' :
							return pk.value =='cdesc' ? ((a.madeby < b.madeby) ? 1 : -1) : ((a.madeby > b.madeby) ? 1 : -1);
				}
						
					});
				
					// 정렬한 값을 inputTable에 다시 넣어준다.
					inputTable(array);
					
				}
			
				// 필터 객체(select tag)가 or연산이면서 값이 들어있으면
				else if(pk.name == 'or' && pk.value != ''){
					
					// tl객체를 생성해준다.
					tl = [];
					
					// innerDoc(iframeDocument)에서 totalLine(한 줄)을 가져온다.
					tl = innerDoc.getElementsByName('totalLine');
					
					count = array.length;
					// array의 길이만큼 반복문을 돌린다
					for(i=0; i < array.length; i++){
						
						// array의 맵의 pk.id가 현재 pk.value와 일치하지않으면 조건에 불일치이기 때문에 none을 처리시켜준다. 
						if(array[i].map[pk.id] != pk.value){
							tl[i].style.display = 'none';
							count = count -1;
						}
					}
					
					
				}
				
				
				
				}// 함수끝
				
				// 상품 개수를 변환 시켜주는 함수입니다.
				countSet();
			}
	
	
	
	// 상품 개수를 유동적으로 변환 시켜주는 함수입니다.
	function countSet(){
		// 데이터 개수를 세어주는 변수
		count = 0;
		
		error = document.getElementsByClassName('error');
		tl = innerDoc.getElementsByName('totalLine');
		
		
		// 배열의 길이만큼 반복문을 실행한다.
		for(i=0; i < array.length; i++){
			// tl[i]의 display가 on이면 count를 증가시켜준다.
			if(tl[i].style.display != 'none')
				count += 1;			
		}
		
		// count를 변환시켜준다.
		countField = document.getElementById("count");
		countField.innerText = '상품 개수 : ' + count + '개';
				
		error[0].innerText = '';
		
		// 현재 상품이 없으면 띄어주는 에러메시지.
		if(count == 0){
			console.log(error);
			error[0].innerText = "현재 상품이 없습니다..!";
			error[0].style.color = "red";
			error[0].style.font = 'bolder';
		}
	}
	
	
	// 정렬한 값을 다시 reInput해주는 함수
	function inputTable(ob){
		
		// access()함수에서 받아온 boardLines의 길이만큼 for문을 반복
	    for(i=0; i< boardLines.length; i++){
	    	
	    	// 6단위로 이동하기 때문에 배열값 key값은 나누기 6
	    	key = parseInt(i/6);
	    	
	    	// 6단위로 이동하기 때문에 switch의 keys는 퍼센트 6
	    	keys = i%6;
	    	
	    		switch(keys){
			    	case 0 :
			    		boardLines[i].children[0].src = ob[key].imgsrc;
			    		break;
			    	case 1 :
			    		boardLines[i].innerText = ob[key].madeby;		
			    		break;
			    		
			    	case 2 :
			    		boardLines[i].children[0].innerText = ob[key].title;
			    		boardLines[i].children[1].innerText = ob[key].content;
			    		break;
			    		
			   			
			    	case 4 :
			    		price = numberWithCommas(ob[key].price);
			    		boardLines[i].innerText = price + '원';
			   			break;
			   				
			   	
	    			}
	    	}
	    }
	
	// 세 자리 수마다 ,를 넣어주는 함수입니다.
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// iframe에 dom객체를 접근허용 함수입니다.
	function access(){
		iframe = document.getElementById("iframeA");
		innerDoc = iframe.contentDocument || iframe.contentWindow.document;
		boardLines = innerDoc.getElementsByName('line');
	}
	
	
// 	iframe = document.getElementById("iframeA");
// 	innerDoc = iframe.contentDocument || iframe.contentWindow.document;
// 	boardLines = innerDoc.getElementsByName('line');

</script>