package cn.library.mapper;

import cn.library.pojo.ReaderBook;
import cn.library.pojo.ReaderBookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReaderBookMapper {
    int countByExample(ReaderBookExample example);

    int deleteByExample(ReaderBookExample example);

    int insert(ReaderBook record);

    int insertSelective(ReaderBook record);

    List<ReaderBook> selectByExample(ReaderBookExample example);

    int updateByExampleSelective(@Param("record") ReaderBook record, @Param("example") ReaderBookExample example);

    int updateByExample(@Param("record") ReaderBook record, @Param("example") ReaderBookExample example);
}