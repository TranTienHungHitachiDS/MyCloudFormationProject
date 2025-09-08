package com.hungtran;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class Handler implements RequestHandler<String, String>{

    @Override
    public String handleRequest(String input, Context arg1) {
        if(input == null) input = "";
        return "Hello world!. My name is Hung. Input is: "+input;
    }
    
}
