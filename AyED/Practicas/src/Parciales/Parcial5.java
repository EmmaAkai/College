/*Ejercicio 7 de parciales
 * Implemente en la clase Parcial el metodo SumaIMparesPosOrdenMayorA que recibe un arbol binario
 * de enteros positivos (ab) y un numero entero(num). Este metodo suma todos los numeros impares del arbol que 
 * son mayores al parametro recibido realizandolo en un recorrido PosOrden 
 * */
package Parciales;

import Paquetes.BinaryTree;

public class Parcial5 {
	private BinaryTree<Integer> ab;

	public Parcial5(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public Integer sumaImparesPosOrdenMayorA(BinaryTree<Integer> ab, int num) {
		if(ab.isEmpty())
			return 0;
		
		int tot = 0;
		
		if(ab.hasLeftChild())
			tot +=  sumaImparesPosOrdenMayorA(ab.getLeftChild(),num);
		if(ab.hasRightChild())
			tot += sumaImparesPosOrdenMayorA(ab.getRightChild(),num);
		
		if(!(ab.getData() % 2 ==0) && (ab.getData()>num))
			tot+= ab.getData();
		
		return tot;
	}
}
