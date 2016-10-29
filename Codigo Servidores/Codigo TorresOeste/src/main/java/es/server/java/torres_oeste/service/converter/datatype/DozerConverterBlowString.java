package es.server.java.torres_oeste.service.converter.datatype;


import java.sql.SQLException;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.dozer.DozerConverter;

public class DozerConverterBlowString  extends DozerConverter<java.sql.Blob, String>{
	public DozerConverterBlowString() {
	    super(java.sql.Blob.class, String.class);
	  }

	@Override
	public String convertTo(java.sql.Blob source, String destination) {
		// TODO Auto-generated method stub
		if(source == null){
			return null;
		}
		byte[] bdata;
		try {
		bdata = source.getBytes(1,(int) source.length());
		return new String(bdata);
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public java.sql.Blob convertFrom(String source, java.sql.Blob destination) {
		try {
			if(source!=null){
				return(source.getBytes()!=null?new SerialBlob( source.getBytes()):null);
			}else
				return null;
		} catch (SerialException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
