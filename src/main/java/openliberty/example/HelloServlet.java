package openliberty.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/servlet")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        // tag::responsestring[]
        response.getWriter().append("Hello! Is Gradle working for you?\n");
        // end::responsestring[]
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        doGet(request, response);
    }
}
