<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h3> 작성 페이지 </h3>
    <form action="/notice/write" method="post">
        <table style="border: 1px solid blue ">                                                 
                                            
            <tr>                
                <td>
                	<input type="hidden" value="1" name="userId">
                    제목:<input type="text" value="" name="noticeTitle"></td>                                      
            </tr>
            <tr>            
                <td>                    
                    <textarea name="noticeContent"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="noticeState" value="0" checked>비공개
                    <input type="radio" name="noticeState" value="1">공개
                </td>                
            </tr>         
            <tr>
                <td><button type="submit">작성</button></td>
                
                <td><button type="submit">취소</button></td>
            </tr>
        </table>
    </form>
</body>
</html>