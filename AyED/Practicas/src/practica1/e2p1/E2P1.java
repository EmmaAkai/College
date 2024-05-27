package practica1.e2p1;
import java.util.Scanner;


public class E2P1 {

    public static void main (String [] args) {
        int [] multiplos;
        System.out.print("Ingrese 'n': ");
        Scanner scan = new Scanner(System.in);
        multiplos = e2Clase.multiplos(scan.nextInt());
        System.out.print("El arreglo generado es:");
        for (int n:multiplos) {
            System.out.print(n);
        }
    }

}