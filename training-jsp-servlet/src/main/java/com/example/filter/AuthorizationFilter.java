package com.example.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.constant.Constant;
import com.example.model.UserModel;
import com.example.utils.SessionUtil;

public class AuthorizationFilter implements Filter {
	
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String url = request.getRequestURI();
		if(url.startsWith("/admin")) {
			UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
			if(userModel != null) {
				if(userModel.getRoleModel().getCode().equalsIgnoreCase(Constant.ADMIN)) {
					chain.doFilter(servletRequest, servletResponse);
				} else if(userModel.getRoleModel().getCode().equalsIgnoreCase(Constant.USER)) {
					response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=not_permission&alert=danger");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=not_login&alert=danger");
			}
			
		} else {
			chain.doFilter(servletRequest, servletResponse);
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
