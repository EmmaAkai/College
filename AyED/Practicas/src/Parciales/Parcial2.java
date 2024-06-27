/*Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de
instancia un árbol binario de números enteros y un método de instancia
sumaElementosProfundidad (int p):int el cuál devuelve la suma de todos los nodos del árbol
que se encuentren a la profundidad pasada como argumento.*/
package Parciales;

import Paquetes.BinaryTree;

public class Parcial2 {
	private BinaryTree<Integer> ab;

	public Parcial2(BinaryTree<Integer> ab) {
		this.ab = ab;
	} 
	
	public int sumaElementosProfundidad(int p) {
        if(!ab.isEmpty())
            return sumaElementosProfundidad(p,ab,0);
        else
            return 0;
    }
    
    private int sumaElementosProfundidad(int p, BinaryTree<Integer> ab, int nivActual) {
        if(p == nivActual) { //Si estamos en la raiz se retorna el dato de la raiz
            return ab.getData();
        } else {   //sino
            int suma = 0; //instancio Suma
            if(ab.hasLeftChild()) //si tiene hijo izquierdo
                suma+= sumaElementosProfundidad(p, ab.getLeftChild(), nivActual+1);//Recurso al hijo derecho izquierdo el nivel act
            if(ab.hasRightChild())	//si tiene hijo derecho
                suma+= sumaElementosProfundidad(p, ab.getRightChild(), nivActual+1);//Recurso al hijo derecho , lvl+1
            return suma; //retorno suma
        }
    }
}