<%--
  Created by IntelliJ IDEA.
  User: ali_jaber
  Date: 6/21/21
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<%@taglib prefix="myHeader" uri="/WEB-INF/custom.tld" %>


<html>
<head>
    <title>ARK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String isAuthorized=(String) session.getAttribute("authorized");
    pageContext.setAttribute("isAuthorized",isAuthorized);
    pageContext.setAttribute("typeUser","manager");
%>

<c:if test="${isAuthorized==null}">
    <myHeader:headerTag auth="false" typeuser="manager" />
</c:if>

<c:if test="${isAuthorized!=null}">
    <myHeader:headerTag auth="true" typeuser="teamLeader" />
</c:if>

<div class="container" style="margin-top: 30px; margin-bottom: 30px">

    <img src="https://scontent.fjrs13-1.fna.fbcdn.net/v/t1.6435-9/197525704_1807822596061647_6230598223234021645_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=RSLl_bkE_RYAX8TN8eU&_nc_ht=scontent.fjrs13-1.fna&oh=34c797654d355ed36b8b7e0e3384f21d&oe=60D59D61" class="rounded-circle" alt="Cinque Terre" width="200" height="200">
<%--    <form action="ServletProfile" method="post" enctype="multipart/form-data">--%>
<%--        <input type="file" name="file" value="choose image" />--%>
<%--        <input type="submit" value="save" />--%>
<%--    </form>--%>
</div>
<div class="card-columns">


    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">Ali Bani jABER </p>
        </div>
    </div>

    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">Developer</p>
        </div>
    </div>


    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">12-2-2021</p>
        </div>
    </div>

    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">90 task </p>
        </div>
    </div>

</div>
</body>
</html>
