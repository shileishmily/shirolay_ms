package com.youguu.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.youguu.common.BaseResponse;
import com.youguu.common.GridBaseResponse;
import com.youguu.core.util.PageHolder;
import com.youguu.sys.interceptor.Repeat;
import com.youguu.sys.log.annotation.MethodLog;
import com.youguu.sys.pojo.SysRole;
import com.youguu.sys.pojo.SysRolePermission;
import com.youguu.sys.response.RoleComboResponse;
import com.youguu.sys.response.RoleResponse;
import com.youguu.sys.service.SysRolePermissionService;
import com.youguu.sys.service.SysRoleService;
import com.youguu.sys.utils.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by leo on 2017/11/29.
 */
@Controller
@RequestMapping("role")
public class RoleController {

	@Resource
	private SysRoleService sysRoleService;
	@Resource
	private SysRolePermissionService sysRolePermissionService;


	@RequestMapping(value = "/addRole", method = RequestMethod.POST)
	@ResponseBody
	@MethodLog(module = Constants.SYS_PERMISSION, desc = "添加角色")
	@Repeat
	public BaseResponse addRole(String name, String code, String remark, @RequestParam(value = "ids[]") Integer[] ids) {
		BaseResponse rs = new BaseResponse();
		SysRole sysRole = new SysRole();
		sysRole.setName(name);
		sysRole.setCode(code);
		sysRole.setRemark(remark);
		sysRole.setCreateTime(new Date());

		int result = sysRoleService.saveSysRole(sysRole);

		if(ids.length>0){
			List<SysRolePermission> permissionList = new ArrayList<>();
			for(Integer permissionId : ids){
				SysRolePermission srp = new SysRolePermission();
				srp.setRid(result);
				srp.setPid(permissionId);
				srp.setCreateTime(new Date());
				permissionList.add(srp);
			}
			sysRolePermissionService.batchSaveSysRolePermission(permissionList);
		}

		if(result>0){
			rs.setStatus(true);
			rs.setMsg("添加成功");
		} else {
			rs.setStatus(false);
			rs.setMsg("添加失败");
		}

		return rs;
	}

	@RequestMapping(value = "/updateRole", method = RequestMethod.POST)
	@ResponseBody
	@MethodLog(module = Constants.SYS_PERMISSION, desc = "修改角色")
	@Repeat
	public BaseResponse updateRole(int id, String name, String code, String remark, @RequestParam(value = "ids[]") Integer[] ids) {
		BaseResponse rs = new BaseResponse();

		SysRole sysRole = sysRoleService.getSysRole(id);
		if(null == sysRole){
			rs.setStatus(false);
			rs.setMsg("角色不存在");
			return rs;
		}

		sysRole.setName(name);
		sysRole.setCode(code);
		sysRole.setRemark(remark);

		if(ids.length>0){
			List<SysRolePermission> permissionList = new ArrayList<>();
			for(Integer permissionId : ids){
				SysRolePermission srp = new SysRolePermission();
				srp.setRid(id);
				srp.setPid(permissionId);
				srp.setCreateTime(new Date());
				permissionList.add(srp);
			}
			sysRolePermissionService.batchSaveSysRolePermission(permissionList);
		}

		int result = sysRoleService.updateSysRole(sysRole);

		if(result>0){
			rs.setStatus(true);
			rs.setMsg("修改成功");
		} else {
			rs.setStatus(false);
			rs.setMsg("修改失败");
		}

		return rs;
	}

	@RequestMapping(value = "/deleteRole")
	@ResponseBody
	@MethodLog(module = Constants.SYS_PERMISSION, desc = "删除角色")
	@Repeat
	public BaseResponse deleteRole(int id) {
		BaseResponse rs = new BaseResponse();
		int result = sysRoleService.deleteSysRole(id);
		if(result>0){
			rs.setStatus(true);
			rs.setMsg("删除成功");
		} else {
			rs.setStatus(false);
			rs.setMsg("删除失败");
		}

		return rs;
	}

	@RequestMapping(value = "/rolelist")
	@ResponseBody
	public GridBaseResponse roleList() {

		GridBaseResponse rs = new GridBaseResponse();

		PageHolder<SysRole> pageHolder = sysRoleService.querySysRoleByPage(null, 1, 50);

		List<SysRole> roleList = pageHolder.getList();


		for(SysRole sysRole : roleList){
			List<SysRolePermission> permissionList = sysRolePermissionService.listSysRolePermissionByRole(sysRole.getId());
			List<Integer> ids = new ArrayList<>();
			for(SysRolePermission srp : permissionList){
				ids.add(srp.getPid());
			}
			sysRole.setPermissions(ids);
		}

		rs.setCode(0);
		rs.setMsg("ok");
		rs.setCount(pageHolder.getTotalCount());
		rs.setData(roleList);
		return rs;
	}

	@RequestMapping(value = "/getRolesSelect")
	@ResponseBody
	public RoleComboResponse getRolesSelect() {

		RoleComboResponse rs = new RoleComboResponse();

		List<SysRole> roleList = sysRoleService.listALLSysRole();
		if(null == roleList){
			rs.setStatus(false);
			rs.setMsg("加载角色下拉框异常");
			return rs;
		}

		List<JSONObject> roleSelect = new ArrayList<>();
		for(SysRole sysRole : roleList){
			JSONObject option = new JSONObject();
			option.put("key", sysRole.getId());
			option.put("value", sysRole.getName());
			roleSelect.add(option);
		}

		rs.setStatus(true);
		rs.setMsg("ok");
		rs.setData(roleSelect);
		return rs;
	}
}
