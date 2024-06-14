package practica2.e5p2;

import Paquetes.BinaryTree;

public class Ej5p2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BinaryTree<Integer> Arb = new BinaryTree<Integer>();
	
		for(int i=0;i<10;i++){
			Arb.add(i);
		}
		
		//Arb.imprimirPorNiveles();
		
		ProfundidadDeArbolBinario Prof = new ProfundidadDeArbolBinario(Arb);
		
		for(int i=0;i<4;i++)
			System.out.print("Suma del nivel "+i+": " + Prof.SumaElementosProfundidad(i));
		
	}
}
