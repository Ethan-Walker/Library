package cn.library.service.impl;

import cn.library.common.pojo.LibResult;
import cn.library.mapper.ManagerMapper;
import cn.library.pojo.Manager;
import cn.library.pojo.ManagerExample;
import cn.library.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public LibResult login(String username, String password) {
        ManagerExample example = new ManagerExample();
        ManagerExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        List<Manager> managers = managerMapper.selectByExample(example);

        if(managers!=null&&managers.size()>=1) {
            return LibResult.ok();
        }else{
            return LibResult.build(-1,"用户名或者密码错误");
        }
    }
}
