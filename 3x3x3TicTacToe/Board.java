/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TTTGame;


public class Board {
    
    private Box[] boxes;
    private String name;
    private int boardRowSize;
    private int boardColSize;
    
    Board(){
        this(3, 3, "3 * 3 Board");
    }
    
    Board(int rowSize, int colSize, String name){
        this.setName(name);
        this.setSize(rowSize, colSize);
    }
    
    private void setSize(int row, int col){
        
        if(row < 3 || col < 3) {
            System.out.println("mon board size is 3 * 3");
        } else {
        this.boardColSize = col;
        this.boardRowSize = row;
        }
        init();
    }
    
    void init() {
        boxes = new Box[boardColSize * boardRowSize];
        for(int i = 0; i < boxes.length; i++) {
            Box b = new Box(i/boardColSize, i%boardColSize);
            boxes[i] = b;
        }
        print();
    }
    

    private void setName(String name) {
        this.name = name;    
    }
    

    
    void print(){
        System.out.println("\nprinting the " + this.name + "_" +
                this.boardRowSize + "*" + this.boardColSize + " board info....");
        for(int i = 0; i < boxes.length; i++) {
            if(i != 0 && i%boardColSize == 0) System.out.println();
            
            boxes[i].print();
        }
        
    }

    //TODO
    boolean makeMove(String mark, int row, int col) {
        
        int index = 0; //index var with initial value 0
        
        // calculating the place of array by comparing each row and col
        if(row == 0) {
            index = col;
        } else if(row == 1) {
            index = col + 3;
        } else {
            index = col + 6;
        }
        
        // if marked, return true and move to next player, and if not, return false and keep loop with current player
        if(boxes[index].setPlaceHolder(mark)) {
            return true;
        }
        return false;
          
    }
    
    public boolean isFull() {
        for(Box b : boxes)
            if(b.isAvailable()) {
                return false;
            }
        return true;
    }
    
    public boolean isWinner(){
        
        // win condition
        // .equal method was used since the code is comparing the contents not address
        if(!boxes[0].getPlaceHolder().equals("-")){
            if(boxes[0].getPlaceHolder().equals(boxes[1].getPlaceHolder())  && boxes[0].getPlaceHolder().equals(boxes[2].getPlaceHolder())){
            return true;
            }
            if(boxes[0].getPlaceHolder().equals(boxes[3].getPlaceHolder())  && boxes[0].getPlaceHolder().equals( boxes[6].getPlaceHolder())){
            return true;
            }
            if(boxes[0].getPlaceHolder().equals(boxes[4].getPlaceHolder())  && boxes[0].getPlaceHolder().equals( boxes[8].getPlaceHolder())){
            return true;
            }
        }
     
        if(boxes[1].getPlaceHolder().equals(boxes[4].getPlaceHolder())  && boxes[1].getPlaceHolder().equals(boxes[7].getPlaceHolder()) && !(boxes[1].getPlaceHolder().equals("-"))){
            return true;
        }
        if(boxes[2].getPlaceHolder().equals(boxes[5].getPlaceHolder())  && boxes[2].getPlaceHolder().equals(boxes[8].getPlaceHolder()) && !(boxes[2].getPlaceHolder().equals("-"))){
            return true;
        }
       if(boxes[2].getPlaceHolder().equals(boxes[4].getPlaceHolder())  && boxes[2].getPlaceHolder().equals(boxes[6].getPlaceHolder()) && !(boxes[2].getPlaceHolder().equals("-"))){
            return true;
        }
        if(boxes[3].getPlaceHolder().equals(boxes[4].getPlaceHolder())  && boxes[3].getPlaceHolder().equals(boxes[5].getPlaceHolder()) && !(boxes[3].getPlaceHolder().equals("-"))){
            return true;
        }
        if(boxes[6].getPlaceHolder().equals(boxes[7].getPlaceHolder())  && boxes[6].getPlaceHolder().equals(boxes[8].getPlaceHolder()) && !(boxes[6].getPlaceHolder().equals("-"))){
            return true;
        }
        
        return false;
    }
    
}
