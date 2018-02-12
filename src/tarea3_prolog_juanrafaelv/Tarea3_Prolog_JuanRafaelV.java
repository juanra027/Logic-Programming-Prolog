/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tarea3_prolog_juanrafaelv;
import org.jpl7.Query;
import org.jpl7.Term;
 
/**
 *
 * @author : Joel Fernandez
 * @Web    : www.codebotic.com
 * @Tema   : Conectar Prolog con Java
 */
public class Tarea3_Prolog_JuanRafaelV {
 
    public static void main(String[] args) {
        try{
            String conexion ="consult('juanra_temp_aux.pl')";
            System.out.println('A');
            Query con = new Query(conexion);
            System.out.println('B');
            System.out.println(conexion + "   " + (con.hasMoreSolutions() ? "ACEPTADO" : "FALLADO"));
            System.out.println('C');
            
            String reset= "reset().";
            Query pruebaA = new Query(reset);
            pruebaA.oneSolution();
            
            
            
            Vista1 vista1 = new Vista1();
            vista1.setVisible (true); 
            
            
            
            //System.out.println(asd2);
        }
        catch(Exception e){
            System.out.println("fuck");
        }
       
    }
   
}