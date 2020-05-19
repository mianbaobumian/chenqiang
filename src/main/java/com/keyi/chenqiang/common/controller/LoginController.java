package com.keyi.chenqiang.common.controller;

import com.keyi.chenqiang.common.util.CollectionsFactory;
import com.keyi.chenqiang.user.model.User;
import com.keyi.chenqiang.user.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Map;


/**
  * created on 2020年1月20日
  *
  * @author  chenqiang
  */
@Controller
@RequestMapping("/admin/Login")
public class LoginController
{
	@Resource
	private UserService userService;

	protected Logger logger = LogManager.getLogger(getClass());
	/**
	 * ajax登录
	 */
	@RequestMapping(value = "/ajaxLogin")
	@ResponseBody
	public Map<String,Object> ajaxLogin(@RequestParam String username,
													  @RequestParam String password) throws Exception{
		Map<String,Object> map = CollectionsFactory.newHashMap();
		try
		{
			User user=userService.queryUserByUserId(username);
			if(user==null||"0".equals(user.getValue_flag())){
				map.put("msg", "account_error");
			}else if(!password.equals(user.getUser_password())){
				map.put("msg", "password_error");
			}else {
				map.put("user_type",user.getUser_type());
			}
		}catch (Exception e){
			logger.error(e.getMessage(), e);
			map.put("code", "500");
			map.put("msg", "查询出错,请联系管理员!");
		}
	    //返回json数据
	    return map;
	}

	@RequestMapping("home")
	public String openHomeIndex(HttpSession session, Model model,@RequestParam Map<String, Object> paramMap) {
		String username=paramMap.get("username").toString();
		User user=userService.queryUserByUserId(username);
		String user_type=user.getUser_type();
		if("1".equals(user_type)){
			user.setRole_name("订货方");
		}else {
			user.setRole_name("管理人员");
		}
		model.addAttribute("user", user);
		session.setAttribute("user_type", user_type);
		return "common/home";
	}

	@RequestMapping(value = "/ajaxLoginOut")
	public String ajaxLoginOut(HttpServletRequest request) throws Exception{
		Enumeration em = request.getSession().getAttributeNames();
		while(em.hasMoreElements()){
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "index";
/*		Map<String,Object> map = CollectionsFactory.newHashMap();
		try
		{
			User user=userService.queryUserByUserId(username);
			if(user==null||"0".equals(user.getValue_flag())){
				map.put("msg", "account_error");
			}else if(!password.equals(user.getUser_password())){
				map.put("msg", "password_error");
			}else {
				map.put("user_type",user.getUser_type());
			}
		}catch (Exception e){
			logger.error(e.getMessage(), e);
			map.put("code", "500");
			map.put("msg", "查询出错,请联系管理员!");
		}
		//返回json数据
		return map;*/
	}
}
