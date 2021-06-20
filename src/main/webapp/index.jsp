<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<%@taglib prefix="myHeader" uri="/WEB-INF/custom.tld" %>




<!DOCTYPE html>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <title  >ARK</title>


</head>
<body>
<%
    String isAuthorized=(String) session.getAttribute("authorized");
    pageContext.setAttribute("isAuthorized",isAuthorized);
%>

<c:if test="${isAuthorized==null}">
    <myHeader:headerTag auth="false"  />
</c:if>

<c:if test="${isAuthorized!=null}">
    <myHeader:headerTag auth="true"  />
</c:if>


<div style="height: 200px">

</div>


<%--<c:if test="${aa==11}">--%>
<%--    <h1>Authorized</h1>--%>
<%--</c:if>--%>




<c:if test="${isAuthorized==null}">
    <mytag:logInForm/>
</c:if>


<c:if test="${isAuthorized!=null}">

</c:if>


<br/>

</body>
</html>