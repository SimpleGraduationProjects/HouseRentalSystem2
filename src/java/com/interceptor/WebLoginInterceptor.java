package com.interceptor;

import net.sf.json.JSONObject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 *  登录拦截器,未登录的跳转到登录页
 * @author superman
 *
 */
public class WebLoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
								HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
						   Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							 Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();
		Object customer = request.getSession().getAttribute("customer_session");
		if(customer == null){
			//config.springmvc中配置需要登录才可以访问的页面地址


			//表示未登录或者登录失效
			System.out.println("链接"+requestURI+"进入拦截器！");
			String header = request.getHeader("X-Requested-With");
			//判断是否是ajax请求
			if("XMLHttpRequest".equals(header)){
				//表示是ajax请求
				Map<String, String> ret = new HashMap<String, String>();
				ret.put("type", "error");
				ret.put("msg", "登录会话超时或还未登录，请重新登录!");
				response.getWriter().write(JSONObject.fromObject(ret).toString());
				return false;
			}
			//表示是普通链接跳转，直接重定向到登录页面
			response.sendRedirect(request.getServletContext().getContextPath() + "/webIndex.do");
			return false;
		}

		return true;
	}

}
