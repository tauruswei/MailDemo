package com.example.demo.result;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize
public class Result1{
    public String txid;
    public String payload;
    public String encode;
}
