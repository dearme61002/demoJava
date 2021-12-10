package com.example.demo.service;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@Component
public class Check {
    @Value("${maxAmount}")
    public void setMaxAmount(Integer maxAmount) {
        Check.maxAmount = maxAmount;
    }

    @Getter
    public static Integer maxAmount;


    @Value("${maxCountNumberAccount}")
    public  void setMaxCountNumberAccount(Integer maxCountNumberAccount) {
        Check.maxCountNumberAccount = maxCountNumberAccount;
    }

    @Value("${maxCountNumberName}")
    public  void setMaxCountNumberName(Integer maxCountNumberName) {
        Check.maxCountNumberName = maxCountNumberName;
    }

    @Value("${maxCountNumberEmail}")
    public  void setMaxCountNumberEmail(Integer maxCountNumberEmail) {
        Check.maxCountNumberEmail = maxCountNumberEmail;
    }

    @Getter
    public static Integer maxCountNumberName;
    @Getter
    public static Integer maxCountNumberEmail;
    @Getter
    public static Integer maxCountNumberAccount;


    public static boolean isOnlyHaveMath(String checkValue) {
        final String regex = "^[0-9]+$";
        boolean matches = Pattern.matches(regex, checkValue);
        return matches;
    }

    public static boolean isNullOrIsEmpty(String checkValue) {
        if (checkValue.isEmpty() || checkValue == null) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isOverMaxMathAmountValue(Integer checkValue) {
        if (checkValue > maxAmount) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isZero(Integer checkValue) {
        if (checkValue.equals(0)) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isOvermaxCountNumberName(Integer checkValue){
        if(checkValue> maxCountNumberName){
            return true;
        }else{
            return false;
        }
    }

    public static boolean isOvermaxCountNumberEmail(Integer checkValue){
        if(checkValue> maxCountNumberEmail){
            return true;
        }else{
            return false;
        }
    }
    public static boolean isOvermaxCountNumberAccount(Integer checkValue){
        if(checkValue> maxCountNumberAccount){
            return true;
        }else{
            return false;
        }
    }

    public static boolean isGoodEmail(String checkValue){
        final String regex = "^((?!\\.)[\\w-_.]*[^.])(@\\w+)(\\.\\w+(\\.\\w+)?[^.\\W])$";

        boolean matches = Pattern.matches(regex, checkValue);

        return matches;

    }

}
