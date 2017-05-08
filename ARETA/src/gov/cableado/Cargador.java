package gov.cableado;


import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;

public class Cargador {
	   URLClassLoader cargador;
	   List<URL> urls;
       public void cargar(String [] dirs){
    	   urls = new ArrayList();
    	   for(String cad_i:dirs){
    		   File fs[]=new File(cad_i).listFiles();
    		   for(File f_i:fs){
    			   try {
					urls.add(f_i.toURI().toURL());
				} catch (MalformedURLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		   }    		   
    	   }    	  
    	   URL[] urls_=urls.toArray(new URL[]{});    	   
    	   cargador = new URLClassLoader(urls_,ClassLoader.getSystemClassLoader());
       }
       public Class cargarComponente(String nombre){
    	   try {
			return cargador.loadClass(nombre);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	  return null; 
       }
}
