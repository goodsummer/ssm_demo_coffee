package com.coffee.business.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffee.business.bean.FamousPainting;
import com.coffee.business.service.FamousPaintingService;

@Controller
@RequestMapping("/famousPainting")
public class FamousPaintingController {
	
	@Resource
	private FamousPaintingService famousPaintingService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String go2FamousPainting(HttpServletRequest request,Model model) {
		List<FamousPainting> list = famousPaintingService.getFamousPaintingList(0, 12, "updatetime", true);	
		
		model.addAttribute("list", list);
		
		return "/jsp/famousPainting";
	}
	
	@RequestMapping("/getFamousPaintingList")
	@ResponseBody
	public List<FamousPainting> getFamousPaintingList(HttpServletRequest request,Model model, @RequestParam("startIndex") int startIndex,
			@RequestParam("size") int size, @RequestParam(value="sortProperty", required = false) String sortProperty,  @RequestParam(value="isDesc", required = false) boolean isDesc) {
		
			List<FamousPainting> list = famousPaintingService.getFamousPaintingList(startIndex, size, sortProperty, isDesc);
			
			return list;		
	}
}
