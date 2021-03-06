package com.youguu.shiro.token;

import com.youguu.sys.pojo.SysUser;
import org.apache.shiro.SecurityUtils;

/**
 * Created by leo on 2017/11/27.
 */
public class TokenManager {

	public static SysUser getToken() {
		SysUser token = (SysUser) SecurityUtils.getSubject().getPrincipal();
		return token;
	}

	public static String getUserName(){
		return getToken()==null?null:getToken().getUserName();
	}

	public static String getRealName(){
		return getToken()==null?null:getToken().getRealName();
	}

	public static Integer getUserId(){
		return getToken()==null?null:getToken().getId();
	}


	public static SysUser login(SysUser user,Boolean rememberMe){
		ShiroToken token = new ShiroToken(user.getUserName(), user.getPswd());
		token.setRememberMe(rememberMe);
		SecurityUtils.getSubject().login(token);
		return getToken();
	}

	public static void logout() {
		SecurityUtils.getSubject().logout();
	}
}
