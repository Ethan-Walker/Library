package cn.library.pojo;

/**
 * Created by EthanWalker on 2017/10/13.
 */
public class SearchBook {
    private long id;
    private String title;
    private Integer publish_year;
    private String author;
    private String book_position;
    private String category_name;
    private String press;
    private Integer book_version;

    private Integer status;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getPublish_year() {
        return publish_year;
    }

    public void setPublish_year(Integer publish_year) {
        this.publish_year = publish_year;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBook_position() {
        return book_position;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public void setBook_position(String book_position) {
        this.book_position = book_position;
    }


    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public Integer getBook_version() {
        return book_version;
    }

    public void setBook_version(Integer book_version) {
        this.book_version = book_version;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
