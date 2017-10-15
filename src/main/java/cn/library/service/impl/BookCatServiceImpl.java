package cn.library.service.impl;

import cn.library.mapper.BookCategoryMapper;
import cn.library.pojo.BookCategory;
import cn.library.pojo.BookCategoryExample;
import cn.library.service.BookCatService;
import cn.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Service
public class BookCatServiceImpl implements BookCatService {
    @Autowired
    private BookCategoryMapper bookCategoryMapper;

    @Override
    public List<BookCategory> queryAllBookCategoryList() {
        BookCategoryExample example = new BookCategoryExample();
        return  bookCategoryMapper.selectByExample(example);
    }
}
