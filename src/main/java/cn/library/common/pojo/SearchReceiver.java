package cn.library.common.pojo;

/**
 * Created by EthanWalker on 2017/10/13.
 */
public class SearchReceiver {
    private Integer bookCatId;
    private String query;
    private Integer pageIndex;
    private Integer pageSize;

    public Integer getBookCatId() {
        return bookCatId;
    }

    public void setBookCatId(Integer bookCatId) {
        this.bookCatId = bookCatId;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
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
