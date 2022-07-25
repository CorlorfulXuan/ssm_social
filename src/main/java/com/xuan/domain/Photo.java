package com.xuan.domain;

public class Photo {
    private Integer id;
    private Integer l_id;
    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getL_id() {
        return l_id;
    }

    public void setL_id(Integer l_id) {
        this.l_id = l_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "id=" + id +
                ", l_id=" + l_id +
                ", address='" + address + '\'' +
                '}';
    }
}
