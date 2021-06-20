package com.example.task;

import task1.database.DatabaseConnection;
import task1.database.DatabaseDriver;

import java.io.*;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {


            Statement stmt =   DatabaseConnection.getUniqueConnection().createStatement();
            String sql;
            sql = "SELECT id, first, last, age FROM Employees";
            ResultSet rs = DatabaseDriver.db_executor(sql,false);


            while(rs.next()){


                int id  = rs.getInt("id");
                int age = rs.getInt("age");
                String first = rs.getString("first");
                String last = rs.getString("last");



                out.println("ID: " + id + "<br>");
                out.println(", Age: " + age + "<br>");
                out.println(", First: " + first + "<br>");
                out.println(", Last: " + last + "<br>");


            }
        } catch (Exception e) {
           System.out.println(e.getMessage());
        }
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {

    }
}