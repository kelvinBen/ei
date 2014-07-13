<TEXTAREA id="gridinfo_template" style="display:none;">
  <div id="${GRIDINFO.name}" hassum="${GRIDINFO.hasSum}"  hasleft="${GRIDINFO.hasLeft}" style="overflow:hidden;width:100%; height:${GRIDINFO.height};" class="divAllcss">
<div style="overflow:hidden;width:100%;height:${TabHead.rows.length*22};position:absolute;z-index:1"><div style="overflow:hidden;width:100%;height:${TabHead.rows.length*22};position:absolute;z-index:1" class="divToucss"><table border=0 width="100%" height=${TabHead.rows.length*22} cellspacing=0 cellpadding=0><colgroup><col width="30px">
{for col in TabHead.rows[TabHead.rows.length-1].cols}
 {if col.text!=null}
<col  width="${col.width}" style="${col.style}">
{/if}
{/for}
<col></colgroup>
 {for r in TabHead.rows}
 <tr><td nowrap width="30px"></td>
 {for c in r.cols}
 {if c.text!=null}
<td nowrap colspan="${c.colspan}"><span unselectable=on sortName="${c.sortName}" sortType="${c.sortType}" cansort="${c.canSort}" enableCheckAll="${c.enableCheckAll}" format="${c.sortType}">${c.text}<label disabled style="display:none">6</label></span></td>
{else}
<td nowrap style="display:none;"></td>
 {/if}
{/for}
<td nowrap style="display:blank"><span unselectable=on cansort="true" format=""></span></td>
</tr>
{/for}
</table><iframe height="100%" width="100%" frameborder="0" style="top:-1;left-1;position:absolute;z-index:-1;" scrolling=no></iframe></div><div style="width:31px;height:${TabHead.rows.length*22};position:absolute;top:0;left:0;z-index:2;" class="divToucss"><table width="100%" height="100%" border=0 cellspacing=0  cellpadding=0><tr><td nowrap width="30px"><span></span></td></tr></table></div></div>
<div style="overflow:auto;width:100%;height:${GRIDINFO.height}px;position:absolute;padding-top:${(TabHead.rows.length-1)*23-1};" class="divTiSkin">
<table border=0 width="100%"  cellspacing=0 cellpadding=0>
{var i=0;}
{var hasDate=false;}
{for titr in TabTi.rows}
<tr><td width="30px" class="leftTd"><span class=leftSpan>${i++}</span></td>
{for titd in titr.cols}
{if titd.coltype=="text"}
<td nowrap width="${titd.width}" index="${titd.index}">
<input type="text" id="${titd.id}" name="${titd.name}" value="${titd.value}" style="${titd.style}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
</td>
{elseif  titd.coltype=="imagetext"}
<td nowrap width="${titd.width}" index="${titd.index}">
<input type="text" style="width:70%;${titd.style}" id="${titd.id}" name="${titd.name}" value="${titd.value}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"><img src="${titd.imageurl}" style="cursor:hand;" border="0" onclick="${titd.imageclick}" ondbclick="${titd.imagedbclick}">
</td>
{elseif  titd.coltype=="date"}
{var hasDate=true;var hastime=titd.hastime;var hasecond=titd.hasecond;var year=titd.year;var month=titd.month;var day=titd.day;var hour=titd.hour;var minute=titd.minute;var second=titd.second;}
<td nowrap width="${titd.width}" index="${titd.index}">
<input type="text" style="width:70%;${titd.style}" id="${titd.id}" name="${titd.name}" value="${titd.value}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}" targetFormat="${titd.targetformat}" sourceFormat="${titd.sourceformat}"><button  class="date_button" onclick="${GRIDINFO.name}.showDate();"><img src="${titd.path}"></button>
</td>
{elseif  titd.coltype=="checkbox"}
<td nowrap width="${titd.width}" index="${titd.index}">
<input type="checkbox" id="${titd.id}" name="${titd.name}"  value="${titd.value}" ${titd.checked} style="${titd.style}" onclick="${titd.onclick};${GRIDINFO.name}.doclickingrid(this);" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
</td>
{elseif titd.coltype=="select"}
<td nowrap width="${titd.width}" index="${titd.index}">
<input type="text" style="width:100%;${titd.style}" value="${titd.value}" onfocus="${GRIDINFO.name}.doTextFocusInGrid(this);${titd.onfocus}">
<div class="selectColCss" style="margin:1px;width:100%; overflow:hidden;display:none"><select  id="${titd.id}" name="${titd.name}" style="margin-left:-3px;margin-top:-2px;margin-bottom:-2px;width:100%;" onblur="${GRIDINFO.name}.doSelBlurInGrid(this);${titd.onblur}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
{for opt in titd.options}
<option value="${opt.value}"{if opt.value==titd.value} selected{/if}>${opt.text}</option>
{/for}
</select></div></td>
{elseif titd.coltype=="index"}
<td nowrap width="${titd.width}" index="${titd.index}">
<input type="text" id="${titd.id}" name="${titd.name}" value="${i-1}" style="${titd.style}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"></td>
{elseif titd.coltype=="primarykey"}
<td nowrap style="display:none;" width="${titd.width}" index="${titd.index}">
<input type="text" style="display:none;" id="${titd.id}" name="${titd.name}" readonly value="${titd.value}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"></td>
{elseif titd.coltype=="hide"}
<td nowrap style="display:none;" width="${titd.width}" index="${titd.index}"><input type="text" style="display:none;" id="${titd.id}" name="${titd.name}" readonly value="${titd.value}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"></td>
{elseif titd.coltype=="delete"}
<td nowrap style="display:none;" width="${titd.width}" index="${titd.index}"><input type="text" style="display:none;" id="${titd.id}" name="${titd.name}" value="${titd.value}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"></td>
{elseif titd.coltype=="blank"}
<td nowrap width="${titd.width}" index="${titd.index}" style="${titd.style}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">&nbsp;</td>
{elseif titd.coltype=="label"}
<td nowrap width="${titd.width}" index="${titd.index}"><input type="hidden" name="${titd.name}" id="${titd.id}" value="${titd.value}"><input type="text" id="${titd.id}_TEXT" name="${titd.name}"+"_label" value="${titd.value}" style="${titd.style}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}" readonly></td>
{elseif titd.coltype=="searchCol"}
<td nowrap width="${titd.width}" index="${titd.index}"><input type="hidden" id="${titd.id}" name="${titd.name}" value="${titd.value}"><input type="text"  style="width:70%;${titd.style}" id="${titd.id}_TEXT" name="${titd.name}_TEXT" value="${titd.labelValue}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"><img src="${titd.imageurl}" style="cursor:hand;" border="0" onclick="${titd.imageclick}" ondbclick="${titd.imagedbclick}"></td>
{elseif titd.coltype=="fileCol"}
<td nowrap width="${titd.width}" index="${titd.index}">
{if titd.fileHtml!=null}
	${titd.fileHtml}
{elseif}
	<input type="file" id="${titd.id}" name="${titd.name}" value="${titd.value}" ${titd.fileOnchange} style="${titd.style}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}"><img src="${titd.imageurl}" style="cursor:hand;" border="0" onclick="${titd.imageclick}" ondbclick="${titd.imagedbclick}"></td>
{/if}
{/if}
{/for}
<td style="display:block;border-right:0;"><span></span></td></tr>
{/for}
</table><div style="overflow:hidden;width:100%;height:20px;position:absolute;"></div></div>

<div style="overflow:hidden;width:100%;height:21px;position:absolute;top:0"><div style="overflow:hidden;width:100%;height:21px;" class="divSumcss"><table border=0 width="100%" height=20 cellpadding=0 cellspacing=0>
{for sumtr in TabSum.rows}
<tr><td nowrap width="30px"></td>
{for sumcol in sumtr.cols}
{if sumcol.width!=null}
<td width="${sumcol.width}" nowrap style="${sumcol.style}" >
<span type="${sumcol.type}" unselectable=on format="${sumcol.format}" style="${sumcol.style}">${sumcol.text}</span>
</td>
{else}
<td nowrap style="display:none;"></td>
{/if}
{/for}
<td style="display:block;border-right:0;"><span></span></td></tr>
{/for}
</table><div style="overflow:hidden;width:100%;height:20px;position:absolute;"></div></div><div style="width:31px;position:absolute;top:0;left:0;z-index:2;height:21px;" class="divSumcss"><table width="100%" border=0  cellspacing=0  cellpadding=0><tr><td nowrap width="30px"><span>合计</span></td></tr></table></div></div>
<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="${TabTi.rows.length}">
{if hasDate}
<div  class="date" style="display:none;position:absolute;top:0;left:0;"> 
	<div> <table border="0" cellpadding="0" cellspacing="0" class="date_table">  <tr><td>  
		<div class="dateadjust" style="width:80px;"> 
			<div style="position:relative;left:47;top:2;z-index:2"> <button style="left:9;top:-1;height:10;" hideFocus="true" onclick="${GRIDINFO.name}._uper(this);${GRIDINFO.name}.changeYearAndMonth(this.parentElement.nextSibling.value);"  onmousedown="${GRIDINFO.name}._conti_uper(this);${GRIDINFO.name}.changeYearAndMonth(this.parentElement.nextSibling.value);" onmouseout="${GRIDINFO.name}._stop_inch();" onmouseup="${GRIDINFO.name}._stop_inch();">5</button> <button style="left:9;top: 8;height:10;" hideFocus="true" onclick="${GRIDINFO.name}._downer(this);${GRIDINFO.name}.changeYearAndMonth(this.parentElement.nextSibling.value);"  onmousedown="${GRIDINFO.name}._conti_downer(this);" onmouseout="${GRIDINFO.name}._stop_inch();" onmouseup="${GRIDINFO.name}._stop_inch();">6</button> 
			</div> 
			<input type="text" value="${year}" onblur="${GRIDINFO.name}.doYearBlur(this);" conf="1,1900,2100,"> 
			</div></td> <td> <span  class="month" style="height:19;left:3;"><select  size="1" onchange="${GRIDINFO.name}.changeYearAndMonth(null,this.options[this.selectedIndex].value)"> <option value="1" {if month=="1"}selected{/if}>一月</option> <option value="2" {if month=="2"}selected{/if}>二月</option> <option value="3" {if month=="3"}selected{/if}>三月</option> <option value="4" {if month=="4"}selected{/if}>四月</option> <option value="5" {if month=="5"}selected{/if}>五月</option> <option value="6" {if month=="6"}selected{/if}>六月</option> <option value="7" {if month=="7"}selected{/if}>七月</option> <option value="8" {if month=="8"}selected{/if}>八月</option> <option value="9" {if month=="9"}selected{/if}>九月</option> <option value="10" {if month=="10"}selected{/if}>十月</option> <option value="11" {if month=="11"}selected{/if}>十一月</option> <option value="12" {if month=="12"}selected{/if}>十二月</option> </select></span></td></tr></table> 
				</div> 
				<div align=center></div> 
				<div style="width:{if hasecond == "true"}154{else}150;{/if} class="datebackground">
				<table  border="0" cellpadding="0" cellspacing="0" {if hastime != "true"} style="display:none"{/if} class="date_table">
					<tr><td >
					<table border="0" cellpadding="0" cellspacing="0" class="date_time">
						<tr>
						<td style="padding-left:3">时间</td>
						<td>
						<div class="adjust">
						<div style="position:relative;left:{if hasecond == "true"}64{else}50{/if};top:0;z-index:1">
						{if hasecond != "true"}
							<button style="left:0;top:0;height:10;"  conf="1,1,100,"onclick="${GRIDINFO.name}._uper(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);"onmousedown="${GRIDINFO.name}._conti_uper(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);" onmouseout="${GRIDINFO.name}._stop_inch();" onmouseup="${GRIDINFO.name}._stop_inch();">5</button>
							<button style="left:0;top:9;height:10;"onclick="${GRIDINFO.name}._downer(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);" onmousedown="${GRIDINFO.name}._conti_downer(this);"${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);" onmouseout="${GRIDINFO.name}._stop_inch();" onmouseup="${GRIDINFO.name}._stop_inch();">6</button>
						</div>
						<input type="text" maxlength=2 style="border-right:0px;width:18;padding-right:6" onclick="${GRIDINFO.name}._selthis(this);" onchange="${GRIDINFO.name}.doHourBlur(this);"  conf="1,0,23," value="${hour}"><input type="text"  value=":" readonly style="width:4;border-right:0px;border-left:0px;" unselectable="on"><input type="text" onchange="${GRIDINFO.name}.doMiniteBlur(this);" maxlength=2  value="${minute}" style="border-left:0px;width:34;" onclick="${GRIDINFO.name}._selthis(this);" conf="1,0,59,">
						{else}
							<button style="left:0;top:0;height:10;"  conf="1,1,100," onclick="${GRIDINFO.name}._uper(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value);" onmousedown="${GRIDINFO.name}._conti_uper(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value);" onmouseout="${GRIDINFO.name}._stop_inch();" onmouseup="${GRIDINFO.name}._stop_inch();">5</button>
							<button style="left:0;top:9;height:10;"  onclick="${GRIDINFO.name}._downer(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value);"  onmousedown="${GRIDINFO.name}._conti_downer(this);${GRIDINFO.name}.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value);" onmouseout="${GRIDINFO.name}._stop_inch();" onmouseup="${GRIDINFO.name}._stop_inch();">6</button>
						</div>
						<input type="text" maxlength=2 style="border-right:0px;width:18;padding-right:6" onclick="${GRIDINFO.name}._selthis(this);" onchange="${GRIDINFO.name}.doHourBlur(this);"  conf="1,0,23," value="${hour}"><input type="text"  value=":" readonly style="width:4;border-right:0px;border-left:0px;" unselectable="on"><input type="text" onchange="${GRIDINFO.name}.doMiniteBlur(this);" maxlength=2  value="${minute}" style="border-left:0px;border-right:0px;width:18;" onclick="${GRIDINFO.name}._selthis(this);" conf="1,0,59,"><input type="text"  value=":" readonly style="width:4;border-right:0px;border-left:0px;" unselectable="on"><input type="text" onchange="${GRIDINFO.name}.doSecondBlur(this);" maxlength=2  value="${second}" style="border-left:0px;width:30;" onclick="${GRIDINFO.name}._selthis(this);" conf="1,0,59,">
						{/if}
						</div> </td></tr></table> </td> <td><span class="buttonskin"><button  class="advbutton" onclick="${GRIDINFO.name}.saveValue();" >确定</button></td> </tr> </table> 
						</div> 
	<iframe frameborder=0 style="width:100%;height:expression(this.offsetParent.offsetHeight);position:absolute;top:0;left:0;z-index:-1;"></iframe>
						</div>
{/if}
</div>
</div>
  </TEXTAREA>