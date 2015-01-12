<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
 <link rel="stylesheet" type="text/css" href="skins/sp/css/loading.css">
<div id="loader_container" class="loader_container"
		style="position: absolute; left: 0px; top: 203px">
		<div id="loader" class="loader">
			<div 
				style="padding: 0px 0px 2px 10px; font-family: Verdana; font-size: 11px; color: #333;"
				nowrap="nowrap" height="40">
				程序正在运行.请稍候
			</div>
			<div id="loader_bg" class="loader_bg">
				<div id="progress" class="progress">
				</div>
			</div>
		</div>
	</div>

<html:form name="thform" action="">

	<html:hidden name="i$ZTEST$CODENUM" property="i$ZTEST$CODENUM" />

	<table width="100%" cellpadding="0" class="tblContent">

		<tr>
			<td class="tdTitle">
				键：
			</td>
			<td class="tdRight">
				<html:text name="i$ZTEST$ID" property="i$ZTEST$ID" size="35"
					maxlength="10" />
			</td>
		</tr>
		<tr>
			<td class="tdTitle">
				值：
			</td>

			<td class="tdRight">
				<html:text name="i$ZTEST$VALUE" property="i$ZTEST$VALUE" size="35"
					maxlength="10" />
			</td>
		</tr>

	</table>
</html:form>