package gov.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.catalina.Session;

import gov.cableado.Cargador;

@WebListener
public class InicioContexto implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("destruyendo contexto");
	}

	// Run this before web application is started
	@Override
	public void contextInitialized(ServletContextEvent event) {
		try {
			System.out.println("iniciando contexto");

			ServletContext contexto = event.getServletContext();
			String ruta = contexto.getRealPath("/");
			System.out.println("path: " + ruta);

			Cargador cargador = new Cargador();
			cargador.cargar(new String[] { ruta + "recursos\\componentes\\backOffice",
					ruta + "recursos\\componentes\\frontOffice" });

			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost/areta";
			Connection conexion = DriverManager.getConnection(url, "postgres", "sergtsop");

			contexto.setAttribute("conexion", conexion);
			contexto.setAttribute("cargador", cargador);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}