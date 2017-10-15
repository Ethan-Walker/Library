package cn.library.service.impl;

import cn.library.common.pojo.LibResult;
import cn.library.mapper.ReaderMapper;
import cn.library.pojo.Reader;
import cn.library.pojo.ReaderExample;
import cn.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/10.
 */
@Service
public class ReaderServiceImpl  implements ReaderService{
    @Autowired
    private ReaderMapper readerMapper;

    @Override
    public LibResult updatePersonInfo(Reader reader) {
        ReaderExample example = new ReaderExample();
        ReaderExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(reader.getUsername());

        int i = readerMapper.updateByExampleSelective(reader, example);
        if(i==1){
            return LibResult.ok();
        }else{
            return LibResult.build(-1,"更新失败");
        }
    }

    @Override
    public Reader queryReaderByUsername(String username) {
        ReaderExample example = new ReaderExample();
        ReaderExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<Reader> readers = readerMapper.selectByExample(example);
        if(readers!=null&&readers.size()==1){
            return readers.get(0);
        }
        return null;
    }

    @Override
    public LibResult login(Reader reader) {
        ReaderExample example= new ReaderExample();
        ReaderExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(reader.getUsername());
        criteria.andPasswordEqualTo(reader.getPassword());
        List<Reader> readers = readerMapper.selectByExample(example);
        if(readers!=null&&readers.size()==1){
            return LibResult.ok();
        }
        return LibResult.build(-1,"用户名或者密码错误");
    }

    @Override
    public LibResult register(Reader reader) {
        ReaderExample example = new ReaderExample();
        ReaderExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(reader.getUsername());
        List<Reader> readers = readerMapper.selectByExample(example);
        if(readers!=null&&readers.size()>=1){
            return LibResult.build(-1,"用户名已存在");
        }
        if(addReader(reader)){
            return LibResult.ok();
        }
        return LibResult.build(-1,"注册失败!");
    }

    @Override
    public boolean addReader(Reader reader) {
        int insert = readerMapper.insert(reader);
        if(insert>0){
          return true;
        }
        return false;
    }
}
