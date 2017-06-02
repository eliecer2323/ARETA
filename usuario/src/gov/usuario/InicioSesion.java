package gov.usuario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class InicioSesion {
	
	public Map<String, String> iniciarSesion(Connection conexion, String correo, String clave){
		try {
            Statement st = conexion.createStatement();
            String sql = "select * from autenticacion.usuario where correo='"+correo+"' and clave='"+clave+"'";
            System.out.println("sql: "+sql);
            ResultSet rs= st.executeQuery(sql);
            if(rs.next()){
            	System.out.println("id usuario: "+rs.getString("id_usuario"));
            	Statement st2 = conexion.createStatement();
                String sql2 = "select * from repositorio.persona where id_persona="+rs.getString("id_persona");
                System.out.println("sql2: "+sql2);
                ResultSet rs2= st2.executeQuery(sql2);
            	if(rs2.next()){
            		Map<String, String> usuario = new HashMap<String, String>();
            		usuario.put("nombres", rs2.getString("nombres"));
            		usuario.put("apellidos", rs2.getString("apellidos"));
            		usuario.put("cedula", rs2.getString("cedula"));
            		usuario.put("fecha_nacimiento", rs2.getString("fecha_nacimiento"));
            		usuario.put("genero", rs2.getString("genero"));
            		return usuario;
            	}
            }

        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
		return null;
	}
}
