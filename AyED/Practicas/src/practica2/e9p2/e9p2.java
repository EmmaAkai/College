package practica2.e9p2;

import Paquetes.BinaryTree;

public class e9p2 {
	private Resultado getNewNode(Integer original, int suma, Integer padre) {
		Resultado resultado = new Resultado();
		resultado.setSuma(suma + original);
		resultado.setResta(original - padre);
		return resultado;
	}

	private BinaryTree<Resultado> getNewTree(BinaryTree<Integer> arbol, int suma, Integer padre) {
		BinaryTree<Resultado> result = new BinaryTree<Resultado>();
		Integer oldData = arbol.getData();
		result.setData(this.getNewNode(oldData, suma, padre));
		suma = result.getData().getSuma();
		if (arbol.hasLeftChild()) {
			result.addLeftChild(this.getNewTree(arbol.getLeftChild(), suma, oldData));
		}
		if (arbol.hasRightChild()) {
			result.addRightChild(this.getNewTree(arbol.getRightChild(), suma, oldData));
		}
		return result;
	}

	public BinaryTree<Resultado> sumAndDif(BinaryTree<Integer> arbol) {
		if ((arbol != null) && !arbol.isEmpty()) {
			return this.getNewTree(arbol, 0, 0);
		}
		return new BinaryTree<Resultado>();
	}
}
public class Resultado {
	private int suma;
	private int resta;

	public int getSuma() {
		return suma;
	}

	public void setSuma(int suma) {
		this.suma = suma;
	}
	
	public int getResta() {
		return resta;
	}

	public void setResta(int resta) {
		this.resta = resta;
	}
	
	public String toString() {
		return this.getSuma() + "|" + this.getResta();
	}
}