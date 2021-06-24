package task1.controller;

import task1.database.DatabaseDriver;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "ServletTaskServlet", value = "/ServletTaskServlet")
public class ServletTaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("status")!=null){
            System.out.println(request.getParameter("status"));
            String status=( request.getParameter("status")).split(",")[0];
            String idTask=( request.getParameter("status")).split(",")[1];
            DatabaseDriver.db_executor("UPDATE Task_ SET status = '"+status+"' WHERE task_id="+Integer.parseInt(idTask),true);
            request.removeAttribute("status");
            System.out.println("UPDATE Task_ SET status = '"+status+"' WHERE task_id="+Integer.parseInt(idTask));

        }

        RequestDispatcher requestDispatcher =request.getRequestDispatcher("task.jsp");


        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();



        DatabaseDriver.db_executor("INSERT INTO Task_ (task_id, task_name, created_by, time_amount,employee_to_do,status) VALUES ("+null+",'"+req.getParameter("taskname")+"',"+session.getAttribute("idUser")+", '"+Integer.parseInt(req.getParameter("time"))+"','"+req.getParameter("employee")+"','In Progress')",true);

        RequestDispatcher requestDispatcher =req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req,resp);


    }

}
