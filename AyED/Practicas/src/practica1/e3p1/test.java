package practica1.e3p1;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		estudiante[] Estudiantes = new estudiante[2];
		profesor[] Profesores = new profesor[3];
	
		Estudiantes[0] = new estudiante("Gaspar","Consagra","t1","Consagrita@gmail.com","Alsina y Algo");
		Estudiantes[1] = new estudiante("Bruno","Stranges","m1","CasiPrimera@gmail.com","Alsina y otra");
		
		Profesores[0] = new profesor("Ema","Marcello","Piton@gmail.com","Fisica","UNLP");
		Profesores[1] = new profesor("Gian","Marcello","Pitin@gmail.com","Putacion","unlp");
		Profesores[2] = new profesor("Valen","Gaimes","micropi@gmail.com","putincin","UnLp");
		
		System.out.println("Los Estudiantes son:");
		for (estudiante Est: Estudiantes) {
			System.out.println(Est.tusDatos());
		}
		
		
		System.out.println("Los Profesores son:");
		for (profesor Prof: Profesores) {
			System.out.println(Prof.tusDatos());
		}
	}

}
