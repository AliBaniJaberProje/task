<%@ page import="java.sql.ResultSet" %>
<%@ page import="task1.database.DatabaseDriver" %>
<%@ page import="task1.model.Task" %>
<%@ page import="java.util.ArrayList" %><%--
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

<%
    ResultSet resultSet= DatabaseDriver.db_executor("SELECT * FROM `Task_` WHERE employee_to_do='"+session.getAttribute("idUser")+"'",false);
    ArrayList<Task> tasks =new ArrayList<Task>();
    if(resultSet!=null){
        while (resultSet.next()){
            //String id, String taskNmae, String createBy, int time, String employee_to_do, String status
            tasks.add(new Task(resultSet.getString("task_id"),resultSet.getString("task_name"),resultSet.getString("created_by"),resultSet.getInt("time_amount"),resultSet.getString("employee_to_do"),resultSet.getString("status") ));
        }
    }
    pageContext.setAttribute("tasks",tasks);


%>

<%!
    public void print_a(){
        System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrr");
    }

%>


<div class="container">
    <h2>Tasks Table</h2>
    <table class="table">
        <thead>
        <tr>
            <th>task id</th>
            <th>task name</th>
            <th>created by </th>
            <th>time </th>
            <th>status</th>
        </tr>
        </thead>

        <form action="ServletTaskServlet" method="get">

        <tbody>

        <c:forEach items="${tasks}" var="task">
        <div class="col-sm">
                <tr>
                <td>${task.id}</td>
                <td>${task.taskNmae}</td>
                <td>${task.createBy}</td>
                <td>${task.time}</td>

                <td>

                    <select name="status" class="custom-select" onclick=" print_a"  >
                    <option value="Done+${task.id}" >Done</option>
                    <option value="Completed+${task.id}" >Completed</option>
                    <option value="In Progress+${task.id}" >In Progress</option>
                    </select>

                    </div>

                </td>
            </tr>
        </c:forEach>


        </tbody>
        <input type="submit" value="حفظ" >
        </form>
    </table>
</div>
</body>
</html>
