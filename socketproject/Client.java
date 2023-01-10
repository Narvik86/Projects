/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.net.*;
import java.io.*;
import java.util.*;
import java.io.PrintWriter;


/**
 *
 * @author Narvik
 */
public class Client {
    public static void main(String[] args) throws IOException {
        Socket socket = new Socket("127.0.0.1", 5000);   // create a socket with IP address and port# 5000
                
        BufferedReader input = new BufferedReader(new InputStreamReader(socket.getInputStream()));  // input reading from server
        BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));             // input from user
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);                          // to write out to server
        
        String serverResp = input.readLine();       // receive message from the server     
        System.out.println("Server : " + serverResp);

        String name = keyboard.readLine();
        out.println(name);
        out.flush();
        
        serverResp = input.readLine();              //receive message from server asking for user name
        System.out.println("Server : " + serverResp);
        

        while (true) {
            System.out.print("Enter a Equation: ");     
            String command = keyboard.readLine();       // read in user string

            if (command.equals("quit")) break;          // quit command for user
            out.println(command);                       // send out command to server
            out.flush();                                // flush

            serverResp = input.readLine();       // receive message from the server     
            System.out.println("Server response: " + serverResp);
        }
    }
}
