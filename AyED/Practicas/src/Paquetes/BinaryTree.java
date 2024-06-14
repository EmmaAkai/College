package Paquetes;


public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	
	
	public  int contarHojas() {
		int leftC =0;   	//inicializo los hijos izquierdos en 0
        int rightC = 0;		//los derechos en 0
        
        if (this.isEmpty()) return 0; 	//si es un nodo vacio retorno 0
        else if(this.isLeaf()) return 1; 	//si es una hoja retorno 1
        
        else { 			// si no esta vacio ni es hoja entro
            if(this.hasLeftChild()) 		//si tiene un hijo izquierdo entra
                leftC = this.getLeftChild().contarHojas(); 		//llama a este mismo metodo para contar las hojas del nodo al que entro
            
            if(this.hasRightChild()) 		//cuando termina, si tiene hijo derecho, entra al derecho
                rightC = this.getRightChild().contarHojas();	//entra recursivamente a contar las hojas
            
            return leftC + rightC;	// retorno la cantidad de hijos totales  
        }
	}
		
		
    	 
    public BinaryTree<T> espejo(){
    	BinaryTree<T> arbEspejo = new BinaryTree<T>(this.getData()); //Instancio un nuevo arbol de tipo arbol
        
    	if(this.hasLeftChild()) {		//si el arbol original tiene hijo izq
            arbEspejo.addRightChild(this.getLeftChild().espejo());	//le añado el hijo izq al hijo der del "arbEspejo"
        }
        
    	if(this.hasRightChild()) {		//si el arbol original tiene hijo der
            arbEspejo.addLeftChild(this.getRightChild().espejo());	//añado el hijo der al hijo izq del "arbEspejo"
        }
        
    	return arbEspejo;	//RETORNO EL NUEVO ARBOL ESPEJADO		  
 	   
    }
    
	// 0<=n<=m
    public void entreNiveles(int n, int m){
		Queue<BinaryTree<T>> queue = new Queue<BinaryTree<T>>();//Instacio una Q de tipo arboles
		
		Queue<Integer> levels  = new Queue<Integer>(); //intancio otra Q de tipo Integer
		
		queue.enqueue(this); //encolo este arbol
		levels.enqueue(0); //encolo los niveles
		
		while (!queue.isEmpty()) {
			BinaryTree<T> e = queue.dequeue();
			int l = levels.dequeue();
			if ((l>=n) && (l<=m)) {				
				System.out.println("l"+l+": "+e.toString());
			}

			if ((e.hasLeftChild()) && ((l+1)<=m)) {
				levels.enqueue(l+1);
				queue.enqueue(e.getLeftChild());
			}
			
			if ((e.hasRightChild()) && ((l+1)<=m)) {
				levels.enqueue(l+1);
				queue.enqueue(e.getRightChild());
			}
		}
	}
    
	public void imprimirPorNiveles(){
		Queue<BinaryTree<T>> queue = new Queue<BinaryTree<T>>();
		Queue<Integer> levels  = new Queue<Integer>();
		queue.enqueue(this);
		levels.enqueue(0);
		while (!queue.isEmpty()) {
			BinaryTree<T> e = queue.dequeue();
			int l = levels.dequeue();
			System.out.println("l"+l+": "+e.toString());
			

			if (e.hasLeftChild()) {
				levels.enqueue(l+1);
				queue.enqueue(e.getLeftChild());
			}
			if (e.hasRightChild()) {
				levels.enqueue(l+1);
				queue.enqueue(e.getRightChild());
			}
		}
	}
    
	public void add(T data) {
		if (this.getData()==null) {
			this.setData(data);
			return;
		}
		Queue<BinaryTree<T>> queue = new Queue<BinaryTree<T>>();
		queue.enqueue(this);
		while (!queue.isEmpty()) {
			BinaryTree<T> e = queue.dequeue();
			if (e.hasLeftChild()) {
				queue.enqueue(e.getLeftChild());
			} else {
				e.addLeftChild(new BinaryTree<T>(data));
				break;
			}
			if (e.hasRightChild()) {
				queue.enqueue(e.getRightChild());
			} else {
				e.addRightChild(new BinaryTree<T>(data));
				break;
			}
		}
		}
	
	public void add(BinaryTree<T> tree) {
		if (this.getData()==null) {
			this.setData(tree.getData());
			this.addLeftChild(tree.getLeftChild());
			this.addRightChild(tree.getRightChild());
			return;
		}
		Queue<BinaryTree<T>> queue = new Queue<BinaryTree<T>>();
		queue.enqueue(this);
		while (!queue.isEmpty()) {
			BinaryTree<T> e = queue.dequeue();
			if (e.hasLeftChild()) {
				queue.enqueue(e.getLeftChild());
			} else {
				e.addLeftChild(tree);
				break;
			}
			if (e.hasRightChild()) {
				queue.enqueue(e.getRightChild());
			} else {
				e.addRightChild(tree);
				break;
			}
		}
		}
	
	public void imprimirArbol() {
        //preorden
		if(this.hasLeftChild()) this.getLeftChild().imprimirArbol();
        //inorden
		System.out.print(this.getData() + " ");
        if(this.hasRightChild()) this.getRightChild().imprimirArbol();
        //posorden
    }
		
}

