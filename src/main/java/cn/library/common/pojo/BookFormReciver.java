package cn.library.common.pojo;

/**
 * Created by EthanWalker on 2017/10/11.
 */
public class BookFormReciver {
    private Integer bookCatId;
    private String bookName;
    private Integer pageIndex;
    private Integer pageSize;

    public Integer getBookCatId() {
        return bookCatId;
    }

    public void setBookCatId(Integer bookCatId) {
        this.bookCatId = bookCatId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
