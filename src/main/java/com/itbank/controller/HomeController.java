package com.itbank.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.CPUService;

@Controller
public class HomeController {
	@Autowired CPUService cpuService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		return cpuService.selectAll();
	}
	
	
	@RequestMapping(value = "/iframeData/", method = RequestMethod.GET)
	public ModelAndView iframeData() {
		return cpuService.selectAll("iframeData");
	}
	
	
}
