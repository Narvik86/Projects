/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TTTGame;


public class Box {
    private int row;
    private int col;
    static final String DASH = "-";
    private String placeHolder = Box.DASH;
    
       
    Box(int row, int col){
        this.row = row;
        this.col = col; 
    }
    
    String getPlaceHolder() {
        return placeHolder;
    }
    
    boolean setPlaceHolder(String mark) {
        if(isAvailable()) {
            this.placeHolder = mark;
            return true;
        }
        return false;
    }
    
    boolean isAvailable() {
        return (this.placeHolder.equals(Box.DASH));
    }
    
    void print() {
        System.out.print(" " + placeHolder);
   
        }
    
}
