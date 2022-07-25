package com.xuan.util;

import java.util.Calendar;
import java.util.Date;

public class Age {
    public static int getAge(Date dateOfBirth) {
        Calendar cal = Calendar.getInstance();
        int now_year = cal.get(Calendar.YEAR);
        int now_month = cal.get(Calendar.MONTH)+1;
        int now_day = cal.get(Calendar.DAY_OF_MONTH);
        cal.setTime(dateOfBirth);
        int birth_year = cal.get(Calendar.YEAR);
        int birth_month = cal.get(Calendar.MONTH)+1;
        int birth_day = cal.get(Calendar.DAY_OF_MONTH);
        int age = now_year - birth_year;
        if (now_month <= birth_month) {
            if (now_month == birth_month) {
                if (now_day < birth_day) {
                    age--;
                }
            }
            age--;
        }
        return age;
    }
}
