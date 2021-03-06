package com.youguu.sys.service.impl;

import com.youguu.base.BaseTest;
import com.youguu.core.util.PageHolder;
import com.youguu.sys.pojo.SysUser;
import com.youguu.sys.service.SysServiceFactory;
import com.youguu.sys.service.SysUserService;
import org.junit.Test;

import java.util.Date;

public class SysUserServiceImplTest extends BaseTest {

	SysUserService sysUserService = SysServiceFactory.getSysUserService();


	@Test
	public void testSaveSysUser() throws Exception {
		SysUser user = new SysUser();
		user.setUserName("leo");
		user.setEmail("shilei@youguu.com");
		user.setPswd("123456");
		user.setCreateTime(new Date());
//		user.setStatus(SysUser._1);

		sysUserService.saveSysUser(user);
	}

	@Test
	public void testUpdateSysUser() throws Exception {

	}

	@Test
	public void testDeleteSysUser() throws Exception {

	}

	@Test
	public void testGetSysUser() throws Exception {

	}

	@Test
	public void testQuerySysUserByPage() throws Exception {
		PageHolder<SysUser> pageHolder = sysUserService.querySysUserByPage(0, null, 1, 50);
		System.out.println(pageHolder.size());
	}
}