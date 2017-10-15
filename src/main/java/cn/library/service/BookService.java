package cn.library.service;

import cn.library.common.pojo.BookFormReciver;
import cn.library.common.pojo.BookFormResult;
import cn.library.common.pojo.LibResult;
import cn.library.pojo.Book;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
public interface BookService {
    BookFormResult queryBookList(BookFormReciver bookForm);

    LibResult deleteBookByIds(String[] split);

    LibResult addBook(Book book);

    LibResult editBook(Book book);
}
