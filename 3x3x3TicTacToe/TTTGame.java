/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TTTGame;

/**
 *
 * @author Narvik
 */
class TTTGame {
    
    private ComputerPlayer players[] = new ComputerPlayer[2];
    private Board board;
    
    private String[] marks = {"X", "O"};
    private String name = "TicTacToe";
    
    private int gameRowSize = 3;
    private int gameColSize = 3;
    private int gameScoreToWin = 3;
    
    private int currentPlayerIndex = -1;
    
    public TTTGame() {
        setPlayers();
        setBoard();
    }

    private void setPlayers() {
        for(int i = 0; i < players.length; i++) {
            ComputerPlayer p = new ComputerPlayer("player" + (i+1), marks[i]);
            players[i] = p;
        }
     }

    private void setBoard() {
        this.board = new Board(gameRowSize, gameColSize, "TTTGame");
    }

   /*
    1 = start the game message
    2 = select the current palyer index
    3 = player sould select row and col to place the mark
    4 = board should check if the box is available and if so place the mark otherwise repeat the process
    5 = then print the board
    6 = repeat the steps for the other player until one player win or board is full  
    
    */
    
    public void start() {
        System.out.println("\ngame started... ");
        do {
            switchPlayer();
            while(!board.makeMove(players[this.currentPlayerIndex].getMark(), 
                    players[this.currentPlayerIndex].randomNumber(gameRowSize),
                    players[this.currentPlayerIndex].randomNumber(gameColSize))){               
            } board.print();
        }while(!gameOver());
        
        // display each message whether the game is tied or not
        if(board.isWinner()) {  
            System.out.println("\n" + players[this.currentPlayerIndex].getName() + " won!");
        } else {
            System.out.println("\nGame tied!");
        }
        
        System.out.println("Game Over");
    }
    
    // TODO
    private boolean gameOver() {
        
         if(board.isFull()){      // if the board is full return true while isWinner() is false
             return true;
        }
         
         if(board.isWinner()){   // if there is a winner, return true even though board is not fully filled.
             return true;
         }
         
        return false;           // start loop keep looping ustil this method return false.
    }
    
    // TODO    
    // switch player method
    private void switchPlayer() {   
        if(currentPlayerIndex == 1) {   // if player is 1, current player becomes 0, and opposite for player 0.
            currentPlayerIndex = 0;            
        } else{
            currentPlayerIndex = 1;
        }
           
    }
}
