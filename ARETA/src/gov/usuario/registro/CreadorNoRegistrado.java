package gov.usuario.registro;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

public class CreadorNoRegistrado implements Creador {

	public Usuario fabricar(Connection conexion, Map<String, String> formulario) {
		try {
			String sql = "";
			Statement st = conexion.createStatement();
			ResultSet rs;
			boolean registrar = true;
			
			sql = "select * from autenticacion.usuario where correo='"+formulario.get("confirmarCorreoElectronicoPersonal")+"';";
			rs = st.executeQuery(sql);
			if(rs.next()){
				registrar = false;
			}
			
			sql = "select * from repositorio.persona where cedula="+formulario.get("cedula");
			rs = st.executeQuery(sql);
			if(rs.next()){
				registrar = false;
			}
			
			if(registrar){
				sql = "select max(id_persona)+1 as SiguienteNum from repositorio.persona";
				System.out.println("sql: "+sql);
				rs = st.executeQuery(sql);
				int id_persona = 0;
				if(rs.next()){
					id_persona = rs.getInt(1);
				}
				String campos = "";
				String valores = "";
				if(formulario.get("telefono")!=null && formulario.get("telefono")!=""){
					campos += ", telefono";
					valores += ", "+formulario.get("telefono");
				}
				if(formulario.get("celular")!=null && formulario.get("celular")!=""){
					campos += ", celular";
					valores += ", "+formulario.get("celular");
				}
				sql = "INSERT INTO repositorio.persona(id_persona, nombres, apellidos, cedula"+campos+", fecha_nacimiento, genero)	VALUES"
						+"("+id_persona+", '"+formulario.get("nombres")+"', '"+formulario.get("apellidos")+"', "+formulario.get("cedula")+valores
						+", '"+formulario.get("fechaNacimiento")+"', '"+formulario.get("genero")+"');";
				System.out.println("sql: "+sql);
				st.executeUpdate(sql);
				
				sql = "select max(id_usuario)+1 as SiguienteNum from autenticacion.usuario";
				System.out.println("sql: "+sql);
				rs = st.executeQuery(sql);
				int id_usuario = 0;
				if(rs.next()){
					id_usuario = rs.getInt(1);
				}
				sql = "INSERT INTO autenticacion.usuario(id_usuario, nivel, correo, clave, id_persona) VALUES ("+id_usuario+", 3, '"+formulario.get("confirmarCorreoElectronicoPersonal")+"', '"+formulario.get("clave")+"', "+id_persona+");";
				System.out.println("sql: "+sql);
				st.executeUpdate(sql);
			}else{
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
