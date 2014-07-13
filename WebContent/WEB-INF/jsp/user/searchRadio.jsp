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
.td1{text-align:right;width:20%;}
.td2{text-align:left}
.th_but{text-align:center!important;height:30px;}
.th_but button{margin-right:20px;}
.selectCon{float:left;margin-right:5px;margin-top:2px;}
.movCon{float:left;margin-right:5px;margin-top:22px;vertical-align:middle;}
.result{margin:0px;width:100%;}
.result td{text-align:center;}
.result th{text-align:center;}
.result tr.title td{background-color:#f3f9ff;}
select{width:100px;}
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
		window.location.href="<s:url namespace='/user/search' action='searchRadioList'/>";		
	});

	$('#but_submit').click(function(){
		if($('input.ids:radio:checked').length==0){
			alert('<s:text name="message.select.one"/>');
			return;
		}else{
			var result=[];
			var strValue;
			$('input.ids:radio:checked').each(function(){
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
<body id="body_dialog">
<div class="editdiv">
	  <s:form id="list" namespace="/user/search" action="searchRadioList" theme="simple" method="post"> 
	<table class="tblContent" width="100%" cellpadding="0">
		<tr><th colspan="2" class="tdTitle" style="height:26px;"><s:text name="label.wildcard"/></th></tr>
		<tr>
		   <th class="tdTitle"><s:text name="label.family.name"/><s:text name="label.first.name"/></th>
		   <td class="TdRight" width="80%"><s:textfield size="12" maxlength="12" id="purNumber" name="userCondition.userName"/></td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="prototype.department"/></th>
		  <td class="TdRight">
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name="pr.mange.from"/></div>
		    <div><s:select id="preStatus" cssClass="multiple" name="" list="departments"/></div>
		  </div>
		  <div class="movCon">
		    <input type="button" id="rigStatus" class="moveRight" value="<s:text name='pr.mange.move.right'/>"><br><br><input id="lefStatus" class="moveLeft" type="button" value="<s:text name='pr.mange.move.left'/>">
		  </div>
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name='pr.mange.to'/></div>
		  	<div><select id="nexStatus" name="userCondition.userDepartment" multiple="true"></select></div>
		  </div>		  
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle" width="100"><s:text name="prototype.situation"/></th>
		  <td class="TdRight">
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name="pr.mange.from"/></div>
		    <div><s:select id="preDistStat" cssClass="multiple" list="positions"/></div>
		  </div>
		  <div class="movCon">
		    <input type="button" id="rigDistStat" class="moveRight" value="<s:text name='pr.mange.move.right'/>"><br><br><input id="lefDistStat" class="moveLeft" type="button" value="<s:text name='pr.mange.move.left'/>">
		  </div>
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name='pr.mange.to'/></div>
		  	<div><select id="nexDistStat" name="userCondition.userPosition" multiple="true"></select></div>
		  </div>		  
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="prototype.responsibility"/></th>
		  <td class="TdRight">
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name="pr.mange.from"/></div>
		    <div><s:select id="preSubStat" cssClass="multiple" list="dutys"/></div>
		  </div>
		  <div class="movCon">
		    <input id="rigSubStat" type="button" class="moveRight" value="<s:text name='pr.mange.move.right'/>"><br><br><input id="lefSubStat" class="moveLeft" type="button" value="<s:text name='pr.mange.move.left'/>">
		  </div>
		  <div class="selectCon">
		    <div style="text-align:center"><s:text name='pr.mange.to'/></div>
		  	<div><select id="nexSubStat" name="userCondition.userDuty" multiple="true"></select></div>
		  </div>		  
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle" colspan="2">
		    <button type="button" id="select_now" style="float:left;"><s:text name="pr.search.now"/></button> 
		    <button type="button" id="but_cancel" style="float:right;"><s:text name="cc.button.cancel"/></button>
		    <button type="button" id="but_submit" style="float:right;"><s:text name="button.submit"/></button> 
		  </th>
		</tr>
		</table>
		<div>
		<table class="tblContent4list" style="table-layout:fixed;" cellpadding="0">
		<colgroup>
				<col style="width:10%;"/>
				<col style="width:10%;"/>
				<col style="width:20%;"/>
				<col style="width:20%;"/>
				<col style="width:10%;"/>
				<col style="width:20%;"/>
				<col style="width:10%;"/>
		</colgroup>
		<thead>
		<tr>
          <th ><s:text name="login.label.username"/></th>
          <th ><s:text name="label.family.name"/><s:text name="label.first.name"/></th>
          <th ><s:text name="com.cnooc.domain.PurchaseRequisition.company"/></th>
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
				<col style="width:10%;"/>
				<col style="width:10%;"/>
				<col style="width:20%;"/>
				<col style="width:20%;"/>
				<col style="width:10%;"/>
				<col style="width:20%;"/>
				<col style="width:10%;"/>
			</colgroup>	        
		        <s:iterator value="userList" var="user">
		        <tr>
	          <td><s:property value="#user.userId"/></td>
	          <td><s:property value="#user.userName"/></td>
	          <td><s:property value="#user.organName"/></td>
	          <td><s:property value="#user.userDepartment"/></td>
	          <td><s:property value="#user.userPosition"/></td>
	          <td><s:property value="#user.userDuty"/></td>
				  <td><input type="radio" name="ids" value="<s:property value='#user.userId'/>" class="ids"/></td>
		        </tr>
		        <script type="text/javascript">
					jsonTemp = {};
					jsonTemp.id='<s:property value="#user.userId"/>';
					jsonTemp.name='<s:property value="#user.userName"/>';
					jsonTemp.department='<s:property value="#user.userDepartment"/>';
					jsonTemp.station='<s:property value="#user.userPosition"/>';
					jsonTemp.duty='<s:property value="#user.userDuty"/>';
					jsonResult.push(jsonTemp);
		        </script>
		        </s:iterator>
	  </table>
	  </div>
	  </s:form>       
</div>      
</body>
</html>