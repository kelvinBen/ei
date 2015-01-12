<#--无表单模版时所用的显示模版-->
<#list noTemplateFieldData as tabLv>
<table style="width: 100%">
	<tr>
		<td style="background-color: #c0c0c0">${tabLv.title}</td>
	</tr>
	
	<tr>
		<td>
		<table>
		<#list tabLv.mostlyData as mostlyLv>
			<tr>
				<td>${mostlyLv.title}</td>
				<td>${mostlyLv.text}</td>
			</tr>
		</#list>
		</table>
		</td>
	</tr>
	
	<#if tabLv.issub>
	<tr>
		<td><hr></td>
	</tr>
	</#if>
	
	<#list tabLv.subentitys as subLv>
	<tr>
		<td>${subLv.title}</td>
	</tr>
	<#if subLv.state>
	<tr>
		<td>
			<div align="right"><button onclick='addRow("${subLv.subName}")' >增加行</button>&nbsp;<button onclick='delRow("${subLv.subName}")' >删除行</button></div>
		</td>
	</tr>
	</#if>
	<tr>
		<td>
		<table id="${subLv.subName}" cellspacing="0" border="1" bgcolor="#ffffff" style="border-left:;border-right:;border-top:;border-bottom:;" width="100%"  class="subtabcss" onclick="doTabSelect('${subLv.subName}')">
			<tr  class="tabtoucss" >
			<#list subLv.subentity as sub>
				<td style="border-color:;">${sub.title}</td>
			</#list>
			</tr>
			<tr  style="display:none">
			<#list subLv.subentity as sub>
				<td style="border-color:;">${sub.text}</td>
			</#list>
			</tr>
			
			<#list subLv.value as subOneValues>
			<tr style="">
				<#list subOneValues as subOneValue>
				<td style="border-color:;">${subOneValue}</td>
				</#list>
			</tr>
			</#list>
			<tr>
			<#list subLv.subentity as sub>
				<td style="border-color:;"></td>
			</#list>
			</tr>
			<script language="javascript">rename("${subLv.subName}");countsum("${subLv.subName}");</script>
		</table>
		</td>
	</tr>
	</#list>
</table>
</#list>