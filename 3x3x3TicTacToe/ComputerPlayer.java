/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TTTGame;

public class ComputerPlayer {
    
    private String name;
    private String mark;
    
    public ComputerPlayer(String name, String mark){
        this.setName(name);
        this.setMark(mark);    
    }
    
    String getName() {
        return name;
    }

    private void setName(String name) {
        this.name = name;
    }

    String getMark(){
        return mark;
    }
    
    private void setMark(String mark) {
        this.mark = mark;
    }
   
    public int randomNumber(int range) {
        return (int) (Math.random() * range);
    }
    
}
