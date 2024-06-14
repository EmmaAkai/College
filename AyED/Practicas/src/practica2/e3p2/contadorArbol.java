/*Defina una clase Java denominada ContadorArbol cuya función principal es proveer métodos de
validación sobre árboles binarios de enteros. Para ello la clase tiene como variable de instancia un
BinaryTree<Integer>. Implemente en dicha clase un método denominado numerosPares() que
devuelve en una estructura adecuada (sin ningún criterio de orden) todos los elementos pares del
árbol (divisibles por 2).
a) Implemente el método realizando un recorrido InOrden.
b) Implemente el método realizando un recorrido PostOrden.
*/
package practica2.e3p2;

import java.util.*;
import Paquetes.BinaryTree;
import Paquetes.Queue;

public class contadorArbol {
	
	private BinaryTree<Integer> arb; // creo la variable de instancia Arb de tipo binaryTree<con integer dentro>
	
	public contadorArbol(BinaryTree<Integer> arb) { //lo instancio
		this.arb = arb;
	}

	
//PRE ORDEN --------------------------------------------
	public List<Integer> numerosParesPRE() { //creo la estructura para almacenar todos los numeros pares
		List<Integer> lis = new LinkedList<Integer>();
		if(!arb.isEmpty())
			this.nParesPRE(lis,arb); //llamo al metodo que evalua si este nodo es par
		return lis;
	}
	
	private void nParesPRE(List<Integer> lis, BinaryTree<Integer> arb) {
		if(arb.getData()%2==0) lis.add(arb.getData());
		if(arb.hasLeftChild())
			nParesPRE(lis,arb.getLeftChild());
		if(arb.hasRightChild())
			nParesPRE(lis,arb.getRightChild());
	}

	
//IN ORDEN --------------------------------------------
	public List<Integer> numerosParesIN(){
		List<Integer> lis = new LinkedList<Integer>();
		if(!arb.isEmpty())
			this.nParesIN(lis,arb);
		return lis;
	}
	
	private void nParesIN(List<Integer> lis, BinaryTree<Integer> arb) {
		if(arb.hasLeftChild())
			nParesIN(lis,arb.getLeftChild());
		if(arb.getData()%2==0) lis.add(arb.getData());
		if(arb.hasRightChild())
			nParesIN(lis,arb.getRightChild());
	}
	
//POS ORDEN -------------------------------------------
	public List<Integer> numerosParesPOS(){
		List<Integer> lis = new LinkedList<Integer>();
		if(!arb.isEmpty())
			this.nParesPOS(lis,arb);
		return lis;
	}
	
	private void nParesPOS(List<Integer> lis, BinaryTree<Integer> arb) {
		if(arb.hasLeftChild())
			nParesPOS(lis,arb.getLeftChild());
		if(arb.hasRightChild())
			nParesPOS(lis,arb.getRightChild());
		if(arb.getData()%2==0) lis.add(arb.getData());
	}
	
	public void ImprimirLista() {
		BinaryTree<Integer> ab = null;
		Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
		
		cola.enqueue(ab);
		cola.enqueue(null);
		
		while(!cola.isEmpty()) {
			ab = cola.dequeue();
			if(ab != null) {
				System.out.println(ab.getData() + "  ");
				if(ab.hasLeftChild())
					cola.enqueue(ab.getLeftChild());
				if(ab.hasRightChild())
					cola.enqueue(ab.getRightChild());
			}else if(cola.isEmpty()) {
				System.out.println();
				cola.enqueue(null);
			}
				
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Test numeros Pares");
        BinaryTree<Integer> ab = new BinaryTree<Integer>(4);
        ab.addLeftChild(new BinaryTree<Integer>(2));
        ab.addRightChild(new BinaryTree<Integer>(6));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        contadorArbol c = new contadorArbol(ab);
        System.out.println("Imprimir por niveles:");
        c.ImprimirLista();
        
        System.out.println("");
        List<Integer> lisIN = c.numerosParesIN();
        System.out.println("Los nodos pares del arbol en INORDER son: ");
        System.out.println(lisIN);
        
        List<Integer> lisPRE = c.numerosParesPRE();
        System.out.println("Los nodos pares del arbol en PREORDER son: ");
        System.out.println(lisPRE);
        
        List<Integer> lisPOST = c.numerosParesPOS();
        System.out.println("Los nodos pares del arbol en POSTORDER son: ");
        System.out.println(lisPOST);
		
		
	}

}
