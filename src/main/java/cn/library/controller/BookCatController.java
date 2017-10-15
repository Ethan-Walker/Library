package cn.library.controller;

import cn.library.mapper.BookCategoryMapper;
import cn.library.pojo.BookCategory;
import cn.library.service.BookCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/12.
 */
@Controller
public class BookCatController {
    @Autowired
    private BookCatService bookCatService;

    @RequestMapping(method= RequestMethod.POST,value="/manager/book-manager/bookCatList")
    @ResponseBody
    public List<BookCategory> queryBookCatList(){
        return bookCatService.queryAllBookCategoryList();
    }
}
