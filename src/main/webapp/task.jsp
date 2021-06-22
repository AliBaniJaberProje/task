<%--
  Created by IntelliJ IDEA.
  User: ali_jaber
  Date: 6/21/21
  Time: 10:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<%@taglib prefix="myHeader" uri="/WEB-INF/custom.tld" %>



<html>
<head>
    <title>Title</title>

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
    pageContext.setAttribute("typeUser","manager");
%>

<c:if test="${isAuthorized==null}">
    <myHeader:headerTag auth="false" typeuser="manager" />
</c:if>

<c:if test="${isAuthorized!=null}">
    <myHeader:headerTag auth="true" typeuser="teamLeader" />
</c:if>



<div class="container">
    <h2>Contextual Classes</h2>
    <p>Contextual classes can be used to color the table, table rows or table cells. The classes that can be used are: .table-primary, .table-success, .table-info, .table-warning, .table-danger, .table-active, .table-secondary, .table-light and .table-dark:</p>
    <table class="table">
        <thead>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Default</td>
            <td>Defaultson</td>
            <td>def@somemail.com</td>
        </tr>
        <tr class="table-primary">
            <td>Primary</td>
            <td>Joe</td>
            <td>joe@example.com</td>
        </tr>
        <tr class="table-success">
            <td>Success</td>
            <td>Doe</td>
            <td>john@example.com</td>
        </tr>
        <tr class="table-danger">
            <td>Danger</td>
            <td>Moe</td>
            <td>mary@example.com</td>
        </tr>
        <tr class="table-info">
            <td>Info</td>
            <td>Dooley</td>
            <td>july@example.com</td>
        </tr>
        <tr class="table-warning">
            <td>Warning</td>
            <td>Refs</td>
            <td>bo@example.com</td>
        </tr>
        <tr class="table-active">
            <td>Active</td>
            <td>Activeson</td>
            <td>act@example.com</td>
        </tr>
        <tr class="table-secondary">
            <td>Secondary</td>
            <td>Secondson</td>
            <td>sec@example.com</td>
        </tr>
        <tr class="table-light">
            <td>Light</td>
            <td>Angie</td>
            <td>angie@example.com</td>
        </tr>
        <tr class="table-dark text-dark">
            <td>Dark</td>
            <td>Bo</td>
            <td>bo@example.com</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
