package gov.usuario.registro;

import java.sql.Connection;
import java.util.Map;

public class CreadorNoRegistrado implements Creador {

	public Usuario fabricar(Connection conexion, Map<String, String> formulario) {
		String columnas = "";
		String valores = "";
		
		for (Map.Entry<String, String> entry : formulario.entrySet()) {
		    columnas += ","+entry.getKey();
		    valores += ","+entry.getValue();
		}
		
		String sql = "";
		System.out.println("columnas: "+columnas);
		System.out.println("valores: "+valores);
		
		return null;
	}

}
