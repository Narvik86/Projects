/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project_3;

/**
 *
 * @author Narvik
 */

// inherits Printjob
public class OutsidePrintjob extends Printjob {
    
    public OutsidePrintjob(String name, int prior, int numPages) {
        super(name, prior, numPages);
    }
    
    // calculate the cost (each page is 10 cents)
    public int getCost() {
       return super.getPrior() * super.getNumPages() * 10;
    }     
}
    
    

