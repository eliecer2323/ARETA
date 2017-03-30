package edu.cableado;

import gov.logica.IProgramacion;
import gov.logica.IPublicidad;

public abstract class AEvento implements IProgramacion{
	IPublicidad anuncio;
	public AEvento(IPublicidad anuncio) {
		super();
		this.anuncio = anuncio;
	}
	public void parquear(){
		      programarEvento();
		      anuncio.publicitar();
	   }
}
