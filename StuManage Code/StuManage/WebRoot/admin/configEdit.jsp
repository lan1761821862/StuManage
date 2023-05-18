<%@ page language ="java"  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.config!=null">编辑</s:if><s:else>添加</s:else>成绩参数信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 var num = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsConfig\\.config_desc").val()==''){
			alert('参数名称不能为空');
			return;
		} 
		if(!num.exec($("#paramsConfig\\.config_percent").val())){
			alert('参数比例必须为数字');
			return;
		}
		$("#paramsConfig\\.config_id").val(0);
		$("#info").attr('action','Admin_addConfig.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsConfig\\.config_desc").val()==''){
			alert('参数名称不能为空');
			return;
		}
		if(!num.exec($("#paramsConfig\\.config_percent").val())){
			alert('参数比例必须为数字');
			return;
		}
		$("#info").attr('action','Admin_saveConfig.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">成绩参数&gt;&gt;<s:if test="#attr.config!=null">编辑</s:if><s:else>添加</s:else>成绩参数</span>
</div>
<form id="info" name="info" action="Admin_addConfig.action" method="post">   
<s:hidden id="paramsConfig.config_id" name="paramsConfig.config_id" value="%{#attr.config.config_id}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.config!=null">编辑</s:if><s:else>添加</s:else>成绩参数</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 参数名称：</td>
          <td width="65%">
          	<s:textfield name="paramsConfig.config_desc" id="paramsConfig.config_desc" value="%{#attr.config.config_desc}" />
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px">参数比例：</td>
          <td width="65%">
          	<s:textfield name="paramsConfig.config_percent" id="paramsConfig.config_percent" value="%{#attr.config.config_percent2}" />%
          </td>
        </tr> 
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
          	<s:if test="#attr.config!=null">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</s:else>
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>