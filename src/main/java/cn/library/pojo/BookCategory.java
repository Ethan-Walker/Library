package cn.library.pojo;

public class BookCategory {
    private Integer id;

    private String name;

    private Integer maxBorrowTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getMaxBorrowTime() {
        return maxBorrowTime;
    }

    public void setMaxBorrowTime(Integer maxBorrowTime) {
        this.maxBorrowTime = maxBorrowTime;
    }
}