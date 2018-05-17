package com.coffee.business.service;

import java.util.List;

import com.coffee.business.bean.FamousPainting;

public interface FamousPaintingService {
	
    /**
    * 分页获取数据
    * @param startIndex  limit(startIndex,size)
    * @param size  limit(startIndex,size)
    * @param sortProperty  排序字段
    * @param isDesc  是否降序
    * @return List<FamousPainting>
     */
	public List<FamousPainting> getFamousPaintingList(int startIndex, int size, String sortProperty, boolean isDesc);	
}
