package com.nowcoder.wenda.model;

public class ResponseData<T> {

    private String code;

    private String msg;

    private T data;

    public String getCode() {
        return code;
    }

    public ResponseData(T data) {
        this.code="200";
        this.msg="OK";
        this.data = data;
    }

    public ResponseData() {
        this.code="200";
        this.msg="OK";
    }

    public ResponseData(String code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
