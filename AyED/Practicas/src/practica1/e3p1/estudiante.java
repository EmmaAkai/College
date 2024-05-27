package practica1.e3p1;

public class estudiante {

	private String Nombre;
	private String Apellido;
	private String Comision;
	private String eMail;
	private String direccion;
	
	public estudiante(String nombre, String apellido, String comision, String eMail, String direccion) {
		super();
		Nombre = nombre;
		Apellido = apellido;
		Comision = comision;
		this.eMail = eMail;
		this.direccion = direccion;
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

	public String getComision() {
		return Comision;
	}

	public void setComision(String comision) {
		Comision = comision;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String tusDatos() {
		return this.getNombre() +" "+ this.getApellido() + ". Comision: " + this.getComision() + ". eMail: "+ this.geteMail() + ". Residencia: " + this.getDireccion() + ".";
	}
	
}
