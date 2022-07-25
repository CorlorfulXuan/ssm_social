package com.xuan.util;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class EventTime {

    public static long getResultTime(Date date) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date now_date = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
        Date event_date = simpleDateFormat.parse(simpleDateFormat.format(date));
        long resultTime = (now_date.getTime()-event_date.getTime())/(24*60*60*1000);

        return resultTime;
    }
}
