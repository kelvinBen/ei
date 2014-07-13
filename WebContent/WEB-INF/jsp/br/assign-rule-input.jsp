<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
td{text-align:center;overflow:hidden;}
</style>
<script type="text/javascript">
	//公司集合对象
	var unitArray = [];
	$(function() {
		
		$("#a_pri_list").addClass("currentLink");
		
		$("#division_form").validate({										//注册表单校验规则
			rules: {
				'divisionRule.name': {
					required: true,
					maxlength:80
				},
				'division.companyFrom':{
					maxlength:10
				},
				'division.companyTo':{
					maxlength:10
				},
				'division.factoryFrom':{
					maxlength:10
				},
				'division.factoryTo':{
					maxlength:10
				},
				'division.groupFrom':{
					maxlength:10
				},
				'division.groupTo':{
					maxlength:10
				},
				'division.purOrgFrom':{
					maxlength:10
				},
				'division.purOrgTo':{
					maxlength:10
				},
				'division.purGroupFrom':{
					maxlength:10
				},
				'division.purGroupTo':{
					maxlength:10
				}				
			}
		});
				
		$("#select_all").click(function(){
			if($(this).attr("checked")==false){
				$('input:checkbox').each(function(i,obj){
					$(this).attr("checked",false);
				});			
			}else if($(this).attr("checked")==true){
				$('input:checkbox').each(function(i,obj){
					$(this).attr("checked",true);
				});			
			}
		});	

		$('#but_submit').click(function(){
			//设置集采标识
			if($("#isCentrialfalse").attr("checked")==true){
				$("#isCentral").attr("value","false");
			}else{
				$("#isCentral").attr("value","true");
			}
			 if($("#division_form").validate()){
				 if(!$("#isCentrialfalse").attr("checked")&&!$("#isCentrialtrue").attr("checked")){
					 alert('请选择规则分类');
					 return false;
				}
				//判断是否分派规则中的条件均为空
				 if($("#companyFrom").val() =="" 
					 && $("#factoryFrom").val() =="" 
						 && $("#groupFrom").val() =="" 
							 && $("#purOrgFrom").val() =="" 
								 && $("#purGroupFrom").val() ==""
									 &&  $("#amountFrom").val() ==""){
					       alert('<s:text name="division.title.submit.condition.no"/>');
								return;
						}
					
				/*判断分派规则里面 TO 大于等于 FROM 
				 *如果to不为空则必须大于from
				 */
				if($("#companyTo").val()!="" )
				{
					if($("#companyFrom").val()>$("#companyTo").val())
					{
						alert('<s:text name="division.companyfrom" /><s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
						return;
					}
				}
				if($("#factoryTo").val()!="" )
				{
					if($("#factoryFrom").val()>$("#factoryTo").val())
					{
						alert('<s:text name="division.factoryfrom" /><s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
						return;
					}
				}
				if($("#groupTo").val()!="" )
				{
					if($("#groupFrom").val()>$("#groupTo").val())
					{
						alert('<s:text name="division.groupfrom" /><s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
						return;
					}
				}
				if($("#purOrgTo").val()!="" )
				{
					if($("#purOrgFrom").val()>$("#purOrgTo").val())
					{
						alert('<s:text name="division.purorgfrom" /><s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
						return;
					}
				}
				if($("#purGroupTo").val()!="" )
				{
					if($("#purGroupFrom").val()>$("#purGroupTo").val())
					{
						alert('<s:text name="division.purgroupfrom" /><s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
						return;
					}
				}

				if($("#amountTo").val()!="" )
				{
					if($("#amountFrom").val()>$("#amountFrom").val())
					{
						alert('<s:text name="division.item.amount" /><s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
						return;
					}
				}

			    //判断是否选择了分派人，如果没选择，则提示
				if($('input.ids:checkbox').length==0){
					alert('<s:text name="message.select.one"/>');
					return;
				}
				
				$('input.ids:checkbox').each(function(){
					$(this).attr("checked",true);
				});
				//保存分派规则所属单位的名称
				$("#organName").attr("value",$("#unitList").getSelectedText4select());
				$("#division_form").submit();
			}
		});
		
		$('#but_cancel').click(function(){
			if(confirm( "您确定要退出不保存吗？ ")){ 
				 window.location.href='<s:url namespace="/br/divisionrule" action="list"/>';
				}else{ 
				}	
		});

		$('#but_new_staff').click(function(){
			window.open('<s:url namespace="/user/search" action="searchCheckboxInit"/>',
					'<s:text name="menu.pri.create" />',
					'height=750px, width=650px, top=0, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
			return false;			
		});

		$('#but_delete_staff').click(function(){
			if($('input.ids:checkbox:checked').length==0){
				alert('<s:text name="message.select.one"/>');
				return;
			}else{
				$('input.ids:checkbox:checked').each(function(){
					strId = $(this).attr("value");
					$('#tr_'+strId).remove();
				});	
			}
		});

		$('#unitList').change(function(){
			var strValue = $(this).attr("value");
			for(var i=0;i<unitArray.length;i++){
				if(strValue == unitArray[i].id){
					if(unitArray[i].centrial=="1"){//业务单位性质是集采
						$('#isCentrialfalse').attr("checked",false);
						$('#isCentrialtrue').attr("checked",true);

						$('#isCentrialtrue').attr("disabled",false);
						$('#isCentrialfalse').attr("disabled",false);
						//集采时，前四项不可选
						$('.fornull').attr("disabled",true);
					}else{//业务单位性质是非集采
						$('.fornull').attr("disabled",false);
						$('#isCentrialfalse').attr("checked",true);

						$('#isCentrialtrue').attr("disabled",true);
						$('#isCentrialfalse').attr("disabled",true);
					}
					break;
				}
			}
		});

		$("input[name='centralDelegate']").change(function(){
			if($(this).val()=="true"){
				//集采时，前四项不可选
				$('.fornull').attr("disabled",true);				
			}else{
				$('.fornull').attr("disabled",false);
			}
		});
		//初始化状态
		//unitArray[i].id代表业务单位ID
		//unitArray[i].centrial代表业务单位默认属于集采true，非集采的false
		//修改已有分派规则
		//新建分派规则
	   
		if($('#rule_id').attr("value")==null || $('#rule_id').attr("value")==""){
			//var id = $('#unitList>option:first').attr("value");
			var strValue = $("#unitList").attr("value");//获取新增时分派规则的业务单位ID
			for(var i=0;i<unitArray.length;i++){ 
				if(strValue == unitArray[i].id){
					if(unitArray[i].centrial=="1"){//业务单位性质是集采
						$('#isCentrialfalse').attr("checked",false);
						$('#isCentrialtrue').attr("checked",true);
						$('#isCentrialtrue').attr("disabled",false);//单选框可用
						$('#isCentrialfalse').attr("disabled",false);
						
						//集采时，前四项不可选
						$('.fornull').attr("disabled",true);
					}else{//业务单位性质是非集采
						$('.fornull').attr("disabled",false);
						$('#isCentrialfalse').attr("checked",true);
						$('#isCentrialtrue').attr("disabled",true);//单选框不可用
						$('#isCentrialfalse').attr("disabled",true);
					}
			  }
			}
		}
		else{
			var strValue = $("#unitList").attr("value");//获取以后分派规则的业务单位ID
			
			for(var i=0;i<unitArray.length;i++){
				if(strValue == unitArray[i].id){
						if($('#isCentral').attr("value")=="true"){//规则属性是集采
							$('#isCentrialtrue').attr("checked",true);
							if(unitArray[i].centrial=="1"){//集采，可能是总公司机关（可选，业务单位=1）分公司（不可选）
								$('#isCentrialfalse').attr("disabled",false);
								$('#isCentrialtrue').attr("disabled",false);
							}
							else{
								$('#isCentrialfalse').attr("disabled",true);
								$('#isCentrialtrue').attr("disabled",true);			
							}
						}
					    else{//规则属性是非集采
							$('#isCentrialfalse').attr("checked",true);
							$('#isCentrialfalse').attr("disabled",true);
							$('#isCentrialtrue').attr("disabled",true);	
						}	
				}
			}
		}
		//锁定状态
		$('#companyTo').focus(function(){
			if($('#companyFrom').attr("value")==null || $('#companyFrom').attr("value")==""){
				$('#companyTo').attr("value","");
				$('#companyTo').blur();
				return false;
			}
		});
		$('#factoryTo').focus(function(){
			if($('#factoryFrom').attr("value")==null || $('#factoryFrom').attr("value")==""){
				$('#factoryTo').attr("value","");
				$('#factoryTo').blur();
				return false;
			}
		});
		$('#groupTo').focus(function(){
			if($('#groupFrom').attr("value")==null || $('#groupFrom').attr("value")==""){
				$('#groupTo').attr("value","");
				$('#groupTo').blur();
				return false;
			}
		});
		$('#purOrgTo').focus(function(){
			if($('#purOrgFrom').attr("value")==null || $('#purOrgFrom').attr("value")==""){
				$('#purOrgTo').attr("value","");
				$('#purOrgTo').blur();
				return false;
			}
		});
		$('#purGroupTo').focus(function(){
			if($('#purGroupFrom').attr("value")==null || $('#purGroupFrom').attr("value")==""){
				$('#purGroupTo').attr("value","");
				$('#purGroupTo').blur();
				return false;
			}
		});
		$('#amountTo').focus(function(){
			if($('#amountFrom').attr("value")==null || $('#amountFrom').attr("value")==""){
				$('#amountTo').attr("value","");
				$('#amountTo').blur();
				return false;
			}
		});		
	});

	//分配对象
	function addStaff(result){
		var isExit = false;
		for(var j=0;j<result.length;j++){
			for(var i=0;i<$('input.ids:checkbox').size();i++){
				if(result[j].id == $('input.ids:checkbox').get(i).value){
					isExit = true;
					break;
				}
			}
			if(isExit == false){
				//staffList.push(result[j]);
				var strAppend = "<tr id='tr_"+result[j].id+"'><td><input type='checkbox' class='ids' name='ids' value='"+result[j].id+"'/></td>"+
								"<td>"+result[j].name+"</td>"+
								"<td>"+result[j].department+"</td>"+
								"<td>"+result[j].station+"</td>"+
								"<td>"+result[j].duty+"</td>"+
								"</tr>";
				
				$('#staff_cont tr:last').after(strAppend);
				$('#staff_cont tr:last>td').css("text-align","center");
			}
			isExit = false;
		}

	}
</script>
</head>
<body>
<div class="editdiv">
	<s:form id="division_form" namespace="/br/divisionrule" action="save" theme="simple" method="POST">
	<s:if test="#request.id!=null">
		<s:hidden id="rule_id" name="divisionRule.id"/>
		<s:hidden id="createTime" name="divisionRule.createTime"/>
		<s:hidden id="createUserId" name="divisionRule.createUserId"/>
		<s:hidden id="createUserName" name="divisionRule.createUserName"/>
		<s:hidden id="deleted" name="divisionRule.deleted"/>
	</s:if>
		<s:hidden id="organName" name="divisionRule.organName"/>
	 <table class="tblContent" width="100%" cellpadding="0">
		<thead>
		  <tr><th class="tdTitle" style="height:30px;" colspan="2"><s:text name=""/><s:text name="division.title.new.division"/></th></tr>
		</thead>				
		<tbody>
		  <tr>
			<th class="tdTitle"><s:text name="division.name"/></th>
			<td class="TdRight"><s:textfield name="divisionRule.name" maxlength="80"/></td>
		  </tr>
		  <tr>
			<th class="tdTitle"><s:text name="division.unit"/></th>
			<td class="TdRight">  
			  <s:select id="unitList" list="userOrgan" listKey="key" listValue="value" name="divisionRule.organId"/>
			</td>
			<s:iterator value="#request.bus" var="unit">
			  <script type="text/javascript">
			  	var objUnitTemp = {};
			  	objUnitTemp.id='<s:property value="#unit.organId"/>';
			  	objUnitTemp.centrial='<s:property value="#unit.central"/>';
			  	unitArray.push(objUnitTemp);
			  </script>
			</s:iterator>
		  </tr>
		</tbody>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
	    <colgroup>
	      <col style="width:10%;"/>
	      <col style="width:30%;"/>
	      <col style="width:60%;"/>
	    </colgroup>
		<thead>
		  <tr><th class="tdTitle" colspan="3" style="height:30px;"><s:text name="division.title.condition"/></th></tr>
		</thead>
	    <tbody>
	      <tr>
	        <th class="tdTitle"><s:text name="division.type"/>:</th>
	        <td class="TdRight" colspan="2">
			  <s:hidden name="divisionRule.isCentrial" id="isCentral"/>
			  <c:if test="${isCentralUser=='Y'}"><input type="radio" name="centralDelegate" id="isCentrialtrue" value="true" <s:if test="divisionRule.isCentrial">checked="checked"</s:if>/>
			  <label for="isCentrialtrue"><s:text name="division.centrialpurchase"/></label></c:if>
			  <input type="radio" name="centralDelegate" id="isCentrialfalse" value="false" <s:if test="!divisionRule.isCentrial">checked="checked"</s:if>/>
			  <label for="isCentrialfalse"><s:text name="division.requisition"/></label>
	        </td>
	      </tr>
	      <tr>
	        <th class="tdTitle"><s:text name="division.companyfrom"/>:</th>
	        <td class="TdRight"><s:text name="division.from"/><s:textfield cssClass="fornull" id="companyFrom" maxlength="4" name="divisionRule.companyFrom"/></td>
	        <td class="TdRight"><s:text name="division.to"/><s:textfield cssClass="fornull" id="companyTo" maxlength="4" name="divisionRule.companyTo"/></td>
	      </tr>
	      <tr>
	        <th class="tdTitle"><s:text name="division.factoryfrom"/>:</th>
	        <td class="TdRight"><s:text name="division.from"/><s:textfield cssClass="fornull" id="factoryFrom" maxlength="4" name="divisionRule.factoryFrom"/></td>
	        <td class="TdRight"><s:text name="division.to"/><s:textfield cssClass="fornull" id="factoryTo" maxlength="4" name="divisionRule.factoryTo"/></td>
	      </tr>
	      <tr>
	        <th class="tdTitle"><s:text name="division.groupfrom"/>:</th>
	        <td class="TdRight"><s:text name="division.from"/><s:textfield cssClass="fornull" id="groupFrom" maxlength="4" name="divisionRule.groupFrom"/></td>
	        <td class="TdRight"><s:text name="division.to"/><s:textfield cssClass="fornull" id="groupTo"  maxlength="4" name="divisionRule.groupTo"/></td>
	      </tr>
	      <tr>
	        <th class="tdTitle"><s:text name="division.purorgfrom"/>:</th>
	        <td class="TdRight"><s:text name="division.from"/><s:textfield cssClass="fornull" id="purOrgFrom" maxlength="3" name="divisionRule.purOrgFrom"/></td>
	        <td class="TdRight"><s:text name="division.to"/><s:textfield cssClass="fornull" id="purOrgTo" maxlength="3" name="divisionRule.purOrgTo"/></td>
	      </tr>
	      <tr>
	        <th class="tdTitle"><s:text name="division.purgroupfrom"/>:</th>
	        <td class="TdRight"><s:text name="division.from"/><s:textfield maxlength="10" id="purGroupFrom" name="divisionRule.purGroupFrom"/></td>
	        <td class="TdRight"><s:text name="division.to"/><s:textfield maxlength="10" id="purGroupTo" name="divisionRule.purGroupTo"/></td>
	      </tr>
	      <tr>
	        <th class="tdTitle"><s:text name="division.item.amount"/>:</th>
	        <td class="TdRight"><s:text name="division.from"/><s:textfield cssClass="fornull" maxlength="13" id="amountFrom" name="divisionRule.amountFrom"/></td>
	        <td class="TdRight">
	          <s:text name="division.to"/><s:textfield cssClass="fornull" maxlength="13" id="amountTo" name="divisionRule.amountTo"/>
	          <s:select list="#request.userInterfaceService.userInterfaceBean.selectableCurrencies" name="divisionRule.currency.id" value="divisionRule.currency.id" />
	        </td>
	      </tr>
	      <tr><th colspan="3" style="text-align:center;height:20px;"><s:text name="division.title.and"/></th></tr>				      				      				      				      
	    </tbody>
	  </table>
	  <table class="tblContent4list" width="100%" cellpadding="0" id="staff_cont">
		<thead>
		  <tr><th class="tdTitle" colspan="5" style="padding-left:5px;height:30px;"><s:text name="division.title.confirm.staff"/></th></tr>
		</thead>
		<tbody>
		  <tr>
		    <td colspan="5" style="text-align:left;">
		      <input type="button" id="but_new_staff" value="<s:text name='create'/>">
		      <input type="button" id="but_delete_staff" value="<s:text name='delete'/>"></input>
		    </td>
		  </tr>
		  <tr>
		    <th><s:checkbox id="select_all" name="select_all"/></th>
		    <th><s:text name="login.label.username"/></th>
		    <th><s:text name="prototype.department"/></th>
		    <th><s:text name="prototype.situation"/></th>
		    <th><s:text name="prototype.responsibility"/></th>
		  </tr>
		  <s:iterator value="divisionRule.staff" var="staff">
		  <tr id="tr_<s:property value="#staff.userId"/>">
		    <td style="text-align:center;"><input type='checkbox' class='ids' name='ids' value='<s:property value="#staff.userId"/>'/></td>
		    <td style="text-align:center;"><s:property value="#staff.userName"/></td>
		    <td style="text-align:center;"><s:property value="#staff.userDepartment"/></td>
		    <td style="text-align:center;"><s:property value="#staff.userPosition"/></td>
		    <td style="text-align:center;"><s:property value="#staff.userDuty"/></td>
		  </tr>
		  </s:iterator>					
		</tbody>   
	  </table>
	  <table class="tblContent4list" width="100%" style="border-top:0;" cellpadding="0">
		<thead>
		  <tr>
			<th colspan="10" class="tdTitle" style="text-align:center;">
			  <button value="" id="but_submit" type="button"><s:text name="button.save" /></button>
			  <button value="" id="but_cancel" type="button"><s:text name="button.quit" /></button>
		   </th>
		</tr>
	  </thead>
	</table>
	</s:form>
	</div>
</body>
<script language="JavaScript">
<!--
function changeCentral(){
	if($("input[id='isCentrialtrue']").attr("checked")){
		//集采时，前四项不可选
		$('.fornull').attr("disabled",true);				
	}else{
		$('.fornull').attr("disabled",false);
	}
}
$(document).ready(function(){
	changeCentral();
}); 
	
//-->
</script>
</html>