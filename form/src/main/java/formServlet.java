import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registro")

public class formServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String pais = req.getParameter("pais");
        Map<String, String> errores = new HashMap<String, String>();
        if (username == null || username.isEmpty()) {
            errores.put("username", "Debe ingresar un usuario");
        }
        if (password == null || password.isEmpty()) {
            errores.put("password", "Debe ingresar un password");
        }
        if (email == null || email.isEmpty() || !email.contains("@")) {
            errores.put("email", "Debe ingresar un email");
        }
        if (pais == null || pais.isEmpty() || pais.equals("") || pais.equals(" ")) {
            errores.put("pais", "Debe seleccionar un pais");
        }
        if(errores.isEmpty()) {
            try(PrintWriter out = resp.getWriter()) {
                
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">"); 
                out.println("<title>Registro</title>");              
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Registro exitoso</h1>");
                out.println("<ul>");
                out.println("<li>Usuario: " + username + "</li>");
                out.println("<li>Password: " + password + "</li>");
                out.println("<li>Email: " + email + "</li>");
                out.println("<li>Pais: " + pais + "</li>");
                out.println("</ul>");
                out.println("</body>");
                out.println("</html>");
                out.close();

            }
        }
        else{
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

}
