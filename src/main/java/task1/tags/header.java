package task1.tags;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class header extends SimpleTagSupport {

    String auth;
    String typeuser;

    public void setTypeuser(String typeuser) {
        this.typeuser = typeuser;
    }

    public void setAuth(String message) {
        this.auth = message;
    }


    public void doTag()


            throws  IOException {

        JspWriter out =  getJspContext().getOut();

        out.print("<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark\" style=\"height: 150px\">\n" +
                "\n" +
                "    <ul class=\"navbar-nav\">\n");
        out.print(
                "        <li class=\"nav-item \">\n" +
                "            <a class=\"nav-link\" href='ServletHomeServlet' style=\"font-size: 25px ;margin: 30px\">Home</a>\n" +
                "        </li>\n");
        if(typeuser =="manager" && auth=="true")
            out.print(
                    "        <li class=\"nav-item\">\n" +
                            "            <a class=\"nav-link\" href=\"ServletEmployee\" style=\"font-size: 25px;margin: 30px\">Employees</a>\n" +
                            "        </li>\n");
        if (typeuser =="teamLeader" && auth=="true")
            out.print(
                    "        <li class=\"nav-item\">\n" +
                            "            <a class=\"nav-link\" href=\"ServletEmployee\" style=\"font-size: 25px;margin: 30px\">Team</a>\n" +
                            "        </li>\n");



                if(auth=="true")
                    out.print("            <li class=\"nav-item \">\n"+
                            "<a class=\"nav-link\" href='ServletTaskServlet' style=\"font-size: 25px;margin: 30px\">Tasks</a>    </li>\n"
                    );
                out.print(
                "    </ul>\n" +
                "    <div class=\"collapse navbar-collapse justify-content-end\" id=\"navbarCollapse\">\n" +
                "        <ul class=\"navbar-nav\">\n" +
                "            <li class=\"nav-item \">\n");

        if(auth=="true")
            out.print("<a class=\"nav-link\" href='ServletProfile' style=\"font-size: 25px;margin: 30px\">Profile</a>    </li>\n");

        if(auth=="true")
            out.print(" <a class=\"nav-link\" href=\"ServletLogoutServlet\" style=\"font-size: 25px;margin: 30px\">Logout</a>");
        else out.print("<a class=\"nav-link\" href=\"#\" style=\"font-size: 25px;margin: 30px\">Login</a>\n");

        out.print(
                "            </li>\n"+
                        "            <li class=\"nav-item \">\n"

        );
        out.print(
                "        </ul>\n" +
                "    </div>\n" +
                "</nav>");

    }
}
