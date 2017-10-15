package cn.library.service.impl;

import cn.library.common.pojo.BookFormReciver;
import cn.library.common.pojo.BookFormResult;
import cn.library.common.pojo.LibResult;
import cn.library.mapper.BookMapper;
import cn.library.pojo.Book;
import cn.library.pojo.BookExample;
import cn.library.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Service
public class BookServiceImpl implements BookService {
    @Override
    public LibResult addBook(Book book) {
        int insert = bookMapper.insert(book);
        if (insert == 1) {
            return LibResult.ok();
        } else {
            return LibResult.build(-1, "添加失败!");
        }


    }

    @Override
    public LibResult editBook(Book book) {
        int i = bookMapper.updateByPrimaryKeySelective(book);
        if(i==1){
            return LibResult.ok();
        }else{
            return LibResult.build(-1,"修改失败!");
        }
    }

    @Autowired
    private BookMapper bookMapper;

    @Override
    public LibResult deleteBookByIds(String[] split) {
        for (String id : split) {
            int i = bookMapper.deleteByPrimaryKey(Long.parseLong(id));
            if (i != 1) {
                return LibResult.build(-1, "删除失败!");

            }
        }
        return LibResult.ok();
    }

    @Override
    public BookFormResult queryBookList(BookFormReciver bookForm) {
        Integer bookCatId = bookForm.getBookCatId();
        String bookName = bookForm.getBookName();
        Integer pageIndex = bookForm.getPageIndex();
        Integer pageSize = bookForm.getPageSize();

        //分页
        PageHelper.startPage(pageIndex, pageSize);
        BookExample example = new BookExample();
        BookExample.Criteria criteria = example.createCriteria();
        if (bookCatId != null) {
            criteria.andCidEqualTo(bookCatId);
        }
        if (bookName != null && !"".equals(bookName)) {
            criteria.andTitleLike(bookName);
        }
        List<Book> books = bookMapper.selectByExample(example);
        BookFormResult bookFormResult = new BookFormResult();
        bookFormResult.setBookList(books);

        PageInfo<Book> pageInfo = new PageInfo<>(books);
        long total = pageInfo.getTotal();
        bookFormResult.setTotalCount(total);
        return bookFormResult;
    }
}
