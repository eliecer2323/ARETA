package gov.servlet.evento;

import java.io.IOException;
import java.sql.Connection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.evento.NuevoEvento.Nuevo;

@WebServlet("/servletNuevoEvento")
public class ServletNuevoEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletNuevoEvento() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("\nentra a servletNuevoEvento");
    	
    	Connection conexion = (Connection) request.getServletContext().getAttribute("conexion");
		
		Map<String, String> formulario = new HashMap<String, String>();
		Enumeration<String> en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String paramName = en.nextElement();
            formulario.put(paramName, request.getParameter(paramName));
            System.out.println(paramName+": "+request.getParameter(paramName));
        }
        
        Nuevo evento = new Nuevo();
        evento.inscribir(conexion, formulario);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
