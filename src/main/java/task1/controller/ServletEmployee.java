package task1.controller;

import task1.database.DatabaseDriver;
import task1.model.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "ServletEmployee", value = "/ServletEmployee")
public class ServletEmployee extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("employees.jsp");
       String SQL= "SELECT Employees.*,role.* FROM `Employees` INNER JOIN role ON Employees.role=role.role_id ORDER BY Employees.first_name";
        ResultSet resultSet= DatabaseDriver.db_executor(SQL,false);

        ArrayList<Employee> employees=new ArrayList<Employee>();

        try {
            String email;
            String username;
            String imgURL;
            String type;
            String id;


            //  email,  username,  imgURL,  type
            while (resultSet.next()){
                email=resultSet.getString("email");
                username=resultSet.getString("first_name")+" "+resultSet.getString("last_name");
                imgURL=resultSet.getString("img_url");
                type=resultSet.getString("role_name");
                id=resultSet.getString("id");
                employees.add(new Employee(email,username,imgURL,type,id));
            }
            request.setAttribute("employees",employees);
        }catch (Exception e){

        }


        requestDispatcher.forward(request,response);

    }


}
