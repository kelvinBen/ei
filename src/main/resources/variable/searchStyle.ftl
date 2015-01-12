<#--表单数据查询模版文件-->
<#list searchTabList as tabLv>
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
	<tr>
		<td>
		<table>
			<tr>
			<#list subLv.subentity as sub>
				<td>${sub.title}</td>
			</#list>
			</tr>
			<tr>
			<#list subLv.subentity as sub>
				<td>${sub.text}</td>
			</#list>
			</tr>
		</table>
		</td>
	</tr>
	</#list>
</table>
</#list>