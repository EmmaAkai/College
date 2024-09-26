package ar.edu.unlp.info.oo1.BalanzaElectronica;

public class Balanza {

	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	
	
	public Balanza(int cantidadDeProductos, double precioTotal, double pesoTotal) {
		this.cantidadDeProductos = cantidadDeProductos;
		this.precioTotal = precioTotal;
		this.pesoTotal = pesoTotal;
	}
	


	public Balanza() {
		super();
	}



	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}


	public void setCantidadDeProductos(int cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
	}


	public double getPrecioTotal() {
		return precioTotal;
	}


	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}


	public double getPesoTotal() {
		return pesoTotal;
	}


	public void setPesoTotal(double pesoTotal) {
		this.pesoTotal = pesoTotal;
	}

	
	public void ponerEnCero() {
		this.setCantidadDeProductos(0);
		this.setPesoTotal(0);
		this.setPrecioTotal(0);
	}
	
	public void agregarProducto(Producto producto) {
		this.cantidadDeProductos++;
		this.precioTotal += producto.getPrecio();
		this.pesoTotal += producto.getPeso();
	}
	
	public Ticket emitirTicket() {
		Ticket ticket = new Ticket(this.getCantidadDeProductos(), this.getPesoTotal(), this.getPrecioTotal());//ME TIRA ERROR EN LOCALDATE
		return ticket;
	}
	
}
