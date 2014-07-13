<%@ page pageEncoding="UTF-8"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑长期协议</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
var oldStateContainer = new Array();
$(function() {
	if($("#isDeleted").val()=="true"){
		$("input,select,textarea,:button").attr("disabled",true);
		return;
	}
	
	$("#effectDate").datepicker();									//生效日期
	$("#expireDate").datepicker();									//到期日期
	<s:if test="%{id == null}">
		$("#effectDate").attr("value",$.datepicker.formatDate( "yy/mm/dd", new Date()));
		$("#expireDate").attr("value",$.datepicker.formatDate( "yy/mm/dd", new Date()));
	</s:if>
	$("#con_form").validate({										//注册表单校验规则
		rules: {
			'conSum.hostOrg.organId': {
				required: true
			},
			'conSum.contNum': {
				required: true,
				maxlength: 255
			},
			'conSum.contNum2': {
				required: true,
				maxlength: 80
			},
			'conSum.contType': {
				required: false,
				maxlength: 80
			},
			'conSum.supplierName': {
				required: true,
				maxlength: 120
			},
			'conSum.effectDate': {
				required: true,
				date: true
			},
			'conSum.expireDate': {
				required: true,
				date: true
			},
			'conSum.appOrgsName': {
				required: true
			}
		}
	});
	
	$("INPUT,SELECT,TEXTAREA").each(function(i,obj){					//保存原始表单内容，用于跟踪表单内容修改
		saveState(obj,oldStateContainer);
	});
	
	$("#pr_next,A").click(function(){									//注册链接<a>与"下一步"按钮的响应事件
		if(window.event.returnValue==false)
			return;
		var newStateContainer = new Array();							
		$("INPUT,SELECT,TEXTAREA").each(function(i,obj){				//保存最新的表单内容，用于检验表单内容是否修改过
			saveState(obj,newStateContainer);
		});
		if ((oldStateContainer.toString() != newStateContainer.toString()) && (confirm('<s:text name="message.confirm.datachanged" />'))){
			if ($("#con_form").validate().form()){						//验证表单内容，如果校验通过则提交表单
				jQuery.ajax({											//异步提交表单（Ajax）
                    url: '<s:url namespace="/sc/contract" action="save" />',//提交的页面
                    data: $('#con_form').serialize(), 					//从表单中获取数据
                    type: "POST",                   					//设置请求类型为"POST"，默认为"GET"
                    beforeSend: function(){          					//设置表单提交前方法
                    },
                    error: function(request) {      					//设置表单提交出错
                        alert('<s:text name="message.save.error" />');
                    },
                    success: function(data) {							//设置表单提交完成使用方法
                    }
                });
			}
			else{
				return false;											//校验不通过，终止后继操作
			}
		}

		if ($(this).attr("id") == 'pr_next'){
			location.href=$("#a_pri_list")[0].href;
			return false;
		}
		else if($(this).href){
			location.href=$(this).href;
			return false;
		}
	});
	
	$("#pr_save").click(function(){
		if($("#checkInfoHasChange").val()=="true"){
			if($("#con_form").valid()){
			jQuery.ajax({													//异步提交表单（Ajax）
	            url: '<s:url namespace="/sc/contract" action="check" />',	//提交的页面
	            data: $('#con_form').serialize(), 							//从表单中获取数据
	            type: "POST",                   							//设置请求类型为"POST"，默认为"GET"
	            beforeSend: function(){          							//设置表单提交前方法
	            },
	            error: function(request) {      							//设置表单提交出错
	                alert('<s:text name="message.save.error" />');
	            },
	            success: function(data) {									//设置表单提交完成使用方法
					if(data!="success"){
						alert(data);
						return false;
					}
	            	//alert("submitWithcheck");
	            	$("#con_form").submit();
	            }
	        });
			
		}
		}else{
			$("#con_form").submit();
		}
	});

	$("#but_return").click(function(){
		location.href="<s:url namespace="/sc/contract" action="list"/>";
		return false;
	});

	
	//业务单位树选择
	$("#appOrgsName").click(function(){
			var url ="<%=basePath %>jsp/help.jsp?url=struhelp.cmd&method=getSelectRoot&organType=1,2&isCheckBox=1&isIncludeSelf=1&isTree=1&rootId=&showOrganType=1,2";      
			var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
			if(win != null){
				var buId = win[0];
				var buText = win[1];
				buText = buText.replace(/σ/g,"\n");
				buId = buId.replace(/σ/g,",");
				$("#buIds").val(buId);
				$("#appOrgsName").val(buText);
			}
		
	});
	
	
	
	//监听长期协议编号的值是否变化
	$("#contNum2,#orgList").change(function(){
		$("#checkInfoHasChange").val(true);
	});
	
	
	//供应商名称 ,供应商编码帮助
	$("#select_supplierName").click(function(){		
		   var url="<s:url namespace="/supplier" action="search"/>";
           var result = window.showModalDialog(url,"","dialogWidth:1000px; dialogHeight:500px; resizable:yes; status:yes;Maximize=yes;"); 
		   
           //设置值
           $("input[name='conSum.supplierNum']").val(result[0].externalId);
            $("input[name='conSum.supplierName']").val(result[0].supplierName);
           
		});
	
	//设置textInput的宽度
	$("form input[type='text']").width(300);
	
});
</script>
</head>
<body>
  <div class="editdiv">
	<%@ include file="/WEB-INF/jsp/sidebar-contract.jsp"%>
	<div>
	<s:if test="%{hasActionMessages()}">
	<table class="tblprompt" cellpadding="0" >
		<tbody>
		  <tr>
			<td style="text-align:right"><s:actionmessage/></td>
		  </tr>
		</tbody>
	</table>
	</s:if>
	<table class="tblContent" width="100%" cellpadding="0" >
		<s:hidden id="isDeleted" value="%{conSum.deleted}"/>
		<s:form id="con_form" namespace="/sc/contract" action="save" theme="simple" method="post">
		<s:if test="%{id != null}">
			<s:hidden name="conSum.id"/>
			<s:hidden name="conSum.deleted" />
		</s:if>
		<s:else>
			<s:hidden name="conSum.deleted" value="false"/>
		</s:else>
		<s:hidden name="buInJSON" id="buInJSON"/>
		<s:hidden id="checkInfoHasChange"/>
		<tbody>
			<s:i18n name="LongTermContract">
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.hostOrg"/><span class="star"> *</span></th>
				<td class="TdRight">
					<s:select id="orgList" list="orgs" name="hostOrg.organId" value="%{hostOrg.organId}"/>
					<s:hidden name="conSum.hostOrg.organId" value="test"></s:hidden>
					<s:hidden name="conSum.hostOrg.organIdTest" value="conSum.hostOrg.organIdTest"></s:hidden>
					<s:hidden name="sss" value="sssss"></s:hidden>
					<s:hidden name="conSumshostOrgsorganIdTest" value="conSumshostOrgsorganIdTest"></s:hidden>
					
				</td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.contNum" /><span class="star"> *</span></th>
				<td class="TdRight">
					<s:textfield  id="contNum" cssClass="inputnormal"  name="conSum.contNum"/>
				</td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.contNum2" /><span class="star"> *</span></th>
				<td class="TdRight">
				  <s:textfield id="contNum2" cssClass="inputnormal" name="conSum.contNum2"/>
				</td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.contType" /></th>
				<td class="TdRight">
				  <s:select headerKey="" headerValue="" list="#{'WK-价值协议':'WK-价值协议','MK-数量协议':'MK-数量协议'}" name="conSum.contType"/>
				</td>
			</tr>			
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.supplierNum" /></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="conSum.supplierNum" readonly="true"/></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.supplierName" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="conSum.supplierName" readonly="true"/><input type="button" id="select_supplierName" value="<s:text name="button.select"/>"></td>
			</tr>
			<tr>
				<th class="tdTitle" colspan=""><s:text name="com.cnooc.req.domain.sc.ContractSummary.effectDate" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield id="effectDate" cssClass="inputnormal" name="conSum.effectDate"/></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.expireDate" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield id="expireDate" cssClass="inputnormal" name="conSum.expireDate"/></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.applyOrgs" /> <span class="star"> *</span></th>
				<td class="TdRight">
				  <s:textarea readonly="true" cols="50" rows="5" cssClass="inputnormal" id="appOrgsName" name="conSum.appOrgsName"/>
				  <s:hidden name="buIds" id="buIds"/>
				 
				</td>
			</tr>
			</s:i18n>
			<tr>
				<td class="tdTitle" colspan="2" style="text-align: center;">
					<input value="<s:text name="button.save" />" id="pr_save" type="button">
					<s:if test="%{id != null}">
					<button value="" id="pr_next" type="button"><s:text name="button.next" /></button>
					</s:if>
					<button value="" id="but_return" type="button">返回列表页</button>
				</td>
			</tr>
		</tbody>
		</s:form>
	</table>
	<div id="nodeTrees" class="editdiv" style="border:1px solid #cccccc;display:none;left:0px;top:0px;z-index:1000;position:absolute;">
		<ul id="butree" style="width:100%;"></ul>
		<div style="text-align:center;">
			<button type="button" id="but_tree_con">确定</button>
			<button type="button" id="but_cancel">取消</button>
		</div>
	</div>
	</div>
  </div>
  <s:hidden value="%{#request['conSum.hostOrg.organIdT']}"></s:hidden>
  <s:hidden value="%{conSum.hostOrg.organIdT}"></s:hidden>
  
  <s:hidden value="%{#request['conSum.hostOrg.organId']}"></s:hidden>
  <s:hidden value="%{conSum.hostOrg.organId}"></s:hidden>
  <s:hidden value="%{conSum.contNum}"></s:hidden>
</body>
</html>