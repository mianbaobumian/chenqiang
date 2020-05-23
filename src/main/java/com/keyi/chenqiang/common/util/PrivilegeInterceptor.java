package com.keyi.chenqiang.common.util;

import com.keyi.chenqiang.user.model.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


/**
 * 后台权限登录拦截
 * @author Administrator
 *
 */
public class PrivilegeInterceptor extends HandlerInterceptorAdapter  {
	//protected Logger logger = LoggerFactory.getLogger(PrivilegeInterceptor.class);
	 
	private Logger logger = LogManager.getLogger(getClass());
	  
	

	// 方法前 /buyer/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		  HandlerMethod method = (HandlerMethod) handler;
		
	 
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
			
		String requestURI = request.getServletPath();
		//logger.info( "--request.getContextPath(): " + request.getContextPath());
		//logger.info( "--requestURI: " +requestURI.replace( request.getContextPath(), ""));
	 
		String path = request.getContextPath(); 
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/index.jsp";

			// 必须登陆
			if (user == null) {
				
			  
				boolean isAjaxRequest = true;
				//判断是不是ajax请求
				String header = request.getHeader("X-Requested-With");// XMLHttpRequest
				if (header == null || !header.equalsIgnoreCase("XMLHttpRequest")) {
					isAjaxRequest= false;
				}
			 
				if (isAjaxRequest) {
			     
			     response.setContentType("application/json;charset=UTF-8");
			    // response.setHeader("Content-disposition", "inline;filename=f.txt");
					  PrintWriter out = response.getWriter();
			  
					  out.print("{sessionstatus:'timeout'}");
					  out.flush();
					  
					  
				//response.setContentType("text/html");
				//response.getWriter().write("<script>alert('登录已过期，请重新登录！');window.top.location.href='" + basePath +  "</script>");
			 	//response.sendRedirect(request.getContextPath() + "/logina/doLogin.do");
					  
				} else {
				    PrintWriter out = response.getWriter();
					out.print("<script>alert('登录已过期，请重新登录！');window.top.location.href='" + basePath + "';</script>");
					out.flush();
				}
				return false;
				
			} else {//已登陆
				
				
				if ("admin".equals(user.getUser_id())) {// 超级管理员
					return true;
					
				}

				return true;
			}
		   
	}


	// 方法后
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

	// 页面渲染后
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
