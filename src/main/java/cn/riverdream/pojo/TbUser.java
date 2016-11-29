package cn.riverdream.pojo;

public class TbUser {
    private Integer serialno;

    private String userid;

    private String username;

    private String password;

    private String permission1;

    private String permission2;

    public Integer getSerialno() {
        return serialno;
    }

    public void setSerialno(Integer serialno) {
        this.serialno = serialno;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPermission1() {
        return permission1;
    }

    public void setPermission1(String permission1) {
        this.permission1 = permission1 == null ? null : permission1.trim();
    }

    public String getPermission2() {
        return permission2;
    }

    public void setPermission2(String permission2) {
        this.permission2 = permission2 == null ? null : permission2.trim();
    }
}