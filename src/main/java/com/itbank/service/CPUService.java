package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.CPUDAO;

@Service
public class CPUService {
	@Autowired CPUDAO cpuDAO;

	public ModelAndView selectAll() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("list", cpuDAO.selectAll());
		mv.addObject("count", cpuDAO.countAll());
		return mv;
	}

	public ModelAndView selectAll(String url) {
		ModelAndView mv = new ModelAndView(url);
		mv.addObject("list", cpuDAO.selectAll());
		return mv;
	}
}
