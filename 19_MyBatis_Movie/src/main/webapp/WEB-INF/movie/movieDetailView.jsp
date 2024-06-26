<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

	movieDetailView.jsp<br>
	
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
	
	<h1 align="center">영화 상세 화면</h1>
														
	        <table border="1" align="center">
	            <tr>
	                <th>번호</th>
	                <td>${movie.num}</td>
	            </tr>
	            <tr>
	                <th>영화 제목</th>
	                <td>${movie.title}</td>
	            </tr>
	            <tr>
	                <th>제작국가</th>
	                <td>${movie.nation }</td>
	            </tr>
	
	            <tr>
	                <th>장르</th>
	                <td>${movie.genre }</td>
	            </tr>
	
	            <tr>
	                <th>등급</th>
	                <td>${movie.grade }</td>
	            </tr>
	
	            <tr>
	                <th>출연 배우</th>
	                <td>${movie.actor}</td>
	            </tr>
	
	            <tr>
	                <th colspan="2"><a href="list.mv?pageNumber=${pageNumber }&whatColumn=${whatColumn}&keyword=${keyword}">영화 리스트 화면으로 돌아감</a></th>
	            </tr>
	        </table>
	
		