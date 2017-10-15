package cn.library.service.impl;

import cn.library.common.pojo.LibResult;
import cn.library.mapper.AdminMapper;
import cn.library.pojo.Admin;
import cn.library.pojo.AdminExample;
import cn.library.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public LibResult login(String username, String password) {
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        List<Admin> admins = adminMapper.selectByExample(example);
        if(admins!=null&&admins.size()>=1){
            return LibResult.ok();
        }else{
            return LibResult.build(-1,"用户名或者密码错误");
        }
    }
}
