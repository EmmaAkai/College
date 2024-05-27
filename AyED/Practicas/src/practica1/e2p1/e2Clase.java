package practica1.e2p1;

public class e2Clase {

    public static int[] multiplos(int n){
        int [] arreglo = new int[n];
        int i;
        for (i=0;i<n;i++) {
            arreglo[i]= (i+1)*n;
        }
    return arreglo;
    }

}