package es.server.java.baronha.utilidades.errores;

public class DAOException extends Exception {

	private static final long serialVersionUID = 5053259700756269668L;

	public DAOException(Exception e) {
		super(e.getMessage(), e.getCause());
		System.out.println(e);
	}
}
