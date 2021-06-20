package task1.controller;

import task1.database.DatabaseDriver;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

@WebServlet(name = "ServletLoginServlet", value = "/ServletLoginServlet")
public class ServletLoginServlet extends HttpServlet {

//SELECT * FROM `Employees` WHERE email=qazwsx1731999@hotmail.com and password=HJNMH
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        PrintWriter out=response.getWriter();
        String email= request.getParameter("email");
        String pswd=request.getParameter("pswd");
        String SQL ="SELECT * FROM `Employees` WHERE email='"+email+"' and password='"+pswd+"'";
        ResultSet resultSet= DatabaseDriver.db_executor("SELECT * FROM `Employees` WHERE email='alijaber@gmail.com'and password='11223344'",false);
        if (resultSet!=null){
            session.setAttribute("authorized","ali@jaber.com");
            try {
                while (resultSet.next()){
                    String type=resultSet.getString("role");
                    session.setAttribute("type",type);
                }

            }catch (Exception e){

            }
        }

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);

    }


}
