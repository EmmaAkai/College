package practica1.e1p1;

public class e1p1 {
    public static void MetodoFor(int a, int b) {
        System.out.println("Metodo con For:");
        System.out.println("Los numeros entre "+a+" y "+b+" son: ");
        for (int i=a; i<=b; i++) {
            System.out.println(i);
        }
    }
    public static void MetodoWhile(int a, int b) {
        System.out.println("Metodo con While:");
        System.out.println("Los numeros entre "+a+" y "+b+" son: ");
        while (a<=b) {
            System.out.println(a);
            a++;
        }
    }
    public static void MetodoRecursivo(int a, int b) {
        System.out.println(a);
        if(a<b) {
            a++;
            MetodoRecursivo(a,b);
        }

    }
}