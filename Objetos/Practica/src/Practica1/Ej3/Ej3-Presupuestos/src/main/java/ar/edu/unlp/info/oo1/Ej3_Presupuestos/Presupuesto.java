package ar.edu.unlp.info.oo1.Ej3_Presupuestos;

import java.util.List;
import java.util.ArrayList;
import java.time.LocalDate;

public class Presupuesto {
	
	private LocalDate fecha;
	private String cliente;
	private List <Item> items;
	
	public Presupuesto(String cliente) {
		this.fecha = LocalDate.now();
		this.items = new ArrayList<Item>(); //Se debe pasar el ArrayList porque necesitamos pasar inicializado el primer item, se hace con un arrayList por que es una buena practica
		this.cliente = cliente;
	}
	public Presupuesto() {
		this.fecha = LocalDate.now();
		this.items = new ArrayList<Item>();
	}
	
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
	public void agregarItem(Item item) {
		this.items.add(item);
	}
	
	public double calcularTotal() {
		return this.items.stream().mapToDouble(costoItems -> costoItems.costo()).sum();
	}//mapToDouble mapea el objeto  y me devuelve un double con la sumatoria(.sum) de todos los doubles en toda la lista
}
