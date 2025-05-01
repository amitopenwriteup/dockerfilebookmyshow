import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class YourServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().println("<h1>Hello from BookMyShow Servlet!</h1>");
    }
}
