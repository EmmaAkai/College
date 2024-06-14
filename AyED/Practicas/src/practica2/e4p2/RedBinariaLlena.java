/*Los nodos que conforman una red binaria llena tiene la particularidad de que todos ellos conocen
cuál es su retardo de reenvío. El retardo de reenvío se define como el período comprendido entre
que un nodo recibe un mensaje y lo reenvía a sus dos hijos.

Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
hasta llegar a las hojas en una red binaria llena. En el ejemplo, debería retornar 10+3+9+12=34
(Si hay más de un máximo retorne el último valor hallado).

Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de
segundos.

a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
problema.
b) Cree una clase Java llamada RedBinariaLlena donde implementará lo solicitado en el
método retardoReenvio():int
*/
package practica2.e4p2;

import Paquetes.BinaryTree;

public class RedBinariaLlena {
	
	private BinaryTree<Integer> arb;
	
	public RedBinariaLlena(BinaryTree<Integer> arb) {
		this.arb = arb;
	}
	
	public void Imprimir() {
		arb.imprimirPorNiveles();
	}
	
	private int RetardoDeEnvio(BinaryTree<Integer> arb) {
		if(arb.isLeaf())			//Si es hoja
			return arb.getData(); 	//retorno la hoja xq es el camino mas largo
			
		int L = 0; 		//Sino instancio L
		int R = 0;		//y intancio R
		
		if(arb.hasLeftChild())						//Si tiene hijo izquierdo		
			L = RetardoDeEnvio(arb.getLeftChild()); //recurso al hijo izquierdo
		if(arb.hasRightChild())						//Si tiene hijo derecho
			R = RetardoDeEnvio(arb.getRightChild());//recurso al hijo derecho
					//Cuando dejo de recursar
		if(L > R)	//pregunto cual es mayor
			return arb.getData()+L;//Si L > R retorno la raiz + lo que conte 
		else
			return arb.getData()+R;//Si R > L retorno la raiz + lo que conte
	}
	
	public int RetardoDeEnvio() {
		return RetardoDeEnvio(this.arb);
	}
	
}
