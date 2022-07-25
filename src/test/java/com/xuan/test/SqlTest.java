package com.xuan.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.*;


public class SqlTest {


    @Test
    public void test1() {
        Date date = new Date();
        System.out.println(date);
    }

    @Test
    public void test2() {
        List<Integer> list = new ArrayList<>();
        list.add(0);
        list.add(1);

        Iterator<Integer> iterator = list.iterator();
        while (iterator.hasNext()) {
            Integer integer = iterator.next();
            if (integer == 0)
                iterator.remove();
        }
        System.out.println(list);

    }

    @Test
    public void test3() {
        Random random = new Random();
        int n = random.nextInt(5);
        System.out.println(n);
    }

}
