package cn.library.common.pojo;

/**
 * Created by EthanWalker on 2017/10/10.
 */
public class LibResult {

    private Integer status;
    private String msg;
    private Object data;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static LibResult build(Integer status, String msg, Object data) {
        return new LibResult(status, msg, data);
    }
    public static LibResult ok() {
        return new LibResult(null);
    }
    public static LibResult ok(Object data) {
        return new LibResult(data);
    }




    public LibResult() {

    }
    public LibResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }
    public static LibResult build(Integer status, String msg) {
        return new LibResult(status, msg, null);
    }
    public LibResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

}
