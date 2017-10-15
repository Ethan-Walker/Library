package cn.library.controller;

import cn.library.common.pojo.BookFormReciver;
import cn.library.common.pojo.BookFormResult;
import cn.library.common.pojo.LibResult;
import cn.library.pojo.Book;
import cn.library.pojo.BookCategory;
import cn.library.service.BookCatService;
import cn.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Controller
public class BookManagerController {

    @Autowired
    private BookService bookService;
    @Autowired
    private BookCatService bookCatService;

    @RequestMapping(method = RequestMethod.POST, value = "/manager/book-manager")
    public String bookManager() {
        return "fragment/book-manager";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/manager/book-manager/queryBookList")
    @ResponseBody
    public BookFormResult queryBookList(BookFormReciver bookForm) {
        BookFormResult bookFormResult = bookService.queryBookList(bookForm);
        return bookFormResult;
    }

    @RequestMapping(method=RequestMethod.POST,value="/manager/book-manager/deleteBookByIds")
    @ResponseBody
    public LibResult deleteByIds(String ids ){
        String[] split = ids.split(",");
        return bookService.deleteBookByIds(split);
    }

    @RequestMapping(method = RequestMethod.POST,value="/manager/book-manager/addBook")
    @ResponseBody
    public LibResult addBook(Book book){
        book.setCreateTime(new Date());
        return bookService.addBook(book);
    }

    @RequestMapping(method=RequestMethod.POST,value="manager/book-manager/editBook")
    @ResponseBody
    public LibResult editBook(Book book){
        return bookService.editBook(book);
    }
}
