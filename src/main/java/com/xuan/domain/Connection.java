package com.xuan.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Connection {

    private int id;
    private int uid1;
    private int uid2;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date create_time;
    private int isConfirm;

    //日记、照片、纪念日数量
    private int dairy_num;
    private int photo_num;
    private int event_num;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid1() {
        return uid1;
    }

    public void setUid1(int uid1) {
        this.uid1 = uid1;
    }

    public int getUid2() {
        return uid2;
    }

    public void setUid2(int uid2) {
        this.uid2 = uid2;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public int getIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(int isConfirm) {
        this.isConfirm = isConfirm;
    }

    public int getDairy_num() {
        return dairy_num;
    }

    public void setDairy_num(int dairy_num) {
        this.dairy_num = dairy_num;
    }

    public int getPhoto_num() {
        return photo_num;
    }

    public void setPhoto_num(int photo_num) {
        this.photo_num = photo_num;
    }

    public int getEvent_num() {
        return event_num;
    }

    public void setEvent_num(int event_num) {
        this.event_num = event_num;
    }

    @Override
    public String toString() {
        return "Connection{" +
                "id=" + id +
                ", uid1=" + uid1 +
                ", uid2=" + uid2 +
                ", create_time=" + create_time +
                ", isConfirm=" + isConfirm +
                '}';
    }
}
