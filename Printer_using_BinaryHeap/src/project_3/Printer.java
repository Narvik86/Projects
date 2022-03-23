/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project_3;

import java.io.*;
import java.util.Scanner;

public class Printer {
      public static void main( String [ ] args ) throws BinaryHeap.UnderflowException, FileNotFoundException {
          
          String name;
          String flag;
          int prior;
          int numPages;
                 
          // read in files by Scanner
          File file = new File("input.txt");
          Scanner inputFile = new Scanner(file);
          
          //create a binary heap to store contents
          BinaryHeap<Printjob> todoList = new BinaryHeap<Printjob>();  
          
          //read in file from the file line by line.
          while(inputFile.hasNext()) {
              
              // store each elements in variables
              name = inputFile.next();
              prior = Integer.parseInt(inputFile.next());
              numPages = Integer.parseInt(inputFile.next());
              flag = inputFile.next();
              
              // if inside job
              if(flag.equals("I")) {
                // add printjob element to heap  
                Printjob inside = new Printjob(name, prior, numPages);
                todoList.insert(inside);
              } else {
                  //if outside job store them in same heap but different instance
                  OutsidePrintjob outside = new OutsidePrintjob(name, prior, numPages);
                  todoList.insert(outside);
              }              
          }
          inputFile.close();
          
          System.out.println("|  Name  | Priority | Pages |  cost |");
          
          //print out the heap
          while(!todoList.isEmpty()) {
              
              //delete from min so it prints least order
              Printjob printOut = todoList.deleteMin();
              
              // if it is outside job print cost follow by elements
              if(printOut instanceof OutsidePrintjob) {
                  OutsidePrintjob outside = (OutsidePrintjob) printOut;
                  System.out.printf("%-15s",outside.getName());
                  System.out.print(outside.getPrior() + "\t");
                  System.out.print(outside.getNumPages() + "\t");
                  System.out.print(outside.getCost() + "\n");
                  
              // if inside job, cost is not displayed    
              } else {
                  System.out.printf("%-15s",printOut.getName());
                  System.out.print(printOut.getPrior() + "\t");
                  System.out.print(printOut.getNumPages() + "\n");
              }
              
          }
          
      }
}
