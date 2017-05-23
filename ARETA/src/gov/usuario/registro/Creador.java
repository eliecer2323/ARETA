package gov.usuario.registro;

import java.sql.Connection;
import java.util.Map;

public interface Creador {
	public Usuario fabricar(Connection conexion, Map<String, String> formulario);
}
