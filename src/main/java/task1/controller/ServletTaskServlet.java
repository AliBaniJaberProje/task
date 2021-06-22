package task1.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletTaskServlet", value = "/ServletTaskServlet")
public class ServletTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher =request.getRequestDispatcher("task.jsp");
        requestDispatcher.forward(request,response);
    }


}
