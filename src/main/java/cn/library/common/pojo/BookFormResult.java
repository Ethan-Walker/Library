package cn.library.common.pojo;

import cn.library.pojo.Book;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
public class BookFormResult {
    private List<Book> bookList = new ArrayList<>();
    private long totalCount ;

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }
    public long getTotalCount() {
        return totalCount;
    }
}
