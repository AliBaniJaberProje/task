<%--
  Created by IntelliJ IDEA.
  User: ali_jaber
  Date: 6/20/21
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<%@taglib prefix="myHeader" uri="/WEB-INF/custom.tld" %>

<%--<%--%>
<%--    pageContext.setAttribute("employees",);--%>
<%--    --%>
<%--%>--%>
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

<%
    String isAuthorized=(String) session.getAttribute("authorized");
    pageContext.setAttribute("isAuthorized",isAuthorized);
    pageContext.setAttribute("employees",request.getAttribute("employees"));
%>

<c:if test="${isAuthorized==null}">
    <myHeader:headerTag auth="false"  />
</c:if>

<c:if test="${isAuthorized!=null}">
    <myHeader:headerTag auth="true"  />
</c:if>


<div class="container-fluid">
    <div class="row">
        <c:forEach items="${employees}" var="item">

            <div class="card" style="width:200px; margin-left: 20px ; margin-top: 20px">
                <img class="card-img-top  "style="height: 150px" src="${item.getImgURL()}" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">${item.getUsername()}</h4>
                    <p class="card-text">${item.getType()}</p>


                </div>
            </div>
        </c:forEach>

    </div>


</div>


</body>
</html>
