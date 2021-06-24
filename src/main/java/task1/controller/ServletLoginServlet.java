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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        PrintWriter out=response.getWriter();
        String email= request.getParameter("email");
        String pswd=request.getParameter("pswd");
        String SQL ="SELECT * FROM `Employees1` WHERE email='"+email+"' and password='"+pswd+"'";

        ResultSet resultSet= DatabaseDriver.db_executor(SQL,false);
        if (resultSet!=null){

            try {
                while (resultSet.next()){
                    session.setAttribute("authorized","true");
                    String type=resultSet.getString("role");
                    if(type.equals("manager")){
                        session.setAttribute("type",type);
                        session.setAttribute("idUser",resultSet.getString("Id"));
                    }


                }
                System.out.println(session.getAttribute("type"));

            }catch (Exception e){

            }
        }

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);

    }


}
