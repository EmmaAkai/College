/*Escribir en una clase ParcialArboles el método público con la siguiente firma:
public BinaryTree<?> sumAndDif(BinaryTree<Integer> arbol)
El método recibe un árbol binario de enteros y devuelve un nuevo árbol que contenga en cada
nodo dos tipos de información:
● La suma de los números a lo largo del camino desde la raíz hasta el nodo actual.
● La diferencia entre el número almacenado en el nodo original y el número almacenado en el
nodo padre.
*/

package Parciales;

import Paquetes.BinaryTree;

public class Parcial3 {


	public BinaryTree<SumDif> sumAndDif(BinaryTree<Integer> ab){
		BinaryTree<SumDif> abNuevo = new BinaryTree<>(); //Instancio el nuevo arbol

		if(!ab.isEmpty())// si el Arbol original no es empi 
			this.resolver(ab,abNuevo,0,0); //entro a resolver
		
		return abNuevo; //si estaba vacio devuelvo un nuevo arbol vacio
	}

	private void resolver(BinaryTree<Integer> ab, BinaryTree<SumDif> abNuevo, int sum, int dif) {
		int datoActual = ab.getData(); //inicializo el dato actual con el dato del ab original
		
		SumDif nodo = new SumDif(datoActual + sum, datoActual - dif); //creo un "nodo" para insertarle al abNuevo
		abNuevo.setData(nodo);//cargo el nuevo "nodo" con los registros del arbol original 
		
		if(ab.hasLeftChild()) { //Si tiene hijo izquierdo
			abNuevo.addLeftChild(new BinaryTree<SumDif>()); //instancio un nuevo nodo y se lo agrego como hijo izquierdo
			resolver(ab.getLeftChild(),abNuevo.getLeftChild(),sum+datoActual,datoActual);//recurso pasandole el nodo izq de
		}																			//ambos arboles y la suma de los recorridos
		if(ab.hasRightChild()) {//Si tiene hijo derecho
			abNuevo.addLeftChild(new BinaryTree<SumDif>());//instancio un nuevo nodo y se lo agrego como hijo derecho
			resolver(ab.getRightChild(),abNuevo.getRightChild(),sum+datoActual,datoActual);//recurso pasandole el nodo der de 
		}																			//ambos arboles y la suma de los recorridos
	}
}
