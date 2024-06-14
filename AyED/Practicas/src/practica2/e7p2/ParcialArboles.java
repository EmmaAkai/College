/*Ejercicio 7
Escribir en una clase ParcialArboles que contenga UNA ÚNICA variable de instancia de tipo
BinaryTree de valores enteros NO repetidos y el método público con la siguiente firma:
public boolean isLeftTree (int num)
El método devuelve true si el subárbol cuya raíz es “num”, tiene en su subárbol izquierdo una
cantidad mayor estricta de árboles con un único hijo que en su subárbol derecho. Y false en caso
contrario. Consideraciones:
● Si “num” no se encuentra en el árbol, devuelve false.
● Si el árbol con raíz “num” no cuenta con una de sus ramas, considere que en esa rama hay
-1 árboles con único hijo.
*/
package practica2.e7p2;

import Paquetes.BinaryTree;

public class ParcialArboles {
	
	private BinaryTree<Integer> ab;

	public ParcialArboles(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public boolean IsLeftTree(int num) {		
		boolean cumple = false;
		if(!ab.isEmpty())
			resolver(this.ab,cumple);
		
		return cumple;
	}
	
	private void resolver(BinaryTree<Integer> ab, boolean cumple) {
		
	}
	
}
