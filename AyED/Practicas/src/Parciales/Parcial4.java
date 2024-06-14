/*Implemente en la clase Parcial el metodo:
 * 
 *   resolver(BinaryTree<Integer> ab);
 *   
 *   que devuelva una lista con los valores de los nodos que tengan mismo numero de
 *   descendientes tanto por su subarbol izquierdo como por su subarbol derecho	
 *   
 *   */
package Parciales;

import Paquetes.BinaryTree;
import java.util.LinkedList;

public class Parcial4 {
	
	private BinaryTree<Integer> ab;

	public Parcial4(BinaryTree<Integer> ab) {
		super();
		this.ab = ab;
	}

	public LinkedList<Integer> resolver(BinaryTree<Integer> ab){
		LinkedList<Integer> Lista = new LinkedList<Integer>();
		
		if(!ab.isEmpty()) {
			resolver2(ab,Lista);
		}
		
		
		return Lista;
	}

	private int resolver2(BinaryTree<Integer> ab, LinkedList<Integer> List) {
		int izq=0;
		int der=0;
		
		if(ab.hasLeftChild())
			izq = resolver2(ab.getLeftChild(),List);
		if(ab.hasRightChild())
			der = resolver2(ab.getRightChild(),List);
		
		if(izq == der)
			List.add(ab.getData());
		
		return izq + der + 1;
	}


}	
	

