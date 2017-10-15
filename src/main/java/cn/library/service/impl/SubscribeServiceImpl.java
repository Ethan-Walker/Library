package cn.library.service.impl;

import cn.library.common.pojo.LibResult;
import cn.library.mapper.BookCategoryMapper;
import cn.library.mapper.BookMapper;
import cn.library.mapper.ReaderBookMapper;
import cn.library.mapper.ReaderMapper;
import cn.library.pojo.*;
import cn.library.service.SubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by EthanWalker on 2017/10/14.
 */
@Service
public class SubscribeServiceImpl implements SubscribeService{
    @Autowired
    private ReaderMapper readerMapper;

    @Autowired
    private ReaderBookMapper readerBookMapper;

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BookCategoryMapper bookCategoryMapper;

    @Override
    public LibResult subscribe(String username, Long bookId) {
        ReaderExample example = new ReaderExample();
        ReaderExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);

        List<Reader> readers = readerMapper.selectByExample(example);
        if(readers==null||readers.size()==0||readers.size()>1){
            return LibResult.build(-1,"预订失败");
        }
        Integer readerId = readers.get(0).getId();

        ReaderBook readerBook = new ReaderBook();
        readerBook.setBid(bookId);
        readerBook.setRid(readerId);
        readerBook.setBorrowDate(new Date());

        Book book = bookMapper.selectByPrimaryKey(bookId);
        Integer cid = book.getCid();
        BookCategory bookCategory = bookCategoryMapper.selectByPrimaryKey(cid);
        Integer days = bookCategory.getMaxBorrowTime();
        long returnDateTime= new Date().getTime() + days * 24 * 60 * 60;
        Date returnDate = new Date(returnDateTime);

        readerBook.setReturnDate(returnDate);
        readerBookMapper.insert(readerBook);

        byte a = 1;
        book.setStatus(a);
        bookMapper.updateByPrimaryKey(book);
        return LibResult.ok();

    }
}
