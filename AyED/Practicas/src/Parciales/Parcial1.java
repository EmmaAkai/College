/*Implemente en la clase Parcial el metodo Resolver, que recibe un arbol binario de enteros positivos
 y un numero entero(min) y devuelve un camino que cumple con la siguiente condicion: "La cantidad de 
 numeros pares que contenga dicho camino debe ser mayor o igual al parametro "min".
 
 Si existen varios caminos que cumplen la condicion, el metodo debe retornar el primero que encuentre
 
 public ListaGenerica<Integer> resolver(ArbolBinario<Integer> ab, int min)
 
 
 
 
 */

package Parciales;

import Paquetes.BinaryTree;
import java.util.LinkedList;

public class Parcial1 {

	
	public LinkedList<Integer> resolver(BinaryTree<Integer> ab, int min) {
		
		LinkedList<Integer> Lista = new LinkedList<Integer>();
		
		if(!ab.isEmpty())
			resolver2(ab,Lista,min);
		
		return Lista;
	}
	
	private boolean resolver2(BinaryTree<Integer> ab, LinkedList<Integer> Lista, int min) {
		boolean encontre = false;
		Lista.lastIndexOf(ab.getData()); //NO SE QUE MIERDA DICE EL PARCIAL ENCIMA ESTE ESTA EN INGLES, YO SUPONGO QUE ES ESE
		
		if(ab.getData() % 2 == 0)
			min--;
		
		if(ab.isLeaf()) {
			if (min<=0) {
				encontre=  true;
				return encontre;
			}else Lista.remove(Lista.size());//NOSE QUE MIERDA DICE ACA---- SUPONGO QUE ES TAMANIO
		
		}else {
			if(ab.hasLeftChild() && !encontre)
				encontre = resolver2(ab.getLeftChild(),Lista,min);
			
			if(ab.hasRightChild() && !encontre)
				encontre = resolver2(ab.getRightChild(),Lista,min);
			
			if(!encontre)
				Lista.remove(Lista.size());
		}
		
		return encontre;
	}
}
