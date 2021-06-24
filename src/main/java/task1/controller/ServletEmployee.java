package task1.controller;

import task1.database.DatabaseDriver;
import task1.model.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletEmployee", value = "/ServletEmployee")
public class ServletEmployee extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("employees.jsp");
       String SQL= "SELECT * FROM `Employees1` ";
        ResultSet resultSet= DatabaseDriver.db_executor(SQL,false);

        ArrayList<Employee> employees=new ArrayList<Employee>();

        try {
            String email;
            String username;
            String imgURL;
            String type;
            String id;

            while (resultSet.next()){
                email=resultSet.getString("email");
                username=resultSet.getString("username");
                imgURL=resultSet.getString("img_url");
                type=resultSet.getString("role");
                id=resultSet.getString("Id");
                employees.add(new Employee(email,username,imgURL,type,id));
            }
            request.setAttribute("employees",employees);
        }catch (Exception e){

        }


        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String img="assets/images/Arh-avatar.jpg";

        DatabaseDriver.db_executor("INSERT INTO Employees1 (email, Id, img_url, password, role, username) VALUES ('"+req.getParameter("email")+"',"+null+", '"+img+"', '11223344', 'developer','"+req.getParameter("username")+"')",true);
        ResultSet resultSet=DatabaseDriver.db_executor("SELECT Id FROM `Employees1` ORDER BY Id DESC LIMIT 1",false);
        String idemployee = null;


       if(resultSet!=null){
           try {
               while (resultSet.next()) {
                   idemployee = resultSet.getString("Id");
               }
           } catch (SQLException sqlException) {
               sqlException.printStackTrace();
           }
       }
       DatabaseDriver.db_executor("INSERT INTO Managment_relation (id, id_developer, id_manager) VALUES ("+null+",'"+idemployee+"','"+session.getAttribute("idUser")+"')",true);


        RequestDispatcher requestDispatcher=req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req,resp);

        super.doPost(req, resp);
    }


}
