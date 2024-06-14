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

public class Ej4p2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BinaryTree<Integer> Arb = new BinaryTree<Integer>(); //Instancio el arbol
		
		for (int i = 0;i>10;i++) { //Lo cargo con numeros en teoria, pero no funciona
			Arb.add(i);
		}
		
		Arb.imprimirPorNiveles();
		
		RedBinariaLlena RedBin = new RedBinariaLlena(Arb); //Instancio la red binaria
		
		
		System.out.print("Retraso max: " + RedBin.RetardoDeEnvio()); //Imprimo y hago la busqueda del camino mas largo
	}

}
