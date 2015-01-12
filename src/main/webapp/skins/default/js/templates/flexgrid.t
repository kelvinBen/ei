<TEXTAREA id="gridinfo_template" style="display:none;">
  <div id="${GRIDINFO.name}" hassum="${GRIDINFO.hasSum}"  hasleft="${GRIDINFO.hasLeft}" style="overflow:hidden;width:100%; height:${GRIDINFO.height}px;" class="divAllcss">
<div style="overflow:hidden;width:100%;height:${TabHead.rows.length*22};position:absolute;z-index:1"><div style="overflow:hidden;width:100%;height:${TabHead.rows.length*22};position:absolute;z-index:1" class="divToucss"><table border=0 width="100%" height=${TabHead.rows.length*22} cellspacing=0 cellpadding=0><colgroup><col width="30px">
{for col in TabHead.rows[TabHead.rows.length-1].cols}
<col  width="${col.width}" style="${col.style}">
{/for}
<col></colgroup>
 {for r in TabHead.rows}
 <tr><td nowrap width="30px"></td>
 {for c in r.cols}
<td nowrap colspan="${c.colspan}"><span unselectable=on sortName="${c.sortName}" sortType="${c.sortType}" cansort="${c.canSort}" enableCheckAll="${c.enableCheckAll}" format="${c.sortType}">${c.text}<label disabled style="display:none">6</label></span></td>
{/for}
<td nowrap style="display:blank"><span unselectable=on cansort="true" format=""></span></td>
</tr>
{/for}
</table><iframe height="100%" width="100%" frameborder="0" style="top:-1;left-1;position:absolute;z-index:-1;" scrolling=no></iframe></div><div style="width:31px;height:${TabHead.rows.length*22};position:absolute;top:0;left:0;z-index:2;" class="divToucss"><table width="100%" height="100%" border=0 cellspacing=0  cellpadding=0><tr><td nowrap width="30px"><span></span></td></tr></table></div></div>
{var ticss="divTiSkin"}
{if GRIDINFO.isWrap=="true"}
{var ticss="divTiSkinWrap"}
{/if}
<div style="overflow:auto;width:100%;height:${GRIDINFO.height}px;position:absolute;padding-top:${(TabHead.rows.length-1)*23-1};" class="${ticss}">
<table border=0 width="100%"  cellspacing=0 cellpadding=0>
{var i=0}
{for titr in TabTi.rows}
<tr><td width="30px" class="leftTd"><span class=leftSpan>${i++}</span></td>
{for titd in titr.cols}
{if titd.coltype=="flex"}
<td width="${titd.width}" style="${titd.style}" index="${titd.index}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
<span type="${titd.type}" title="${titd.title}" style="${titd.style}">${titd.value}</span>
</td>
{elseif  titd.coltype=="checkbox"}
<td width="${titd.width}" style="${titd.style}" index="${titd.index}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
<input type="checkbox" style="${titd.style}" name="${titd.name}" value="${titd.value}" ${titd.checked}>
</td>
{elseif  titd.coltype=="radio"}
<td width="${titd.width}" style="${titd.style}" index="${titd.index}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
<input type="radio" style="${titd.style}" name="${titd.name}" value="${titd.value}" ${titd.checked}>
</td>
{elseif  titd.coltype=="tree"}
<td width="${titd.width}" style="${titd.style}" index="${titd.index}" onclick="${titd.onclick}" onchange="${titd.onchange}" ondblclick="${titd.ondblclick}" onfocus="${titd.onfocus}" onkeydown="${titd.onkeydown}" onkeypress="${titd.onkeypress}" onkeyup="${titd.onkeyup}" onmousedown="${titd.onmousedown}" onmousemove="${titd.onmousemove}" onmouseout="${titd.onmouseout}" onmouseover="${titd.onmouseover}" onmouseup="${titd.onmouseup}" onselect="${titd.onselect}">
<div align="left"><img src="${GRIDINFO.openFlag}" nodeid="${titd.nodeid}"></div>
</td>
{/if}
{/for}
<td style="display:block;border-right:0;"><span></span></td></tr>
{/for}
</table><div style="overflow:hidden;width:100%;height:20px;position:absolute;"></div></div>

<div style="overflow:hidden;width:100%;height:21px;position:absolute;top:0"><div style="overflow:hidden;width:100%;height:21px;" class="divSumcss"><table border=0 width="100%" height=20 cellpadding=0 cellspacing=0>
{for sumtr in TabSum.rows}
<tr><td nowrap width="30px"></td>
{for sumcol in sumtr.cols}
<td width="${sumcol.width}" nowrap style="${sumcol.style}" >
<span type="${sumcol.type}" unselectable=on format="${sumcol.format}" style="${sumcol.style}">${sumcol.text}</span>
</td>
{/for}
<td style="display:block;border-right:0;"><span></span></td></tr>
{/for}
</table></div><div style="width:31px;position:absolute;top:0;left:0;z-index:2;height:21px;" class="divSumcss"><table width="100%" border=0  cellspacing=0  cellpadding=0><tr><td nowrap width="30px"><span>合计</span></td></tr></table></div></div>
{for hidtxt in GRIDINFO.hidden}
<input type="hidden" name="${hidtxt.name}" value="${hidtxt.value}">
{/for}
<div style="display:none;" class="ctxMenu"><table CELLSPACING=1><tr><td><span>定位到首�?</span></td></tr><tr><td><span>定位到尾�?</span></td></tr></table><iframe frameborder=0 style="width:100%;height:100%;top:0;left:0;position:absolute;z-index:-1;"></iframe></div>
</div>

  </TEXTAREA>