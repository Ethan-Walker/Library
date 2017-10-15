package cn.library.common.pojo;

import cn.library.pojo.SearchBook;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/13.
 */
public class SearchResult {
    private long recordCount;
    private int totalPages;
    private List<SearchBook> itemList;
    private long totalCount ;

    public long getRecordCount() {
        return recordCount;
    }
    public void setRecordCount(long recordCount) {
        this.recordCount = recordCount;
    }
    public int getTotalPages() {
        return totalPages;
    }
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
    public List<SearchBook> getItemList() {
        return itemList;
    }
    public void setItemList(List<SearchBook> itemList) {
        this.itemList = itemList;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }
}
