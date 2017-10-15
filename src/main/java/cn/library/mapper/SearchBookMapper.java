package cn.library.mapper;

import cn.library.pojo.SearchBook;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/13.
 */
public interface SearchBookMapper {
    List<SearchBook> getBookList();
}
