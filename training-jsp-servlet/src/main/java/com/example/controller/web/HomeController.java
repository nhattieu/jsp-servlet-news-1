package com.example.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.constant.Constant;
import com.example.model.UserModel;
import com.example.service.ICategoryService;
import com.example.service.IUserService;
import com.example.utils.FormUtil;
import com.example.utils.SessionUtil;

@WebServlet(urlPatterns = { "/trang-chu", "/dang-nhap", "/dang-xuat" })
public class HomeController extends HttpServlet {

	@Inject
	private ICategoryService categoryService;
	
	@Inject IUserService userService;

	private static final long serialVersionUID = 990588436918148002L;
	
	ResourceBundle bundle = ResourceBundle.getBundle("message");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null && action.equals("login")) {
			String alert = req.getParameter("alert");
			String message = req.getParameter("message");
			if(alert != null && message != null) {
				req.setAttribute(Constant.ALERT, alert);
				req.setAttribute(Constant.MESSAGE, bundle.getString(message));
			}
			RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
			rd.forward(req, resp);
		} else if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(req, "USERMODEL");
			resp.sendRedirect(req.getContextPath() + "/trang-chu");
		} else {
			req.setAttribute("categories", categoryService.findAll());
			RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null && action.equals("login")) {
			UserModel userModel = FormUtil.toModel(UserModel.class, req);
			userModel = userService.findByUserNameAndPasswordAndStatus(userModel.getUserName(), userModel.getPassword(), 1);
			if (userModel != null) {
				SessionUtil.getInstance().putValue(req, "USERMODEL", userModel);
				if (userModel.getRoleModel().getCode().equalsIgnoreCase("USER")) {
					resp.sendRedirect(req.getContextPath() + "/trang-chu");
				} else if (userModel.getRoleModel().getCode().equalsIgnoreCase("ADMIN")) {
					resp.sendRedirect(req.getContextPath() + "/admin-home");
				}
			} else {
				resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&alert=danger&message=username_password_invalid");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login");
		}
	}

}
