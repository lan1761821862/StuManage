<%@ page language ="java"  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.user!=null && #attr.user.user_id!=0">编辑</s:if><s:else>添加</s:else>学生信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 var user_sex = "<s:property value='#attr.user.user_sex' />";
	 if(user_sex!='' && user_sex!=0){
		 $("#sex"+user_sex).attr('checked','checked');
	 }else{
		 $("#sex1").attr('checked','checked');
	 }  
	 
	 var num = /^\d+$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsUser\\.user_name").val()==''){
			alert('学号不能为空');
			return;
		}
		if($("#paramsUser\\.user_pass").val()==''){
			alert('密码不能为空');
			return;
		}
		if($("#paramsUser\\.real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if($("#paramsUser\\.user_age").val()!=''){
			if(!num.exec($("#paramsUser\\.user_age").val())){
				alert('年龄必须为数字');
				return;
			}
		}else{
			$("#paramsUser\\.user_age").val(0);
		}
		if($("#paramsUser\\.clazz_id").val()=='0'){
			alert('班级不能为空');
			return;
		}
		if($("#paramsUser\\.user_question").val()==''){
			alert('密保问题不能为空');
			return;
		}
		if($("#paramsUser\\.user_answer").val()==''){
			alert('密保答案不能为空');
			return;
		}
		$("#paramsUser\\.user_id").val(0);
		$("#info").attr('action','Admin_addUser.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		 	if($("#paramsUser\\.real_name").val()==''){
				alert('姓名不能为空');
				return;
			}
		 	if($("#paramsUser\\.user_age").val()!=''){
		 		if(!num.exec($("#paramsUser\\.user_age").val())){
					alert('年龄必须为数字');
					return;
				}
			}else{
				$("#paramsUser\\.user_age").val(0);
			}
			if($("#paramsUser\\.clazz_id").val()=='0'){
				alert('班级不能为空');
				return;
			}
			if($("#paramsUser\\.user_question").val()==''){
				alert('密保问题不能为空');
				return;
			}
			if($("#paramsUser\\.user_answer").val()==''){
				alert('密保答案不能为空');
				return;
			}
			$("#info").attr('action','Admin_saveUser.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">学生管理&gt;&gt;<s:if test="#attr.user!=null && #attr.user.user_id!=0">编辑</s:if><s:else>添加</s:else>学生</span>
</div>
<form id="info" name="info" action="Admin_addUser.action" method="post">   
<s:hidden id="paramsUser.user_id" name="paramsUser.user_id" value="%{#attr.user.user_id}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.user!=null && #attr.user.user_id!=0">编辑</s:if><s:else>添加</s:else>学生</TD>
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
          <td width="15%" align="right" style="padding-right:5px"><font color="red">*</font> 学号：</td>
          <td width="35%" >
          	<s:if test="#attr.user!=null && #attr.user.user_id!=0"><s:property value="#attr.user.user_name" /></s:if>
          	<s:else><s:textfield name="paramsUser.user_name" id="paramsUser.user_name" value="%{#attr.user.user_name}"/> </s:else>
          </td>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 密码：</td>
          <td>
            <s:if test="#attr.user!=null && #attr.user.user_id!=0">
          	<s:password name="paramsUser.user_pass" id="paramsUser.user_pass" value=""  showPassword="true"/>
          	</s:if>
          	<s:else>
          	<s:password name="paramsUser.user_pass" id="paramsUser.user_pass" value="111111"  showPassword="true"/>
          	<span id="passTip" style="color:red;">初始密码：111111</span>
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px">提示：</td>
          <td colspan="3" style="color:red">学生的【学号】用于登录系统时的用户名</td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 姓名：</td>
          <td>
            <s:textfield name="paramsUser.real_name" id="paramsUser.real_name" value="%{#attr.user.real_name}"/>
          </td>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 性别：</td>
          <td>
            <input type="radio" id="sex1" name="paramsUser.user_sex" value="1"/>男&nbsp;&nbsp;
            <input type="radio" id="sex2" name="paramsUser.user_sex" value="2"/>女
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px">年龄：</td>
          <td colspan="3">
            <s:textfield name="paramsUser.user_age" id="paramsUser.user_age" value="%{#attr.user.user_age}"/>
          </td> 
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 班级：</td>
          <td colspan="3">
          	<s:select name="paramsUser.clazz_id" id="paramsUser.clazz_id" list="#attr.clazzs" value="%{#attr.user.clazz_id}" listKey="clazz_id" listValue="clazz_name" headerKey="0" headerValue="请选择" cssStyle="width:155px"></s:select>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 密保问题：</td>
          <td colspan="3">
           <s:textfield id="paramsUser.user_question" name="paramsUser.user_question" value="%{#attr.user.user_question}"/>
          </td> 
        </tr>   
         <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 密保答案：</td>
          <td colspan="3">
            <s:textfield id="paramsUser.user_answer" name="paramsUser.user_answer" value="%{#attr.user.user_answer}"/>
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
          	<s:if test="#attr.user!=null && #attr.user.user_id!=0">
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