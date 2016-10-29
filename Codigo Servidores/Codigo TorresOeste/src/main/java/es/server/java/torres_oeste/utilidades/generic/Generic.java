package es.server.java.torres_oeste.utilidades.generic;

import java.util.Date;

import es.server.java.torres_oeste.utilidades.constantes.ConstantesServer;

public class Generic {

	public static long getFechaActual() {
		//TODO: change if necesarry need date of server not utc
		long millis = System.currentTimeMillis();
		//System.out.println("Miliseconds in UTC"+millis);
		final Date fechaActual = new Date();
		//System.out.println("Milisiconds Date" + fechaActual.getTime());
		return millis;
	}
	
	public static String checkNiceURL(String url){
		if(url != null){
			if(!url.contains("http")){
				url = ConstantesServer.URL_SERVER + url;
			}
		}
		return url;
	}
}
