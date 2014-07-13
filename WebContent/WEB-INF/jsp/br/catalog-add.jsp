<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>
	<s:text name="com.cnooc.domain.catalog.add.header"/>
</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	$("#a_sm_creat").addClass("currentLink");
	//注册选择物料组（分类）按钮事件
	$("#slcMatGroupFrom").click(function(){
		var str = window.showModalDialog('<s:url namespace="/pr/group" action="init"/>');
		if(typeof(str) != 'undefined' && str.matGroupNum!=null)
		{
			$("#from")[0].value = $.trim(str.matGroupNum);
			$("#fromDescrption")[0].value = $.trim(str.matGroupDescZH);
		}
	});
	$("#slcMatGroupTo").click(function(){
		var str = window.showModalDialog('<s:url namespace="/pr/group" action="init"/>');
		if(typeof(str) != 'undefined' && str.matGroupNum!=null)
		{
			$("#to")[0].value = $.trim(str.matGroupNum);
			$("#toDescrption")[0].value= $.trim(str.matGroupDescZH);
		}
	});
	
	//注册选择物料/设备按钮事件
	$("#slcMatFrom").click(function(){							
		var str = window.showModalDialog('<s:url namespace="/pr/product" action="init"/>');
		if(typeof(str) != 'undefined' && str.matNum!=null)
		{
			$("#from")[0].value = $.trim(str.matNum);
			$("#fromDescrption")[0].value = $.trim(str.groupDescZH);
		}
	});
	$("#slcMatTo").click(function(){
		var str = window.showModalDialog('<s:url namespace="/pr/product" action="init"/>');
		if(typeof(str) != 'undefined' && str.matNum!=null)
		{
			$("#to")[0].value = $.trim(str.matNum);
			$("#toDescrption")[0].value= $.trim(str.groupDescZH);
		}
	});
	
	//退出
	$("#cancel").click(function(){
		if($("#buLevel").val()!=0){
			location.href='<s:url namespace="/br" action="listleveltwo"/>'
		}else{
			location.href='<s:url namespace="/br" action="catalog-list"/>';
		}
	});

	//类别、物料号码单选按钮点击事件
	$("input[name='centralCatalog.sortOrMaterial']").click(function(){
		if(this.value == "Sort")
		{
			$("#slcMatGroupFrom").show();
			$("#slcMatGroupTo").show();
			$("#slcMatFrom").hide();
			$("#slcMatTo").hide();
		}else
		{
			$("#slcMatGroupFrom").hide();
			$("#slcMatGroupTo").hide();
			$("#slcMatFrom").show();
			$("#slcMatTo").show();
		}
	});

	$("#add").validate({
		rules: {
			"centralCatalog.from":"required"
		}
	});
	
	$("#savebtn").click(function(){
		//如果为二级的集采目录，监测是否选择了单位
		if($("#buLevel").val()!=0 && $("#buIds").val().trim()==""){
			alert("请选择适用的业务单位！");
			return false;
		}
									
		if($("#add").valid())
		{
			//如果to不为空则必须大于from
			if($("#to").val()!="")
			{
				if($("#from").val()>$("#to").val())
				{
					alert('<s:text name="com.cnooc.domain.catalog.add.panduanmessage" />');
					return;
				}
			}
			$("#add").submit();
		}
	});

	$("#buNames").click(function(){
		$("#nodeTrees").css("left",window.event.clientX);
		$("#nodeTrees").css("top",window.event.clientY);
		$("#nodeTrees").css("display","block");
	});

	$("#but_tree_con").click(function(){
		var nodes = $("#nodeTrees").tree("getChecked");
		var names = '';
		var ids = '';
		for(var i=0; i<nodes.length; i++){
			if (names != '') 
				names += ',';
			names += nodes[i].text;
			if (ids != '') 
				ids += ',';
			ids += nodes[i].id;			
		}
		$("#buNames").attr("value",names);
		$("#buIds").attr("value",ids);
		$("#nodeTrees").css("display","none");
	});

	$("#but_cancel").click(function(){
		$("#nodeTrees").css("display","none");
	});	

	if($("#buLevel").val()!=0){
		var butrees = $.parseJSON($("#buInJSON").val());
		if(butrees!=null){
			$("#butree").tree({
				data:butrees,
				checkbox:true,
				cascadeCheck:false
			});	
		}	
	}
});
</script>
</head>
<body>
<div class="editdiv">
	<s:form id="add" name="add" theme="simple" action="catalog-add" namespace="/br">
		<s:hidden name="centralCatalog.deleted" value="0"/>
		<s:hidden name="buLevel" id="buLevel"/>
		<s:hidden name="buInJSON" id="buInJSON"/>
		<s:hidden name="buId" id="buId"/>
		<table class="tblContent" width="100%" cellpadding="0">
			<colgroup>
    			<col style="width:20%;"/>
     			<col style="width:80%;"/>
   			</colgroup>
			<tr>
				<td class="TdRight" style="height:24px;" colspan="2">
					<s:text name="com.cnooc.domain.catalog.add.zhushi" />
					<SPAN style="color: Red">*</SPAN>
					<s:text name="com.cnooc.domain.catalog.add.itemnecessary"></s:text>
				</td>
			</tr>
			<tr>
				<th class="tdTitle" style="border:0;">
					<s:text name="com.cnooc.domain.catalog.add.formtitle" />
				</th>
				<td class="TdRight">
					<s:radio id="radio" name="centralCatalog.sortOrMaterial" value="'Sort'" list="#{'Sort':getText('com.cnooc.domain.catalog.add.sort'),'Material':getText('com.cnooc.domain.catalog.add.materialnum')}"></s:radio>
				</td>
			</tr>
			<tr>
				<th class="tdTitle" style="border:0;">&nbsp;</th>
				<td class="TdRight">
					<s:text name="com.cnooc.domain.catalog.add.from" /><SPAN style="color: Red">*</SPAN>
					<s:textfield name="centralCatalog.from" id="from"></s:textfield>
					<button id="slcMatGroupFrom"><s:text name="com.cnooc.domain.catalog.add.select" /></button>
					<button style="display: none;" id="slcMatFrom"><s:text name="com.cnooc.domain.catalog.add.select" /></button>
					<s:hidden name="centralCatalog.fromDescrption" id="fromDescrption"></s:hidden>
				</td>
			</tr>
			<tr>
				<th class="tdTitle" style="border-top:0;">&nbsp;</th>
				<td class="TdRight">
					<s:text name="com.cnooc.domain.catalog.add.to" /><SPAN style="color: Red">&nbsp;&nbsp;</SPAN>
					<s:textfield name="centralCatalog.to" id="to"></s:textfield>
					<button id="slcMatGroupTo"><s:text name="com.cnooc.domain.catalog.add.select" /></button>
					<button style="display: none;" id="slcMatTo"><s:text name="com.cnooc.domain.catalog.add.select" /></button>
					<s:hidden name="centralCatalog.toDescrption" id="toDescrption"></s:hidden>
				</td>
			</tr>
			<s:if test="%{buLevel != 0}">
				<tr>
					<th class="tdTitle">适用的业务单位</th>
					<td class="TdRight" style="padding-left:20px;">
						<s:textfield name="buNames" id="buNames"  value=""/>
						<s:hidden name="buIds" id="buIds"/>
					</td>
				</tr>
			</s:if>
			<tr>
				<td colspan="2" class="tdTitle" style="text-align:center;">
					<input type="button" value="<s:text name="com.cnooc.domain.catalog.add.save" />" id="savebtn">
					<input type="button" value="<s:text name="com.cnooc.domain.catalog.add.cancel" />" id="cancel">
				</td>
			</tr>
		</table>
	</s:form>
	<div id="nodeTrees" class="editdiv" style="border:1px solid #cccccc;display:none;left:0px;top:0px;z-index:1000;position:absolute;">
		<ul id="butree" style="width:100%;"></ul>
		<div style="text-align:center;">
			<button type="button" id="but_tree_con">确定</button>
			<button type="button" id="but_cancel">取消</button>
		</div>
	</div>
</div>
</body>
</html>