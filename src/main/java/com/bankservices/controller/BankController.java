package com.bankservices.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/bank")
@RestController
public class BankController {


    @GetMapping ("/name")
    public String printBankName(){
       return "Hello Application is working fine";
    }
}
