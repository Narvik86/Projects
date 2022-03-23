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
public class Printjob implements Comparable <Printjob>{
    
    //variables
    private String name;
    private int prior;
    private int numPages;
    
    //constructor
    Printjob(String name, int prior, int numPages) {
        this.name = name;
        this.prior = prior;
        this.numPages = numPages;
    }
    
    ///////// setters and getters ////////
    public void setName(String name) {
        this.name = name;
    }
    
    public void setPrior(int prior) {
        this.prior = prior;
    }
    
    public void setNumPages(int numPages) {
        this.numPages = numPages;
    }
    
    public String getName() {
        return name;
    }
    
    public int getPrior() {
        return prior;
    }
    
    public int getNumPages() {
        return numPages;
    }    
    ///////// setters and getters ////////
    
    
    
    @Override  // compare and set priority by priority * # of pages
    public int compareTo(Printjob o) {
        int jobPrior1 = this.getPrior() * this.getNumPages();
        int jobPrior2 = o.getPrior() * o.getNumPages();
        
        if(jobPrior1 < jobPrior2) {
            return -1;
        } else if(jobPrior1 > jobPrior2) {
             return 1;
        } else return 0;
    }
    
}
