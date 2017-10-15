package cn.library.service;

import cn.library.common.pojo.LibResult;
import cn.library.common.pojo.SearchResult;

/**
 * Created by EthanWalker on 2017/10/13.
 */
public interface SearchBookService {
    public SearchResult search(String categoryName, String keyword, int page, int rows) throws Exception;

    //导入索引库
    public LibResult importAllItems();

}
