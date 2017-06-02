package org.evento.NuevoEvento;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

public class Nuevo {
	
	public boolean inscribir (Connection conexion, Map<String, String> formulario) {
		try {
			String sql = "";
			Statement st = conexion.createStatement();
			ResultSet rs;
			
			sql = "select max(id_evento)+1 as SiguienteNum from repositorio.evento";
			System.out.println("sql: "+sql);
			rs = st.executeQuery(sql);
			int id_evento = 0;
			if(rs.next()){
				id_evento = rs.getInt(1);
			}
			
			sql = "INSERT INTO repositorio.evento(id_evento, direccion, costo, fecha, id_estado)"
					+"VALUES ("+id_evento+", '"+formulario.get("direccion")+"', "+formulario.get("costo")+", '"+formulario.get("fechaEvento")+"', 1);";
			System.out.println("sql: "+sql);
			st.executeUpdate(sql);
			
			System.out.println("numAfectados: "+(formulario.size()-3)/5);
			for (int i=1; i<=(formulario.size()-3)/5; i++) {
				sql = "select max(id_persona)+1 as SiguienteNum from repositorio.persona";
				System.out.println("sql: "+sql);
				rs = st.executeQuery(sql);
				int id_persona = 0;
				if(rs.next()){
					id_persona = rs.getInt(1);
				}
				
				sql = "INSERT INTO repositorio.persona(id_persona, nombres, apellidos, cedula, fecha_nacimiento, genero)"
						+"VALUES ("+id_persona+", '"+formulario.get("nombres"+i)+"', '"+formulario.get("apellidos"+i)+"', "
						+formulario.get("cedula"+i)+", '"+formulario.get("fecha"+i)+"', '"+formulario.get("genero"+i)+"');";
				System.out.println("sql: "+sql);
				st.executeUpdate(sql);
				
				sql = "INSERT INTO repositorio.evento_afectado(id_evento, id_afectado)"
						+"VALUES ("+id_evento+", "+id_persona+");";
				System.out.println("sql: "+sql);
				st.executeUpdate(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
