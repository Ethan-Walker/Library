package cn.library.controller;

import cn.library.common.pojo.SearchResult;
import cn.library.pojo.BookCategory;
import cn.library.service.BookCatService;
import cn.library.service.SearchBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/13.
 */
@Controller
public class SearchBookController {
    @Autowired
    private SearchBookService searchBookService;
    @Value("${SEARCH_RESULT_ROWS}")
    private Integer SEARCH_RESULT_ROWS;

    @Autowired
    private BookCatService bookCatService;

    @RequestMapping("/search")
    public String searchItemList(String query,
                                 @RequestParam(defaultValue = "1") String pageIndex,String pageSize, Model model, String categoryName) throws Exception {
        if(query!=null){
            query = new String(query.getBytes("iso-8859-1"), "utf-8");
        }
        if(categoryName!=null){
            categoryName = new String(categoryName.getBytes("ISO-8859-1"),"UTF-8");
        }

        Integer pageIndex_;
        if(pageIndex==null||"".equals(pageIndex)){
            pageIndex_= 1;
        }else{
            pageIndex_ = Integer.parseInt(pageIndex);
        }
        Integer pageSize_;
        if(pageSize==null||"".equals(pageSize)){
           pageSize_=5;
        }else{
            pageSize_ =Integer.parseInt(pageSize);
        }
        //查询商品列表
        SearchResult searchResult = searchBookService.search(categoryName, query, pageIndex_,pageSize_);
        //把结果传递给页面
        List<BookCategory> bookCatList = bookCatService.queryAllBookCategoryList();

        model.addAttribute("query", query);  // 关键字
        model.addAttribute("totalPages", searchResult.getTotalPages());  //一共多少页
        model.addAttribute("pageIndex", pageIndex);  // 当前页
        model.addAttribute("totalCount", searchResult.getTotalCount());  // 总条数
        model.addAttribute("bookList", searchResult.getItemList());
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("bookCatList",bookCatList);
        model.addAttribute("pageIndex",pageIndex_);
        model.addAttribute("pageSize",pageSize_);
        //返回逻辑视图
        return "search-result";
    }

    @RequestMapping("/search-result")
    public String search() {
        return "search-result";
    }

}
