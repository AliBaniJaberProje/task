<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>

<%--<%--%>
<%--    String isAuthorized=(String) session.getAttribute("email");--%>
<%--    pageContext.setAttribute("isAuthorized",isAuthorized);--%>
<%--%>--%>

<div class="container">
    <form action="ServletLoginServlet" method="POST" class="needs-validation" novalidate>
        <div class="form-group">
            <label for="uname">Username:</label>
            <input type="text" class="form-control" id="uname" placeholder="Enter email" name="email" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd"  required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> I agree on blabla.
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Check this checkbox to continue.</div>
            </label>
        </div>

           <center>
           <button type="submit" class="btn btn-primary" >
               login
<%--               <c:choose >--%>
<%--               <c:when test="${isAuthorized==null}">--%>
<%--                   Login--%>
<%--               </c:when>--%>

<%--               <c:when test="${isAuthorized!=null}">--%>
<%--                   logout--%>
<%--               </c:when>--%>
<%--           </c:choose>--%>

           </button>
           </center>

    </form>
</div>