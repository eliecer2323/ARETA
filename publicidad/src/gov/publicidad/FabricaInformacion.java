package gov.publicidad;

import java.util.Map;

public class FabricaInformacion extends FabricaPublicidad {

	@Override
	public Anuncio crearAnuncio(Map<String, String> anuncios) {
		Anuncio anuncio = new Informacion(anuncios.get("id_anuncio"),anuncios.get("contenido"),anuncios.get("tipo_anuncio"));
		String caja = 	"<div class=\"noticia\">"+
							"<span><a href=\"#\">"+anuncio.contenido+"</a></span>"+
						"</div>";
		anuncio.caja = caja;
		return anuncio;
	}

}
