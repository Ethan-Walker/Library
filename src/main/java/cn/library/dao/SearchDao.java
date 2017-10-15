package cn.library.dao;

import cn.library.pojo.SearchBook;
import cn.library.common.pojo.SearchResult;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by EthanWalker on 2017/10/13.
 */
@Repository
public class SearchDao {

    @Autowired
    private SolrServer solrServer;

    public SearchResult search(SolrQuery query) throws Exception {
        //根据query查询索引库
        QueryResponse queryResponse = solrServer.query(query);
        //取查询结果。
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        //取查询结果总记录数
        long numFound = solrDocumentList.getNumFound();
        SearchResult result = new SearchResult();
        result.setRecordCount(numFound);
        result.setTotalCount(numFound);

        //取商品列表，需要取高亮显示
        Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
        List<SearchBook> itemList = new ArrayList<>();
        for (SolrDocument solrDocument : solrDocumentList) {
            SearchBook item = new SearchBook();
            if(solrDocument.get("id")!=null){
                item.setId( Long.parseLong (solrDocument.get("id").toString()));
            }
            if(solrDocument.get("category_name")!=null){
                item.setCategory_name((String) solrDocument.get("category_name"));
            }
            if(solrDocument.get("author")!=null){
                item.setAuthor((String) solrDocument.get("author"));
            }
            if(solrDocument.get("book_position")!=null){
                item.setBook_position((String)solrDocument.get("book_position"));
            }
            if(solrDocument.get("book_version")!=null){
                item.setBook_version(Integer.parseInt(solrDocument.get("book_version").toString()));
            }
            if(solrDocument.get("press")!=null){
                item.setPress((String)solrDocument.get("press"));
            }
            if(solrDocument.get("publish_year")!=null){
                item.setPublish_year(Integer.parseInt(solrDocument.get("publish_year").toString()));
            }
            if(solrDocument.get("status")!=null){
                item.setStatus(Integer.parseInt(solrDocument.get("status").toString()));
            }
            //取高亮显示
            List<String> list = highlighting.get(solrDocument.get("id")).get("title");
            String title = "";
            if (list != null && list.size() > 0) {
                title = list.get(0);
            } else {
                title = (String) solrDocument.get("title");
            }
            item.setTitle(title);
            //添加到商品列表
            itemList.add(item);
        }
        result.setItemList(itemList);
        //返回结果
        return result;
    }
}
