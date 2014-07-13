<#--有表单模版时的页面FORM模版-->
<div class="btnareaCss">${menu?if_exists}</div><br>	  
<div align="center">
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent">  
  					<tr>
  						<td>
		  					<#if isLocked?if_exists>
							<table border="0" width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td><font color="#FF0000" size="4"><b>${lockUserName?if_exists}</b>已将该表单锁定</font></td>
								</tr>
							</table>
							</#if>
  						</td>
  					</tr>
  					<!--表单数据-->
					<tr>
						<td style="vertical-align: top"><div class="formStyleClass">${text?if_exists}</div></td>
					</tr>
  </table>
</div>  
