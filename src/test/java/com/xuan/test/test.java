package com.xuan.test;


import com.xuan.util.EventTime;
import org.junit.Test;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class test {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    @Test
    public void test1() {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        System.out.println(list);

    }
}
