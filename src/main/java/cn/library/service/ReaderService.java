package cn.library.service;

import cn.library.common.pojo.LibResult;
import cn.library.pojo.Reader;

/**
 * Created by EthanWalker on 2017/10/10.
 */
public interface ReaderService {
    LibResult login(Reader reader);

    LibResult register(Reader reader);

    boolean addReader(Reader reader);

    Reader queryReaderByUsername(String username);

    LibResult updatePersonInfo(Reader reader);
}
