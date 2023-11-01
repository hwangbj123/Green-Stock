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
<h3> 수정 페이지 </h3>
    <form action="/notice/update" method="post">
        <table style="border: 1px solid blue ">                                                 
                                            
            <tr>                
                <td>
                	<input type="text" value="${notice.id}" name="id">
                	<input type="hidden" value="${notice.userId}" name="userId">
                    제목:<input type="text" value="${notice.noticeTitle}" name="noticeTitle"></td>                                      
            </tr>
            <tr>            
                <td>                    
                    <textarea name="noticeContent">${notice.noticeContent}</textarea>
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
                <td><a href ="/notice/list"><button type="button">목록</button></a></td>
            </tr>
        </table>
    </form>
    
</body>
</html>