package com.coffee.business.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.coffee.business.bean.FamousPainting;
import com.coffee.business.bean.FamousPaintingCriteria;

public interface FamousPaintingMapper {
    int countByExample(FamousPaintingCriteria example);

    int deleteByExample(FamousPaintingCriteria example);

    int deleteByPrimaryKey(Integer id);

    int insert(FamousPainting record);

    int insertSelective(FamousPainting record);

    List<FamousPainting> selectByExampleWithBLOBs(FamousPaintingCriteria example);

    List<FamousPainting> selectByExample(FamousPaintingCriteria example);

    FamousPainting selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FamousPainting record, @Param("example") FamousPaintingCriteria example);

    int updateByExampleWithBLOBs(@Param("record") FamousPainting record, @Param("example") FamousPaintingCriteria example);

    int updateByExample(@Param("record") FamousPainting record, @Param("example") FamousPaintingCriteria example);

    int updateByPrimaryKeySelective(FamousPainting record);

    int updateByPrimaryKeyWithBLOBs(FamousPainting record);

    int updateByPrimaryKey(FamousPainting record);
    
    /**
    * 分页获取数据
    * @param parmMap  自定义参数的map
    * @return List<FamousPainting>
     */
    public List<FamousPainting> getFamousPntingList(Map<String, Object> parmMap);
}