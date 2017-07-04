package cn.com.demo.entity;

/**
 * Created by Keven on 2017/7/2.
 */
public class User {
    public String id;
    public String username;


    public String policenumber;
    public String phonenumber;
    public String deptname;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPolicenumber() {
        return policenumber;
    }

    public void setPolicenumber(String policenumber) {
        this.policenumber = policenumber;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

}
