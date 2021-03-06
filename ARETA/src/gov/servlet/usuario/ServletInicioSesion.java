package gov.servlet.usuario;

import java.io.IOException;
import java.sql.Connection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gov.usuario.InicioSesion;

@WebServlet("/servletInicioSesion")
public class ServletInicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletInicioSesion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String correo = request.getParameter("correoElectronico");
		String clave = request.getParameter("clave");
		
		System.out.println("correo: "+correo);
		System.out.println("clave: "+clave);

		//Cargador cargador = (Cargador) request.getServletContext().getAttribute("cargador");
		
		Connection conexion = (Connection) request.getServletContext().getAttribute("conexion");
		
		InicioSesion inicio = new InicioSesion();
		Map<String, String> usuario = inicio.iniciarSesion(conexion, correo, clave);
		
		if(usuario!=null){
			request.getSession().setAttribute("usuario", usuario);
		} 
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
