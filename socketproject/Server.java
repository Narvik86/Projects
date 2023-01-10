/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */



/**
 *
 * @author Narvik
 */
import java.net.*;
import java.io.*;
import java.util.*;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.time.LocalDateTime;
import java.time.*;
import java.time.format.DateTimeFormatter;

public class Server {
// A Java program for a Server

 
    // constructor with port
    
    private static ArrayList<ClientHandler> clients = new ArrayList<>();  // arraylist for clients
    private static ExecutorService pool = Executors.newFixedThreadPool(5);// set executors (num of threads) 
    final static Logger clientLog = Logger.getLogger(Server.class.getName());
    private static long connectionTime;
    static DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
    public static void main (String[] args) throws IOException {
    // starts server and waits for a connection
        ServerSocket listener = new ServerSocket(5000);     // it listens clients at port# 5000
        System.out.println("Waiting for client...");
        int n = 1;   // indicates client index
  
        while(true) {                                       
            Socket client = listener.accept();              // listener waits clients
            LocalDateTime connectTime = LocalDateTime.now();
            long connectionStart = System.currentTimeMillis();
            String connectTimeFormat = connectTime.format(timeFormat);
            System.out.println("[" + connectTimeFormat  + "] New Client connected.");
            connectionTime = connectionStart;
            clientLog.log(Level.FINE,"Client has etablished connection", connectTime);
            ClientHandler clientThread = new ClientHandler(client, n);  // create a thread instance with arguments
            clients.add(clientThread);                      // add thread to clients arraylist
            pool.execute(clientThread);                     // execute thread
            n++;                                            // client counter
        }
    }
        
    ///////////////////  Thread   ///////////////////
    private static class ClientHandler implements Runnable {
        private Socket client;
        private BufferedReader in;      // read msgs from client  
        private PrintWriter out;        // send msgs to client
        int clientNum;                  // client number
        String clientAssign;
        String clientName;		//variable to store user name
        String clientDisconnect;
        ClientHandler (Socket clientSocket, int num) throws IOException {
            this.client = clientSocket;
            this.clientNum = num;
            in = new BufferedReader(new InputStreamReader(client.getInputStream()));
            out = new PrintWriter(client.getOutputStream());
            out.println("Please enter a username: "); //this will prompt client for their identifier
            out.flush();
            clientName = in.readLine();
            LocalDateTime nameTime = LocalDateTime.now();
            String nameTimeFormat = nameTime.format(timeFormat);
            System.out.println("[" + nameTimeFormat + "] Client has assigned themself as " + clientName);
            out.println("(ACK) Connection Established with : " + clientName); //client now knows connection was successful
            out.flush(); //send the ACK to the client and clear the printwriter
        }

        @Override
        public void run () {
            String logString;
            try {
                while(true) {
			//this will loop until server is closed
                    String req = in.readLine();
                    LocalDateTime requestTime = LocalDateTime.now();// read string from client
                    String requestTimeFormat = requestTime.format(timeFormat);
                    System.out.println("[" + requestTimeFormat + "] Client " + clientName + " entered equation : " + req);        // display string received from client

                    //the following code will process the equations
                       ////////////// Simple Math ///////////////
                    String operators[]=req.split("[0-9]+");
                    String operands[]=req.split("[+-/*]");
                    int aggregate = Integer.parseInt(operands[0]);
                    for(int i=1;i<operands.length;i++){
                        if(operators[i].equals("+"))
                            aggregate += Integer.parseInt(operands[i]);
                        else if(operators[i].equals("-"))
                            aggregate -= Integer.parseInt(operands[i]);
                        else if(operators[i].equals("*"))
                            aggregate *= Integer.parseInt(operands[i]);
                        else
                            aggregate /=  Integer.parseInt(operands[i]);
                    }
                    ////////////////////////////////////
			//the loop applies the operator with the correct number		
                  
                    LocalDateTime resultTime = LocalDateTime.now(); //get the time stamp
                    String resultTimeFormat = resultTime.format(timeFormat); //format the time
                    System.out.println("[" + resultTimeFormat + "] Send back the result to " + clientName + " = " + aggregate);  // display result at command prompt
                    out.println(aggregate);         // send out result to client
                    out.flush();                    // flush
                    //logString = String.format("%s result to request: %d",clientName, aggregate);
                    //clientLog.log(Level.FINER, logString, resultTime);
                } 
            } catch (IOException e) {
                LocalDateTime disconnectTime = LocalDateTime.now(); //generate time stamp for log
                String disconnectTimeFormat = disconnectTime.format(timeFormat);
                System.err.println("[" + disconnectTimeFormat + "] Connection with Client " + clientName + " closed."); // when the connection is lost or closed
                long connectionEnd = System.currentTimeMillis(); //get current time to milliseconds
                long elapsedTime = connectionEnd - connectionTime; //calculate how long connection lasted
                System.out.println(clientName + " was connected for a total time of " + elapsedTime/1000 + " seconds" ); //time is converted to seconds here
            } finally {
                try {
                    in.close();
                    
                } catch (IOException ex) {

                }
                out.close();            
            }

        }

    }
   
}
    


