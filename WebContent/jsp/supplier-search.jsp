<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商检索</title>
<base target="_self"/>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	.tdCell td{border-color: black;}
	.tdCell {border-color: black;}
	.hrefButton{cursor: hand;color: blue;text-decoration: underline;font-weight: bold;}
	.tdContent{width:600px;}
	.tdTitle{width:150px;}
	.locker{
		width:100%;height:100%;display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=75);
	}
	.showUI{
		display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=100);
	}
</style>
<script type="text/javascript">
    $(document).ready(function(){
    	initPage();
    	
    	
    	$("[name='btnAdd']").click(function(event){
    	    var result = ($.trim($("#supResults").val()) == "" ? [] : $.parseJSON($("#supResults").val()));
	   		if (result.length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			jQuery.ajax({
	            url: '<s:url namespace="/supplier" action="addmyproduct" />' ,   	//提交的页面
	            data: $("#list").serialize(), 		//从表单中获取数据
	            type: "POST",                   	//设置请求类型为"POST"，默认为"GET"
	            beforeSend: function(){          	//设置表单提交前方法
					$('.locker').css('display', 'block');
					showWaitingLayer();
	            },
	            error: function(request) {          //设置表单提交出错
	                alert('远程校验服务请求错误');
	            },
	            success: function(data) {			//设置表单提交完成使用方法
	            	$('.locker').css('display', 'none');
	            	$("#waitingInfo").css('display', 'none');
	            	var insertItems = $.parseJSON(data);
	            	for(var i=0; i<insertItems.length; i++){
	            	    for(var j=0; j<result.length; j++){
	            	       if(insertItems[i]==result[j].id){
	            	           var strTable = "<tr class='tdCell'>";
	            	               strTable+= "  <td>"+result[j].externalId+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].supplierName+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].supplierGrade+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].supplierType+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].supplierProperty+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].serveCompany+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].repositoryLevel+"&nbsp;</td>";
	            	               strTable+= "  <td>"+result[j].city+"&nbsp;</td>";
	            	               strTable+= "  <td><input name='myitems' id='myid"+result[j].id+"' type='checkbox' value='"+result[j].id+"'/></td>";
	            	               strTable+= "</tr>";
	            	           $("#myProductTable").append(strTable);
	            	       }
	            	    }
	            	}
	            }
	        });
	        
	        function showWaitingLayer(){
				var width=200,height=100; // 单位为px
				var left = (document.body.clientWidth - width)/2;
				var top = (document.body.clientHeight - height) / 2;
				$("#waitingInfo").css('left',left+'px');
				$("#waitingInfo").css('top',top+'px');
				$("#waitingInfo").css('width',width+'px');
				$("#waitingInfo").css('height',height+'px');
				$("#waitingInfo").css('display', 'block');
			}
			
    	});
    	
    	
    	$("[name='btnDel']").click(function(event){
    	     var selectItems = $(':checkbox[name=myitems][checked]');
	   		if (selectItems.length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			jQuery.ajax({
	            url: '<s:url namespace="/supplier" action="delmyproduct" />' ,   	//提交的页面
	            data: $("#list").serialize(), 		//从表单中获取数据
	            type: "POST",                   	//设置请求类型为"POST"，默认为"GET"
	            beforeSend: function(){          	//设置表单提交前方法
					$('.locker').css('display', 'block');
					showWaitingLayer();
	            },
	            error: function(request) {          //设置表单提交出错
	                alert('远程校验服务请求错误');
	            },
	            success: function(data) {			//设置表单提交完成使用方法
	            	$('.locker').css('display', 'none');
	            	$("#waitingInfo").css('display', 'none');
	            	var delItems = $.parseJSON(data);
	            	for(var i=0; i<delItems.length; i++){
	            	   var delId ="#myid"+delItems[i];
	            	   if($(delId)!=null){
	            	       $(delId).parent("td").parent("tr").remove();
	            	   }
	            	}
	            }
	        });
	        
	        function showWaitingLayer(){
				var width=200,height=100; // 单位为px
				var left = (document.body.clientWidth - width)/2;
				var top = (document.body.clientHeight - height) / 2;
				$("#waitingInfo").css('left',left+'px');
				$("#waitingInfo").css('top',top+'px');
				$("#waitingInfo").css('width',width+'px');
				$("#waitingInfo").css('height',height+'px');
				$("#waitingInfo").css('display', 'block');
			}
    	 
    	});
    	
		$("[name='productSelectButton']").click(function(event){
	   		var result = ($.trim($("#supResults").val()) == "" ? [] : $.parseJSON($("#supResults").val()));
	   			
	   		if (result.length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
		    window.returnValue = result;
		    window.close();
		});
		
		$(":checkbox").click(function(){
			var result = ($.trim($("#supResults").val()) == "" ? [] : $.parseJSON($("#supResults").val()));
			
			var sup_id = $(this).val(); //供应商ID
			var arr = [];
			$.each(result,function(i,obj){
				if(obj.id != sup_id){
					arr[arr.length] = obj;
				}
			});
			if(!$(this).attr("checked")){
				$("#supResults").val($.toJSON(arr));
				return;
			}
			
			var i = result.length;
			var items = $(this).parent("td").parent("tr").children("td");
			result[i] = {};
			result[i].id = $(this).val(); //供应商系统编号
			result[i].externalId= $.trim(items[0].innerText); //供应商外部编号
			result[i].supplierName= $.trim(items[1].innerText); //供应商名称
			result[i].supplierGrade= $.trim(items[2].innerText); //供应商级别
			result[i].supplierType= $.trim(items[3].innerText); //供应商类别
			result[i].supplierProperty= $.trim(items[4].innerText); //供应商属性
			result[i].serveCompany= $.trim(items[5].innerText); //所服务的公司级别
			result[i].repositoryLevel= $.trim(items[6].innerText); //供应商库级
			result[i].city= $.trim(items[7].innerText); //城市
			
			$("#supResults").val($.toJSON(result));
		});

 		$("[name^='sup2r']").click(function(){
 			var ctrlName = $(this).attr("name").replace("sup2r","sup");
			$("#"+ctrlName+"0 option:selected").each(function(){
 				$("#"+ctrlName+"1").append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option>");
 				$(this).remove();
 			});
 	 	});
		$("[name^='sup2l']").click(function(){
			var ctrlName = $(this).attr("name").replace("sup2l","sup");
			$("#"+ctrlName+"1 option:selected").each(function(){
 				$("#"+ctrlName+"0").append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option>");
 				$(this).remove();
 			});
 	 	});

		$("[name='btnQuery']").click(function(){
			//供应商等级
			var supLevel = new String();
			$("#supLevel1 option").each(function(){
				supLevel += $(this).val()+";";
			});
			$("[name='supplier.supplierGrade']").val(supLevel);
			//供应商类别
			var supType = new String();
			$("#supType1 option").each(function(){
				supType += $(this).val()+";";
			});
			$("[name='supplier.supplierType']").val(supType);
			//供应商属性
			var supProperty = new String();
			$("#supProperty1 option").each(function(){
				supProperty += $(this).val()+";";
			});
			$("[name='supplier.supplierProperty']").val(supProperty);
			//合作单位
			var supServeCompany = new String();
			$("#supServeCompany1 option").each(function(){
				supServeCompany += $(this).val()+";";
			});
			$("[name='supplier.serveCompany']").val(supServeCompany);
			//供应商库级
			var supRepositoryLevel = new String();
			$("#supRepositoryLevel1 option").each(function(){
				supRepositoryLevel += $(this).val()+";";
			});
			$("[name='supplier.repositoryLevel']").val(supRepositoryLevel);

			$("#list").submit();
 	 	});
 	 	
 	 	$("#btnLinks").click(function(){
			var result = window.showModalDialog('<s:url namespace="/pr/group" action="init"/>'," ","dialogWidth:650px; dialogHeight:1000px;status:0;help:0");
			if(result != null){
				$("[name='supplier.typeLinks']").attr("value",result.matGroupNum);
			}
		});

		function setCtrlStatus(ctrlName,showCtrl){
			if($.trim($("[name='"+ctrlName+"']").val()).length>0){
				var supArray = $("[name='"+ctrlName+"']").val().replace(/;$/,"").split(";");
	 	 		for(var i=0;i<supArray.length;i++){
	 	 			$("#"+showCtrl+"0").val(supArray[i]);
	 	 			var _opt = $("#"+showCtrl+"0 option:selected");
	 	 			$("#"+showCtrl+"1").append("<option value='"+_opt.val()+"'>"+_opt.text()+"</option>");
	 	 			_opt.remove();
	 	 	 	}
			}
		}
		
 	 	function initCtrl(){
 	 	 	setCtrlStatus("supplier.supplierGrade","supLevel"); //供应商级别
 	 	 	setCtrlStatus("supplier.supplierType","supType"); //供应商类别
 	 	 	setCtrlStatus("supplier.supplierProperty","supProperty"); //供应商属性
 	 	 	setCtrlStatus("supplier.serveCompany","supServeCompany"); //合作单位
 	 	 	setCtrlStatus("supplier.repositoryLevel","supRepositoryLevel"); //供应商库级
 	 	 	
 	 	 	var result = ($.trim($("#supResults").val()) == "" ? [] : $.parseJSON($("#supResults").val()));
			$.each(result,function(i,obj){
				$("#id"+obj.id).attr("checked",true);
			});
 	 	 	
 	 	}

 	 	initCtrl(); //初始化控件状态
    }); 
</script>
</head>
<body id="body_dialog">
<s:form id="list" namespace="/supplier" action="search" method="post" theme="simple">
<DIV class="locker"></DIV>
<DIV id="waitingInfo" class="showUI">
	<img src="<s:url value="/images/loading.gif"/>"> &nbsp;正在验证请稍后……
</DIV>

<div class="easyui-tabs" fit="true" plain="true" style="height:600;width:800;">
    <div id="print_con" style="font-size:14px;" title="供应商查询" style="padding:10px;">
	<table border="1" class="tblContent" width="100%">
      <tr class="tdTitle" style="font-weight: bold;">
      	<td colspan="2">基本资料搜索</td>
      </tr>
  	  <tr>
        <td class="tdTitle" style="font-weight: bold;">供应商外部编号</td>
        <td class="tdContent"><s:textfield name="supplier.externalCode"/></td>
      </tr>
  	  <tr>
        <td class="tdTitle" style="font-weight: bold;">供应商名称</td>
        <td><s:textfield name="supplier.companyName"/></td>
      </tr>
  	  <tr>
        <td class="tdTitle" style="font-weight: bold;">城市 </td>
        <td><s:textfield name="supplier.city"/></td>
      </tr> 
      <tr class="tdTitle" style="font-weight: bold;">
      	<td colspan="2">分类信息搜索</td>
      </tr>
      <tr>
        <td class="tdTitle" style="font-weight: bold;">供应商级别</td>
        <td>
        	<table>
        		<tr>
        			<td>
        				<select id="supLevel0" multiple="multiple" style="width: 230px;height: 100px;">
			        		<option value="投标">投标供应商</option>
			        		<option value="一般">一般供应商</option>
			        		<option value="优先">优先供应商</option>
			        		<option value="核心">核心供应商</option>
			        		<option value="战略">战略供应商</option>
			        	</select>
        			</td>
        			<td>
        				<div><a name="sup2rLevel" class="hrefButton">&gt;&gt;</a></div>
        				<br/>
        				<div><a name="sup2lLevel" class="hrefButton">&lt;&lt;</a></div>
        			</td>
        			<td>
        				<select id="supLevel1" multiple="multiple" style="width: 230px;height: 100px;"></select>
        			</td>
        		</tr>
        	</table>
        	<s:hidden name="supplier.supplierGrade"></s:hidden>
        </td>
      </tr>
      <tr>
        <td class="tdTitle" style="font-weight: bold;">供应商类别</td>
        <td>
        	<table>
        		<tr>
        			<td>
        				<select id="supType0" multiple="multiple" style="width: 230px;height: 40px;">
			        		<option value="服务类">服务类</option>
			        		<option value="物资类">物资类</option>
			        	</select>
        			</td>
        			<td>
        				<div><a name="sup2rType" class="hrefButton">&gt;&gt;</a></div>
        				<br/>
        				<div><a name="sup2lType" class="hrefButton">&lt;&lt;</a></div>
        			</td>
        			<td>
        				<select id="supType1" multiple="multiple" style="width: 230px;height: 40px;"></select>
        			</td>
        		</tr>
        	</table>
        	<s:hidden name="supplier.supplierType"></s:hidden>
        </td>
      </tr>
      <tr>
        <td class="tdTitle" style="font-weight: bold;">供应商属性</td>
        <td>
        	<table>
        		<tr>
        			<td>
        				<select id="supProperty0" multiple="multiple" style="width: 230px;height: 62px;">
			        		<option value="代理商">代理商</option>
			        		<option value="制造商">制造商</option>
			        		<option value="集成商">集成商</option>
							<option value="服务商">服务商</option>
			        	</select>
        			</td>
        			<td>
        				<div><a name="sup2rProperty" class="hrefButton">&gt;&gt;</a></div>
        				<br/>
        				<div><a name="sup2lProperty" class="hrefButton">&lt;&lt;</a></div>
        			</td>
        			<td>
        				<select id="supProperty1" multiple="multiple" style="width: 230px;height: 62px;"></select>
        			</td>
        		</tr>
        	</table>
        	<s:hidden name="supplier.supplierProperty"></s:hidden>
        </td>
      </tr>
      <tr>
        <td class="tdTitle" style="font-weight: bold;">所服务的公司级别</td>
        <td>
        	<table>
        		<tr>
        			<td>
        				<select id="supServeCompany0" multiple="multiple" style="width: 230px;height: 80px;">
			        		<option value="中国海洋石油总公司">中国海洋石油总公司</option>
			        		<option value="中海石油(中国)有限公司天津分公司">中海石油(中国)有限公司天津分公司</option>
			        		<option value="中海石油(中国)有限公司湛江分公司">中海石油(中国)有限公司湛江分公司</option>
			        		<option value="中海石油(中国)有限公司深圳分公司">中海石油(中国)有限公司深圳分公司</option>
			        		<option value="中海石油(中国)有限公司上海分公司">中海石油(中国)有限公司上海分公司</option>
			        	</select>
        			</td>
        			<td>
        				<div><a name="sup2rServeCompany" class="hrefButton">&gt;&gt;</a></div>
        				<br/>
        				<div><a name="sup2lServeCompany" class="hrefButton">&lt;&lt;</a></div>
        			</td>
        			<td>
        				<select id="supServeCompany1" multiple="multiple" style="width: 230px;height: 80px;"></select>
        			</td>
        		</tr>
        	</table>
        	<s:hidden name="supplier.serveCompany"></s:hidden>
        </td>
      </tr>
      <tr>
        <td class="tdTitle" style="font-weight: bold;">供应商库级</td>
        <td>
        	<table>
        		<tr>
        			<td>
        				<select id="supRepositoryLevel0" multiple="multiple" style="width: 230px;height: 50px;">
			        		<option value="一级库">一级库</option>
			        		<option value="二级库">二级库</option>
			        	</select>
        			</td>
        			<td>
        				<div><a name="sup2rRepositoryLevel" class="hrefButton">&gt;&gt;</a></div>
        				<br/>
        				<div><a name="sup2lRepositoryLevel" class="hrefButton">&lt;&lt;</a></div>
        				<br/>
        			</td>
        			<td>
        				<select id="supRepositoryLevel1" multiple="multiple" style="width: 230px;height: 50px;"></select>
        			</td>
        		</tr>
        	</table>
        	<s:hidden name="supplier.repositoryLevel"></s:hidden>
        </td>
      </tr>
      <tr>
        <td class="tdTitle" style="font-weight: bold;">类别</td>
        <td>
        	<s:textfield name="supplier.typeLinks" /><input type="button" id="btnLinks" value="选择"/>
        </td>
      </tr>
	</table>
	<div>
  		<input name="btnQuery" type="button" value="查询" />
      		&nbsp;&nbsp;
      	<button name='productSelectButton'>选择</button>
      	    &nbsp;&nbsp;
      	<input name="btnAdd" type="button" value="添加至我的供应商" />   
    </div>
	<table border="1" class="tblContent tdCell">
		<tr class="tdTitle" style="font-weight: bold;">
			<td>供应商外部编号</td>
			<td>供应商名称</td>
			<td>供应商级别</td>
			<td>供应商类别</td>
			<td>供应商属性</td>
			<td>所服务的公司级别</td>
			<td>供应商库级</td>
			<td>城市</td>
			<td width="5%">选择</td>
		</tr>
		<s:iterator value="#request.suplist" var="supplier">
		<tr class="tdCell">
			<td><s:property value="#supplier.externalCode" />&nbsp;</td>
			<td><s:property value="#supplier.companyName" />&nbsp;</td>
			<td><s:property value="#supplier.supplierGrade" />&nbsp;</td>
			<td><s:property value="#supplier.supplierType" />&nbsp;</td>
			<td><s:property value="#supplier.supplierProperty" />&nbsp;</td>
			<td><s:property value="#supplier.serveCompany" />&nbsp;</td>
			<td><s:property value="#supplier.repositoryLevel" />&nbsp;</td>
			<td><s:property value="#supplier.city" />&nbsp;</td>
			<td><input id="id<s:property value="#supplier.id" />" type="checkbox" value="<s:property value="#supplier.id" />" name="items"></td>
		</tr>
		</s:iterator>
	</table>
  
   
  	<div id="pageContainer"></div>
  	<div>
  		<input name="btnQuery" type="button" value="查询" />
      		&nbsp;&nbsp;
      	<button name='productSelectButton'>选择</button>
      	    &nbsp;&nbsp;
      	<input name="btnAdd" type="button" value="添加至我的供应商" />   
    </div>
	<%@include file="/WEB-INF/jsp/page.jsp"%>
	<input type="hidden" id="pageURL" value='<s:url namespace="/supplier" action="search"/>'/>
	<s:hidden name="supResults" id="supResults"></s:hidden>
	
	 </div>
	 <div title="我的供应商" style="padding:10px;">
	 
	 <div>
      	<input name="productSelectButton" type="button" value="选择" />
      	    &nbsp;&nbsp;
      	<input name="btnDel" type="button" value="从我的供应商列表删除" />
     </div>
    
	 <table border="1" class="tblContent tdCell" id="myProductTable">
		<tr class="tdTitle" style="font-weight: bold;">
			<td>供应商外部编号</td>
			<td>供应商名称</td>
			<td>供应商级别</td>
			<td>供应商类别</td>
			<td>供应商属性</td>
			<td>所服务的公司级别</td>
			<td>供应商库级</td>
			<td>城市</td>
			<td width="5%">选择</td>
		</tr>
		<s:iterator value="#request.mySuplist" var="mySuplist">
		<tr class="tdCell">
			<td><s:property value="#mySuplist.externalCode" />&nbsp;</td>
			<td><s:property value="#mySuplist.companyName" />&nbsp;</td>
			<td><s:property value="#mySuplist.supplierGrade" />&nbsp;</td>
			<td><s:property value="#mySuplist.supplierType" />&nbsp;</td>
			<td><s:property value="#mySuplist.supplierProperty" />&nbsp;</td>
			<td><s:property value="#mySuplist.serveCompany" />&nbsp;</td>
			<td><s:property value="#mySuplist.repositoryLevel" />&nbsp;</td>
			<td><s:property value="#mySuplist.city" />&nbsp;</td>
			<td><input id="myid<s:property value="#mySuplist.id" />" type="checkbox" value="<s:property value="#mySuplist.id" />" name="myitems"></td>
		</tr>
		</s:iterator>
	</table>
	<div>
      	<input name="productSelectButton" type="button" value="选择" />
      	    &nbsp;&nbsp;
      	<input name="btnDel" type="button" value="从我的供应商列表删除" />
     </div>
     
	 </div>
	 </div>
  </s:form>
</body>
</html>
