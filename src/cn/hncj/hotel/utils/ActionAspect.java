package cn.hncj.hotel.utils;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;

import cn.hncj.hotel.Exception.MyRuntimeException;
import cn.hncj.hotel.entity.Admin;
import cn.hncj.hotel.entity.User;

@Aspect
@Component
public class ActionAspect {
	@Before("execution(* cn.hncj.hotel.action.UserAction.*(..))")
	public void beforeUser() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user == null) {
			ActionContext.getContext().getSession().put("userAccess", "true");
			ActionContext.getContext().getSession().put("adminAccess", "false");
			ActionContext.getContext().getSession().put("msg", "请登录后操作！");
			throw new MyRuntimeException("你无权操作！");
		}
	}
	@Before("execution(* cn.hncj.hotel.action.AdminAction.*(..))")
	public void beforeAdmin() {
		Admin admin = (Admin) ActionContext.getContext().getSession().get("admin");
		if (admin == null) {
			ActionContext.getContext().getSession().put("userAccess", "false");
			ActionContext.getContext().getSession().put("adminAccess", "true");
			ActionContext.getContext().getSession().put("msg", "请登录后操作！");
			throw new MyRuntimeException("你无权操作！");
		}
	}
}
