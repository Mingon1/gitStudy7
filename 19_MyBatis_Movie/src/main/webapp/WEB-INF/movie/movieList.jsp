<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<style>
   table {
        width: 80%;
        border-collapse: collapse;
    }
    td, th {
        border: 1px solid gray;
        padding: 10;
        text-align : center;
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
</style>

<script>
function insert(pageNumber){
	location.href="insert.mv?pageNumber="+pageNumber;
}
function update(num,pageNumber,whatColumn,keyword){
	location.href="update.mv?num="+num+"&pageNumber="+pageNumber+"&whatColumn="+whatColumn+"&keyword="+keyword;
}
</script>
무비list<br>

<h2 align="center">영화 리스트 화면</h2>
<form action="list.mv" align="center">
	<select name="whatColumn">
		<option value="all" <c:if test="${param.whatColumn eq 'all' }">selected</c:if>>전체 검색
		<option value=genre <c:if test="${param.whatColumn eq 'genre' }">selected</c:if>>장르
		<option value="grade" <c:if test="${param.whatColumn eq 'grade' }">selected</c:if>>연령
		<option value="actor" <c:if test="${param.whatColumn eq 'actor' }">selected</c:if>>출연배우
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
<h3 align="center">[검색어개수:${totalCount}/전체개수:${AlltotalCount}]</h3>
<table align="center">
	<tr>
		<th colspan="9"><input type="button" value="추가하기" onclick="insert('${pageInfo.pageNumber}')"></th>
	</tr>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>대륙</th>
		<th>나라</th>
		<th>장르</th>
		<th>연령</th>
		<th>출연배우</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:choose>
		<c:when test="${fn:length(movieList) == 0 }">
			<tr>
				<td colspan="9" align="center">없음</td>
			<tr>
		</c:when>
		<c:otherwise>
		<c:forEach var = "m" items="${movieList }">
		<tr>
			<td>${m.num }</td>
			<td><a href="detail.mv?num=${m.num }&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">${m.title }</a></td>
			<td>${m.continent }</td>
			<td>${m.nation }</td>
			<td>${m.genre }</td>
			<td>${m.grade }</td>
			<td>${m.actor }</td>
			<td><input type="button" value="수정하기" onclick="update('${m.num}','${pageInfo.pageNumber}','${param.whatColumn }','${param.keyword }')"></td>
			<td><a href="delete.mv?num=${m.num }&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">삭제</a></td>
		</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<center>
	${pageInfo.getPagingHtml()}
</center>