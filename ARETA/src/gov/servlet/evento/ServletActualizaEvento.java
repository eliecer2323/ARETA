package gov.servlet.evento;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servletActualizaEvento")
public class ServletActualizaEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletActualizaEvento() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("\nentra a servletActualizaEvento");
	    	
	    	Connection conexion = (Connection) request.getServletContext().getAttribute("conexion");
			Statement st = conexion.createStatement();
			ResultSet rs;
			
			String sql = "UPDATE repositorio.evento SET id_estado=2 WHERE id_evento="+request.getParameter("id_evento");
			System.out.println("sql: "+sql);
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("modulos/evento/pendiente.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
