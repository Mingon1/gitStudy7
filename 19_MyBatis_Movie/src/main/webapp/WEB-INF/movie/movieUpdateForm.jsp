<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

	movieUpdateForm.jsp<br>
	
<style>
   table {
        width: 80%;
        border-collapse: collapse;
    }
    td, th {
        border: 1px solid gray;
        padding: 10;
    }
    th {
        background: #00bfff;
    }
    a {
        text-decoration: none;
        color: blue;
    }
    a:hover {
        font-weight: bold;
        color: #87cefa;
        text-decoration: underline;
    }
   
      input[type="submit"] {
            background-color: #87cefa; 
            border: none;
            color: blue;
            padding: 4px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
            border-radius: 8px;
        }
        input[type="submit"]:hover {
            background-color: white;
            color: #87cefa;
            border: 1px solid #87cefa;
        }
         input[type="button"] {
            background-color: #87cefa; 
            border: none;
            color: blue;
            padding: 4px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
            border-radius: 8px;
        }
        input[type="button"]:hover {
            background-color: white;
            color: #87cefa;
        }
        .err{
        color:red;
        font-size:9pt;
        
        }
</style>
	
<script type="text/javascript">
var s_selbox = [
    ['한국', '중국', '베트남', '네팔'],
    ['케냐', '가나', '세네갈'],
    ['스페인', '영국', '덴마크', '러시아', '체코'],
    ['미국', '캐나다'],
    ['뉴질랜드', '오스트레일리아']
];


function firstChange() {												// 첫번째 select option이 선택될때마다 실행
    var firstSelect = document.forms["myform"].first;
    var secondSelect = document.forms["myform"].second;

    // Clear existing options in the second select box
    for (var i = secondSelect.options.length - 1; i > 0; i--) {	// 기존 2번째 select option을 초기화하고
        secondSelect.options[i] = null;
    }

    var index = firstSelect.selectedIndex - 1;

    if (index >= 0) {											// 2번째 select option을 다시 채운다
        var countries = s_selbox[index];
        for (var j = 0; j < countries.length; j++) {
            secondSelect.options[j + 1] = new Option(countries[j], countries[j]);

            // 선택된 나라 설정										// 이때 이전에 넘어온 movie의 nation이
            if ("${movie.nation}" == countries[j]) {			// 해당 option과 같다면 선택한다!!!
                secondSelect.options[j + 1].selected = true;
            }
        }
    }
}

</script>
	
<%
String[] continentList = {"아시아","아프리카","유럽","아메리카","오세아니아"};
String[][] nationList = {
							{"한국","중국","베트남","네팔"},
							{"케냐", "가나", "세네갈"},
							{"스페인", "영국","덴마크","러시아","체코"},
							{"미국", "캐나다"},
							{"뉴질랜드","오스트레일리아"}
						};
%>

<c:set var="cList" value="<%=continentList %>"/>
<c:set var="nList" value="<%=nationList %>"/>

<%-- <body onLoad="init('${movie.continent }','${movie.nation}')"> --%>
<h2>영화 정보 등록 화면</h2>
   <form:form commandName="movie" name="myform" action="update.mv" method="post">
      <input type="hidden" name="num" value="${movie.num}">
      <input type="hidden" name="pageNumber" value="${param.pageNumber}">
      <input type="hidden" name="whatColumn" value="${param.whatColumn}">
      <input type="hidden" name="keyword" value="${param.keyword}">
      <table>
         <tr>
            <th>영화 제목</th>
            <td>
               <input type="text" name="title" value="${movie.title}">
               <form:errors path="title" cssClass="err" />
            </td>
         </tr>
         <tr>
            <th>대륙</th>
            <td>
               <select id="first" name="continent" onChange="firstChange()" style="width: 150px" >
                 <option value="">대륙 선택하세요</option>
                  
                  <c:forEach var="i" begin="0" end="${fn:length(cList)-1 }">
                  		<option value="${cList[i]}" <c:if test="${movie.continent eq cList[i]}">selected</c:if>>${cList[i]}
                  </c:forEach>
               </select>
               <form:errors path="continent" cssClass="err" />
            </td>
         </tr>
         <tr>
            <th>나라</th>
            <td>
               <select id="second" name="nation" style="width: 150px">
                    <option value="">나라 선택하세요</option>
                    <c:forEach var="i" begin="0" end="${fn:length(cList)-1}">
                        <c:if test="${movie.continent eq cList[i]}">
                            <c:forEach var="j" begin="0" end="${fn:length(nList[i])-1}">
                                <option value="${nList[i][j]}" <c:if test="${movie.nation eq nList[i][j]}">selected</c:if>>${nList[i][j]}</option>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </select>
               <form:errors path="nation" cssClass="err" />
            </td>
         </tr>
         <tr>
            <th>장르</th>
            <td>
               <% String[] genre = {"액션","스릴러","코미디","판타지","애니메이션"}; %>
               <c:forEach var="genre" items="<%=genre%>">
                  <input type="checkbox" name="genre" value="${genre}" <c:if test="${fn:contains(movie.genre,genre)}">checked</c:if>>${genre}
               </c:forEach>
               <form:errors path="genre" cssClass="err" />
            </td>
         </tr>
         <tr>
            <th>등급</th>
            <td>
               <% String[] grade = {"19","15","12","7"}; %>
               <c:forEach var="grade" items="<%=grade%>">
                  <input type="radio" name="grade" value="${grade}" <c:if test="${movie.grade eq grade}">checked</c:if>>${grade}
               </c:forEach>
               <form:errors path="grade" cssClass="err" />
            </td>
         </tr>
         <tr>
            <th>출연배우</th>
            <td><input type="text" name="actor" value="${movie.actor}"></td>
         </tr>
         <tr>
            <th colspan="2" align="center">
               <input type="submit" value="수정하기">
               <input type="button" value="목록보기" onClick="location='list.mv?pageNumber=${param.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}'">
            </th>
         </tr>
      </table>
   </form:form>

	
		