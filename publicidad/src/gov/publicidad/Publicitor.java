package gov.publicidad;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import gov.core.IPublicidad;

public class Publicitor implements IPublicidad {

	ArrayList<Anuncio> arregloAnuncios = new ArrayList<Anuncio>();
	
	@Override
	public void publicitar(Connection conexion) {
		FabricaPublicidad fabrica;
		try {
			Statement st = conexion.createStatement();
			String sql = "select * from repositorio.anuncio order by id_anuncio limit 5";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Map<String, String> anuncios = new HashMap<String, String>();
				anuncios.put("id_anuncio", rs.getString("id_anuncio"));
				anuncios.put("contenido", rs.getString("contenido"));
				anuncios.put("tipo_anuncio", rs.getString("tipo_anuncio"));
				
				if(anuncios.get("tipo_anuncio").equals("informativo")){
					fabrica = new FabricaInformacion();
				} else {
					fabrica = new FabricaMultimedia();
				}
				arregloAnuncios.add(fabrica.crearAnuncio(anuncios));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
