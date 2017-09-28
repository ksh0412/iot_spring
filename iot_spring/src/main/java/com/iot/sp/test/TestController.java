package com.iot.sp.test;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.sp.user.service.UserService;
import com.iot.sp.user.service.UserServiceImpl;

@Controller
@RequestMapping("test")
public class TestController {
	private static UserService us = new UserServiceImpl();
	@RequestMapping("/t")
	public String list2(Model m) {
		m.addAttribute("title","컨트롤에서 제어하는타이틀");
		return "test";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model map) {
		return "test/list";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model map) {
		return "test/delete";
	}

	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model map) {
		return "test/modify"; 
	}

	@RequestMapping(value="/test1", method= RequestMethod.POST)
	public @ResponseBody ModelMap postTest(ModelMap map, @RequestBody Map hm) {
		map.put("test", "test");
		return map;
	}
	
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public @ResponseBody ModelMap getTest(ModelMap map, @RequestParam(value="exam") String exam) {
		System.out.print(exam);
		map.put("test", exam);
		return map;
	}
	

	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model map) {
		return "test/write";
	}
}