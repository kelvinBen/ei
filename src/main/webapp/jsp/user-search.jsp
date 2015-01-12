<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购需求详细搜索页</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
.selectCon{float:left;margin-right:5px;margin-top:2px;}
select{width:100px;}
.movCon{float:left;margin-right:5px;margin-top:22px;vertical-align:middle;}
</style>
<script type="text/javascript">
$(function(){

	//为string类构建trim方法
	String.prototype.trim = function(){
		return this.replace(/(^\s*)|(\s*$)/g,"");
	};
		
	$('select.multiple').each(function(){
		$(this).attr("multiple",true);
	});

	//状态项右移
	$('input:button.moveRight').each(function(i,obj){
		$(this).click(function(){
			globName = $(this).attr("id").substring(3);
			movFrom = "#pre"+globName;
			movTo = "#nex"+globName;
			if($(movFrom+" option").size()==0)
				return ;
			else{
				$(movFrom+" option").each(function(){
					if($(this).attr("selected")==true)
						$(movTo).append($(this));	
				});
			}
		});
	});

	//状态项左移
	$('input:button.moveLeft').each(function(i,obj){
		$(this).click(function(){
			globName = $(this).attr("id").substring(3);
			movFrom = "#nex"+globName;
			movTo = "#pre"+globName;
			if($(movFrom+" option").size()==0)
				return ;
			else{
				$(movFrom+" option").each(function(){
					if($(this).attr("selected")==true)
						$(movTo).append($(this));	
				});
			}		
		});
	});

	//搜索分派人
	$('#select_now').click(function(){
		$('#list').submit();
	});

	//新搜索
	$('#select_new').click(function(){
		window.location.href="<s:url namespace='/user' action='tosearch'/>";		
	});

	$('#but_submit').click(function(){
		if($('input.ids:checkbox:checked').length==0){
			alert('<s:text name="message.select.one"/>');
			return;
		}else{
			var result=[];
			var strValue;
			$('input.ids:checkbox:checked').each(function(){
				strValue = $(this).attr("value");
				for(var i=0;i<jsonResult.length;i++){
					if(jsonResult[i].id==strValue)
						result.push(jsonResult[i]);
				}
			});
			window.opener.addStaff(result);
			window.close();
		}
	});

	$('#but_cancel').click(function(){
		window.close();
	});	
});
var jsonResult=[];
var jsonTemp;
</script>
</head>
<body>
<div class="editdiv">
	<s:form id="list" namespace="/user" action="list" theme="simple" method="post"> 
	<table class="tblContent" width="100%" cellpadding="0">
		<tr><th colspan="2" class="tdTitle" style="height:26px;"><s:text name="label.wildcard"/></th></tr>
		<tr>
		   <th class="tdTitle"><s:text name="label.family.name"/></th>
		   <td class="TdRight"><s:textfield maxlength="6" id="purNumber" name="sysUser.lastName"/></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="label.first.name"/></th>
		   <td class="TdRight"><s:textfield maxlength="6" id="purNumber" name="sysUser.firstName"/></td>
		</tr>		
		<tr>
		  <th class="tdTitle"><s:text name="prototype.department"/></th>
		  <td class="TdRight">
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name="pr.mange.from"/></div>
		    <div><s:select id="preStatus" cssClass="multiple" name="" list="departments" listKey="id" listValue="description"/></div>
		  </div>
		  <div class="movCon">
		    <input type="button" id="rigStatus" class="moveRight" value="<s:text name='pr.mange.move.right'/>"><br><br><input id="lefStatus" class="moveLeft" type="button" value="<s:text name='pr.mange.move.left'/>">
		  </div>
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name='pr.mange.to'/></div>
		  	<div><select id="nexStatus" name="sysUser.department.key" multiple></select></div>
		  </div>		  
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="prototype.situation"/></th>
		  <td class="TdRight">
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name="pr.mange.from"/></div>
		    <div><s:select id="preDistStat" cssClass="multiple" list="stations" listKey="id" listValue="description" /></div>
		  </div>
		  <div class="movCon">
		    <input type="button" id="rigDistStat" class="moveRight" value="<s:text name='pr.mange.move.right'/>"><br><br><input id="lefDistStat" class="moveLeft" type="button" value="<s:text name='pr.mange.move.left'/>">
		  </div>
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name='pr.mange.to'/></div>
		  	<div><select id="nexDistStat" name="sysUser.station.key" multiple></select></div>
		  </div>		  
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="prototype.responsibility"/></th>
		  <td class="TdRight">
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name="pr.mange.from"/></div>
		    <div><s:select id="preSubStat" cssClass="multiple" list="dutys" listKey="id" listValue="description" /></div>
		  </div>
		  <div class="movCon">
		    <input id="rigSubStat" type="button" class="moveRight" value="<s:text name='pr.mange.move.right'/>"><br><br><input id="lefSubStat" class="moveLeft" type="button" value="<s:text name='pr.mange.move.left'/>">
		  </div>
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name='pr.mange.to'/></div>
		  	<div><select id="nexSubStat" name="sysUser.responsibility.key" multiple></select></div>
		  </div>		  
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle" colspan="2">
		    <button type="button" id="select_now" style="float:left;"><s:text name="pr.search.now"/></button> 
		    <button type="button" id="select_new" style="float:left;"><s:text name="pr.search.new"/></button>
		    <button type="button" id="but_cancel" style="float:right;"><s:text name="cc.button.cancel"/></button>
		    <button type="button" id="but_submit" style="float:right;"><s:text name="button.submit"/></button> 
		  </th>		          
		</tr>
		</table>
		<div>
		<table class="tblContent4list" style="table-layout:fixed;" cellpadding="0">
		<colgroup>
			<col style="width:15%;"/>
			<col style="width:10%;"/>
			<col style="width:10%;"/>
			<col style="width:20%;"/>
			<col style="width:15%;"/>
			<col style="width:20%;"/>
			<col style="width:10%;"/>
		</colgroup>
		<thead>
		<tr>
          <th ><s:text name="login.label.username"/></th>
          <th ><s:text name="label.family.name"/></th>
          <th ><s:text name="label.first.name"/></th>
          <th ><s:text name="prototype.department"/></th>
          <th ><s:text name="prototype.situation"/></th>		          
          <th ><s:text name="prototype.responsibility"/></th>
          <th ><s:text name="button.select"/></th>
		</tr>
		</thead>
		</table>
		</div>
		<div style="width:100%;height:280px;overflow-y:auto;overflow-x:hidden;">
		<table class="tblContent4list" style="table-layout:fixed;word-break:break-all;" cellpadding="0">
			<colgroup>
				<col style="width:15%;"/>
				<col style="width:10%;"/>
				<col style="width:10%;"/>
				<col style="width:20%;"/>
				<col style="width:15%;"/>
				<col style="width:20%;"/>
				<col style="width:10%;"/>
			</colgroup>	        
	        <s:if test="list!=null && list.size()!=0">
	        <s:iterator value="list" var="user">
	        <tr>
	          <td><s:property value="#user.username"/></td>
	          <td><s:property value="#user.lastName"/></td>
	          <td><s:property value="#user.firstName"/></td>
	          <td><s:property value="#user.department.description"/></td>
	          <td><s:property value="#user.station.description"/></td>
	          <td><s:property value="#user.responsibility.description"/></td>
	          <td><input type="checkbox" name="ids" value="<s:property value='#user.id'/>" class="ids"/></td>
	        </tr>
	        <script type="text/javascript">
	        	jsonTemp = {};
	        	jsonTemp.id='<s:property value="#user.id"/>';
	        	jsonTemp.name='<s:property value="#user.username"/>';
	        	jsonTemp.lastName='<s:property value="#user.lastName"/>';
	        	jsonTemp.firstName='<s:property value="#user.firstName"/>';
	        	jsonTemp.department='<s:property value="#user.department.description"/>';
	        	jsonTemp.station='<s:property value="#user.station.description"/>';
	        	jsonTemp.duty='<s:property value="#user.responsibility.description"/>';
	        	jsonResult.push(jsonTemp);
	        </script>
	        </s:iterator>
	        </s:if>
	  </table>
	  </div>
	</s:form>       
</div>      
</body>
</html>