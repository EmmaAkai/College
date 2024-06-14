package practica2.e6p2;

import Paquetes.BinaryTree;

public class Transformacion {
	
	private BinaryTree<Integer> ab;   //CREO LAS VARIABLES DE INSTANCIA

	public Transformacion(BinaryTree<Integer> ab) { //INICIALIZO LAS VARIABLES DE INSTANCIA
		this.ab = ab;
	}
	
	
	
	public BinaryTree<Integer> getAb() {
		return ab;
	}



	public BinaryTree<Integer> suma(BinaryTree<Integer> ab){
		
		resolver(this.getAb());
		return this.ab;
	}
	
	private int resolver(BinaryTree<Integer> ab) {
		int suma = 0;  //INICIALIZO LA SUMA DE SUS HIJOS EN 0
		
		if(ab.isLeaf()) { //SI ESTOY EN UNA HOJA
			suma = ab.getData(); //ACUMULO EN SUMA EL DATO DE LA HOJA
			ab.setData(0); //SI ES UNA HOJA LA SUMA DE SUS HIJOS ES 0, POR QUE NO TIENE 
			return suma; //DEVUELVO LA SUMA, EL VALOR DE LA HOJA ANTES DE MODIFICARLO
		}
		
		if(ab.hasLeftChild()) { //SI TIENE HIJO IZQUIERDO
			suma += resolver(ab.getLeftChild()); //ACUMULO EN SUMA LOS VALORES DE LOS HIJOS IZQUIERDOS
		}
		if(ab.hasRightChild()) { // SI TIENE HIJO DERECHO
			suma += resolver(ab.getRightChild()); //ACUMULO EN SUMA LOS VALORES DE LOS HIJOS DERECHOS
		}
		
		int aux = ab.getData();//AUX PARA NO PERDER EL DATO ORIGINAL ANTES DE MODIFICARLO POR LA SUMA DE SUS HIJOS
		ab.setData(suma); //REMPLAZO EL DATO DEL NODO EN EL QUE ESTOY CON LA SUMA DE LOS HIJOS OBTENIDOS HASTA AHORA
			
		return suma + aux;//RETORNO LA SUMA DE TODOS LOS HIJOS + EL VALOR QUE TENIA EL NODO ANTES DE SER MODIFICADO;
	
	}
			
			
}

