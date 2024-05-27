package practica1.e3p1;

public class profesor {

	private String Nombre;
	private String Apellido;
	private String eMail;
	private String Catedra;
	private String Facultad;
	
	
	public profesor(String nombre, String apellido, String eMail, String catedra, String facultad) {
		super();
		this.Nombre = nombre;
		this.Apellido = apellido;
		this.eMail = eMail;
		this.Catedra = catedra;
		this.Facultad = facultad;
	}


	public String getNombre() {
		return Nombre;
	}


	public void setNombre(String nombre) {
		Nombre = nombre;
	}


	public String getApellido() {
		return Apellido;
	}


	public void setApellido(String apellido) {
		Apellido = apellido;
	}


	public String geteMail() {
		return eMail;
	}


	public void seteMail(String eMail) {
		this.eMail = eMail;
	}


	public String getCatedra() {
		return Catedra;
	}


	public void setCatedra(String catedra) {
		Catedra = catedra;
	}


	public String getFacultad() {
		return Facultad;
	}


	public void setFacultad(String facultad) {
		Facultad = facultad;
	}

	
	public String tusDatos() {
		return this.getNombre() + " " + this.getApellido() + ". " + this.geteMail() + ". Catedra: " + this.getCatedra() + ". Facultad: " + this.getFacultad() + ".";
	}
}
