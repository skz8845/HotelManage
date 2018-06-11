package cn.hncj.hotel.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;

import com.opensymphony.xwork2.ActionContext;

import cn.hncj.hotel.entity.User;

public class UserLoginAction extends ResultAction{
	@SuppressWarnings("unchecked")
	@Action("user_login")
	public String login_user() {
		if (user == null) {
			user = new User();
		}
		users = (List<User>) userService.getByName(user.getUsername());
		System.out.println(users);
		if (users == null) {
			ActionContext.getContext().getSession().put("msg", "µÇÂ¼Ê§°Ü");
			return "showUserLoginError";
		}
		for (User use : users) {
			if (use.getUsername().equals(user.getUsername()) && use.getPassword().equals(user.getPassword())) {
				ActionContext.getContext().getSession().put("msg", "");
				user = use;
				ActionContext.getContext().getSession().put("user", user);
				System.out.println(use);
				return "listUserIndex";
			}
		}
		ActionContext.getContext().getSession().put("msg", "µÇÂ¼Ê§°Ü");
		return "showUserLoginError";
	}
}
