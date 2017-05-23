package gov.publicidad;

import java.util.Map;

public class FabricaMultimedia extends FabricaPublicidad {

	@Override
	public Anuncio crearAnuncio(Map<String, String> anuncios) {
		Anuncio anuncio = new Multimedia(anuncios.get("id_anuncio"),anuncios.get("contenido"),anuncios.get("tipo_anuncio"));
		
		return anuncio;
	}

}
