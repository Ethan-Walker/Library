package cn.library.pojo;

public class Reader {
    private Integer id;

    private String username;

    private String password;

    private Long schoolNumber;

    private String email;

    private Long phone;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Long getSchoolNumber() {
        return schoolNumber;
    }

    public void setSchoolNumber(Long schoolNumber) {
        this.schoolNumber = schoolNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }
}