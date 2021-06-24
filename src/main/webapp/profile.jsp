<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="task1.database.DatabaseDriver" %><%--
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
   String idUser=(String) session.getAttribute("idUser");
    ResultSet resultSet= DatabaseDriver.db_executor("select * from Employees1 where Id='"+idUser+"'",false);
    String username=null;
    String type=null;
    String number_of_tasks=null;
    String img=null;


    while (resultSet.next()){
            username=resultSet.getString("username");
            type=resultSet.getString("role");
            img=resultSet.getString("img_url");
    }

    ResultSet resultSet1=DatabaseDriver.db_executor("SELECT COUNT(task_id) FROM Task_ where employee_to_do='"+session.getAttribute("idUser")+"' and status='Completed' ",false);

    while (resultSet1.next()){
        number_of_tasks=resultSet1.getString("COUNT(task_id)");
    }


    pageContext.setAttribute("username",username);
    pageContext.setAttribute("type",type);
    pageContext.setAttribute("img",img);
    pageContext.setAttribute("number_of_tasks",number_of_tasks);



%>

<c:if test="${isAuthorized==null}">
    <myHeader:headerTag auth="false" typeuser="manager" />
</c:if>

<c:if test="${isAuthorized!=null}">
    <myHeader:headerTag auth="true" typeuser="teamLeader" />
</c:if>

<div class="container" style="margin-top: 30px; margin-bottom: 30px">

    <img src="${img}" class="rounded-circle" alt="Cinque Terre" width="200" height="200">

</div>
<div class="card-columns">


    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">${username} </p>
        </div>
    </div>

    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">${type}</p>
        </div>
    </div>


    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">12-2-2021</p>
        </div>
    </div>

    <div class="card bg-light">
        <div class="card-body text-center">
            <p class="card-text">${number_of_tasks} task </p>
        </div>
    </div>

</div>
</body>
</html>
