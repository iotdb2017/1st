<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="7">
<tr>
   <td>��ȣ</td>
   <td>�̸�</td>
    <td>����</td>
    <td>��¥</td>
    <td>��Ʈ</td>
  </tr>
  <c:forEach items="${list}" var="dto">
   <tr>
   <td>${dto.bId }</td>
   <td>${dto.bName }</td>
   <td>
     <c:forEach begin="1" end="$dto.bIndent}">-</c:forEach>
     <a href="content_view?bId=${dto.bId}">${dto.bTitle}</a>
   </td>
   <td>${dto.bDate}</td>
   <td>${dto.bHit}</td>
  </tr> 
  </c:forEach>
</table>
</body>
</html>