package gov.publicidad;

import gov.logica.IPublicidad;

public class Anuncio implements IPublicidad {

	@Override
	public void publicitar() {
		System.out.println("publicitando con "+getClass().getSimpleName());
	}

}
