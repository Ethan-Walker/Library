package cn.library.service.impl;

import cn.library.common.pojo.LibResult;
import cn.library.dao.SearchDao;
import cn.library.mapper.SearchBookMapper;
import cn.library.pojo.SearchBook;
import cn.library.common.pojo.SearchResult;
import cn.library.service.SearchBookService;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/13.
 */
@Service
public class SearchBookServiceImpl implements SearchBookService{
    @Autowired
    private SearchBookMapper searchBookMapper;
    @Autowired
    private SolrServer solrServer;

    @Autowired
    private SearchDao searchDao;

    @Override
    public SearchResult search(String categoryName, String keyword, int page, int rows) throws Exception {
        //创建一个SolrQuery对象
        SolrQuery query = new SolrQuery();
        if(categoryName!=null&&!categoryName.equals("全部")){
            query.set("fq","category_name:"+categoryName);
        }
        //设置查询条件
        if(keyword==null||"".equals(keyword.trim())){
            query.set("q","*:*");
        }else{
            query.setQuery(keyword);
        }
        //设置分页条件
        if (page <=0 ) page = 1;
        query.setStart((page - 1) * rows);
        query.setRows(rows);
        //设置默认搜索域
        query.set("df", "title");
        //开启高亮显示
        query.setHighlight(true);
        query.addHighlightField("title");
        query.setHighlightSimplePre("<strong style=\"color:red\">");
        query.setHighlightSimplePost("</strong>");
        //调用dao执行查询
        SearchResult searchResult = searchDao.search(query);
        //计算总页数
        long recordCount = searchResult.getRecordCount();
        int totalPage = (int) (recordCount / rows);
        if (recordCount % rows > 0)
            totalPage ++;
        //添加到返回结果
        searchResult.setTotalPages(totalPage);
        //返回结果
        return searchResult;
    }

    @Override
    public LibResult importAllItems() {
        try {
            //查询商品列表
            List<SearchBook> itemList = searchBookMapper.getBookList();
            //遍历商品列表
            for (SearchBook searchBook : itemList) {
                //创建文档对象
                SolrInputDocument document = new SolrInputDocument();
                //向文档对象中添加域
                document.addField("id", searchBook.getId());
                document.addField("title", searchBook.getTitle());
                document.addField("publish_year", searchBook.getPublish_year());
                document.addField("press", searchBook.getPress());
                document.addField("book_version", searchBook.getBook_version());
                document.addField("author", searchBook.getAuthor());
                document.addField("book_position",searchBook.getBook_position());
                document.addField("category_name",searchBook.getCategory_name());
                //把文档对象写入索引库
                solrServer.add(document);
            }
            //提交
            solrServer.commit();
            //返回导入成功
            return LibResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return LibResult.build(500, "数据导入时发生异常");

        }
    }
}
