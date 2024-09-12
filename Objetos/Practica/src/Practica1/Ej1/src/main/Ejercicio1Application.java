package Practica1.Ej1.src.main;

import javax.swing.SwingUtilities;

import Practica1.Ej1.src.main.ui.WallPostUI;

public class Ejercicio1Application {

  public static void main(String[] args) {

    // https://docs.oracle.com/en/java/javase/11/docs/api/java.desktop/javax/swing/package-summary.html
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        new WallPostUI();
      }
    });
  }

}
