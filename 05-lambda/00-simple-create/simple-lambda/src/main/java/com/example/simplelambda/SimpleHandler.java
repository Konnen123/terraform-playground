package com.example.simplelambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

public class SimpleHandler implements RequestHandler<Map<String, String>, String>
{
    @Override
    public String handleRequest(Map<String, String> stringStringMap, Context context)
    {
        Date date = new Date();

        Timestamp timestamp = new Timestamp(date.getTime());
        String myenv = System.getenv("MY_ENV");

        return "This is a simple lambda function for java environment: " + myenv + " " + timestamp;
    }
}
