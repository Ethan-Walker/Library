package cn.library.service;

import cn.library.common.pojo.LibResult;

/**
 * Created by EthanWalker on 2017/10/14.
 */
public interface SubscribeService {
    LibResult subscribe(String username,Long bookId);
}
