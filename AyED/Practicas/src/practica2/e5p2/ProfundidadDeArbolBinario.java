/*Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de
instancia un árbol binario de números enteros y un método de instancia

sumaElementosProfundidad (int p):int el cuál devuelve la suma de todos los nodos del árbol
que se encuentren a la profundidad pasada como argumento.*/
package practica2.e5p2;

import Paquetes.BinaryTree;
import Paquetes.Queue;

public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> Arb;

	public ProfundidadDeArbolBinario(BinaryTree<Integer> Arb) {
		Arb = this.Arb;
	}
	
	
	public BinaryTree<Integer> getArb() {
		return this.Arb;
	}

	
	
	public int SumaElementosProfundidad (int p) {
		Queue<BinaryTree<Integer>> queue = new Queue<BinaryTree<Integer>>(); //NO ENTIENDO XQ LO ENCOLO
		Queue<Integer> levels = new Queue<Integer>();						 // X2
		
		int Suma=0;
		
		queue.enqueue(this.getArb());  	//X3
		levels.enqueue(0); 				//X4
		
		while(!queue.isEmpty()) {
			BinaryTree<Integer> e = queue.dequeue(); //e is null=????????
			int l= levels.dequeue();
			if(l == p)
				Suma+= e.getData();
			if(e.hasLeftChild() && l<p) {
				levels.enqueue(l+1);
				queue.enqueue(e.getLeftChild());
			}
			if(e.hasRightChild() && l<p) {
				levels.enqueue(l+1);
				queue.enqueue(e.getRightChild());
			}
		}
		return Suma;
	}
	
	
	
	
	
	
	
	
}
