<%@ page contentType="text/html;charset=GBK"%>

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
   				 <html:hidden name="rootId" property="rootId" value="<%=rootId %>" />
  
 				 <tr >
                    <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.OLDORGANID")%>：</td>
                    <td class="tdRight">
                    <html:hidden name="oldorganid" property="oldorganid" write="false" />
                    
                    <html:text name="oldorganName" value="" size="30" readonly="true" />
  					<html:text name="note3" property="note3" style="display:none;" size="35"  maxlength="30" />                        
  
                    <span id="oldorganSpan" ></span>
                    <img src="<%=imgHelp%>" onclick="selectOldOrgan()" style="cursor:hand;" border="0">
                    <span id="oldorganSpan2" class="xinghaoCss">*</span>
                    </td>
                    </tr> 
					                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.AGENTORGANID")%>：</td>
                    <td class="tdRight">
                    <html:hidden name="agentorganid" property="agentorganid" write="false" />
                    <html:text name="agentorganName" value="" size="30" readonly="true" />
  <html:text name="note" property="note" style="display:none;" size="35"  maxlength="30" />                        
  
                    <span id="agentorganSpan" ></span>
                    <img src="<%=imgHelp%>" onclick="selectAgentOrgan()" style="cursor:hand;" border="0">
                    <span id="agentorganSpan2" class="xinghaoCss">*</span>
                    </td>
                    </tr>    
                    <!-- //                
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.TYPE")%>：</td>
                    <td class="tdRight">
                    
                    <html:select name="type" property="type" onchange="typeChanged();" >
                    <html:option value="1">单个流程</html:option>
                    <html:option value="2">流程类型</html:option>
                    </html:select>
                    </td>
                    </tr>   
                     -->   
                     <html:hidden name="type" value="1"></html:hidden> 
                      <!-- //             
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.DATANAME")%>：</td>
                    <td class="tdRight">
                    <html:hidden name="dataid" property="dataid"  write="false" />
                   
                    <html:text name="dataname" property="dataname" size="30" readonly="true" />
                    <span id="dataSpan" ></span>
                    <img src="<%=imgHelp%>" onclick="selectData()" style="cursor:hand;" border="0">
                    <span id="dataSpan2" class="xinghaoCss">*</span>
                    
                    </td>
                    </tr>                    
					  -->     
					    <html:hidden name="dataid" value="<%=procDefId %>"></html:hidden> 
					             
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.DESCRIPTION")%>：</td>
                    <td class="tdRight">
                    <html:textarea name="description" property="description" rows="4" cols="30"  />
                    
                    </td>
                    </tr>
		<tr>	                   
                    
                    <!-- 代理开始时间 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.TIME")%>： 	</td>
                    <td class="tdRight"><date:date name="time"  divname="time1"  hastime="true" property="time"  sourceFormat="yyyy-MM-dd HH:mm"  /> 
                    </td>
<!-- 代理结束时间 -->
		</tr>
		<tr>
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.ENDTIME")%>： 	</td>
                    <td class="tdRight"> 
                    <date:date name="endtime" property="endtime" divname="endtime1" hastime="true" sourceFormat="yyyy-MM-dd HH:mm"  /> 
                     </td>
        </tr>           

<!-- 备注 -->
                               
  </table>
  
 				 <html:hidden name="flag" property="flag" value="1" />
	                        
  
</div>
