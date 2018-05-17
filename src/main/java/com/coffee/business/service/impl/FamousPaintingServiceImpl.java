package com.coffee.business.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.coffee.business.bean.FamousPainting;
import com.coffee.business.dao.FamousPaintingMapper;
import com.coffee.business.service.FamousPaintingService;

@Service
public class FamousPaintingServiceImpl implements FamousPaintingService {

	@Resource
	private FamousPaintingMapper famousPaintingMapper;

	@Override
	public List<FamousPainting> getFamousPaintingList(int startIndex, int size, String sortProperty, boolean isDesc) {

		String sort = "asc";
		
		if(sortProperty == null) {
			sortProperty = "updatetime";
		}
		
		if(isDesc) {
			sort = "desc";
		}
		
		Map<String, Object> parmMap = new HashMap<String, Object>();
		parmMap.put("startIndex", startIndex);
		parmMap.put("size", size);
		parmMap.put("sortProperty", sortProperty);
		parmMap.put("sort", sort);

		
		List<FamousPainting> list = famousPaintingMapper.getFamousPntingList(parmMap);
		return list;
	}
}
