<%@ page import="java.sql.ResultSet" %>
<%@ page import="task1.database.DatabaseDriver" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="task1.model.Employee" %>
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
    pageContext.setAttribute("type",session.getAttribute("type"));



%>

<c:if test="${isAuthorized==null}">
    <myHeader:headerTag auth="false" typeuser="manager" />
</c:if>

<c:if test="${isAuthorized!=null}">
    <myHeader:headerTag auth="true" typeuser="teamLeader" />
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
<%
    ResultSet resultSet= DatabaseDriver.db_executor("SELECT * FROM `Employees1` WHERE role='manager' ",false);
    ArrayList<Employee>  employees=new ArrayList<Employee>();

    if(resultSet!=null){
        while (resultSet.next()){
            employees.add(new Employee(resultSet.getString("email"), resultSet.getString("username"), "","",resultSet.getString("Id")));
        }
    }
    for (int i=0;i<employees.toArray().length;i++){
        System.out.println(employees.get(i).getEmail());
    }

    pageContext.setAttribute("employees",employees);

    ResultSet resultSet1= DatabaseDriver.db_executor("SELECT * FROM Employees1",false);
    ArrayList<Employee>  todoTaskEmployee=new ArrayList<Employee>();
    if(resultSet1!=null){
        while (resultSet1.next()){
            todoTaskEmployee.add(new Employee(resultSet1.getString("email"), resultSet1.getString("username"), "","",resultSet1.getString("Id")));
        }
    }
    pageContext.setAttribute("todoTaskEmployee",todoTaskEmployee);




%>
    <c:if test="${type!=null}">
        <div class="row">
            <div class="col" style="margin-left: 40px">

                <form action="ServletEmployee" method="POST">
                    <div class="form-group">
                        <label for="email">Employee Email </label>
                        <input type="text" class="form-control" placeholder="Enter email" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="username">username:</label>
                        <input type="text" class="form-control" placeholder="Enter username" id="username" name="username">
                    </div>
                    <label for="email">Employee Type </label>
                    <select name="manager" class="custom-select">


                        <c:forEach items="${employees}" var="employe">
                            <option value="${employe.getId()}" >${employe.getUsername()}</option>
                        </c:forEach>

                    </select>
                    <div class="form-group" style="margin-top: 30px">
                        <button type="submit" name="submit" class="btn btn-primary">add</button>
                    </div>

                </form>
            </div>
            <div class="col">
                <form action="ServletTaskServlet" method="POST">
                    <div class="form-group">
                        <label for="taskName">Task Name </label>
                        <input type="text" class="form-control" placeholder="Enter task name" id="taskName" name="taskname">
                    </div>
                    <label for="email">Employee Name </label>
                    <select name="employee" class="custom-select">

                        <option selected>Select  Employee To do </option>
                        <c:forEach items="${todoTaskEmployee}" var="item" >
                            <option value="${item.id}">${item.username}</option>

                        </c:forEach>


                    </select>
                    <div class="form-group">
                        <label for="email">Task Time </label>
                        <input type="text" class="form-control" placeholder="Enter time to do in h" id="time" name="time">
                    </div>
                    <div class="form-group" style="margin-top: 30px">
                        <button type="submit" class="btn btn-primary">add</button>
                    </div>

                </form>

            </div>

        </div>
    </c:if>

</c:if>


<br/>

</body>
</html>