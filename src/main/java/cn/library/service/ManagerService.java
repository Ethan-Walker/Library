package cn.library.service;

import cn.library.common.pojo.LibResult;

/**
 * Created by EthanWalker on 2017/10/11.
 */
public interface ManagerService {
    LibResult login(String username, String password);
}
