<%@ page contentType="text/html;charset=GBK" %>
<%// ͨ�����ʱ�ǩ������ɵ�Json ����ѭ����������ģ�飬ѭ������б����� �� ������Զ���ÿ�еĸ߶ȣ�����Ҫ����һ���иߵĲ��� %>
<div id="${GRIDINFO.name}" hassum="${GRIDINFO.hasSum}"  hasleft="${GRIDINFO.hasLeft}" style="overflow:hidden; height:${GRIDINFO.height}px;" class="divAllcss">
<div style="overflow:hidden;width:100%;height:${TabHead.rows.length*22};position:absolute;z-index:1"><div style="overflow:hidden;width:100%;height:${TabHead.rows.length*22};position:absolute;z-index:1" class="divToucss"><table border=0 width="100%" height=${TabHead.rows.length*22} cellspacing=0 cellpadding=0><colgroup><col width="40px">
{for col in TabHead.rows[TabHead.rows.length-1].cols}
<col  width="${col.width}" style="${col.style}">
{/for}
<col></colgroup>
 {for r in TabHead.rows}
 <tr><td nowrap width="40px"></td>
 {for c in r.cols}
<td nowrap colspan="${c.colspan}"><span unselectable=on sortName="${c.sortName}" sortType="${c.sortType}" cansort="${c.canSort}" enableCheckAll="${c.enableCheckAll}" format="${c.sortType}">${c.text}<label disabled style="display:none">6</label></span></td>
{/for}
<td nowrap style="display:blank"><span unselectable=on cansort="true" format=""></span></td>
</tr>
{/for}
</table><iframe height="100%" width="100%" frameborder="0" style="top:-1;left-1;position:absolute;z-index:-1;" scrolling=no></iframe></div><div style="width:41px;height:${TabHead.rows.length*22};position:absolute;top:0;left:0;z-index:2;" class="divToucss"><table width="100%" height="100%" border=0 cellspacing=0  cellpadding=0><tr><td nowrap width="40px"><span></span></td></tr></table></div></div>
{var ticss="divTiSkin"}
{if GRIDINFO.isWrap=="true"}
{var ticss="divTiSkinWrap"}
{/if}
<div style="overflow:auto;width:100%;height:${GRIDINFO.height}px;position:absolute;padding-top:${(TabHead.rows.length-1)*23-1};" class="${ticss}">
<table border=0 width="100%"  cellspacing=0 cellpadding=0>
{var i=true;}
{for titr in TabTi.rows}
{if i==true}
{var firsttr = titr.cols;}
{var i=false;}
{/if}
{var j=0}
<tr><td width="40px"><span></span></td>
{for vtd in titr.cols}
{var titd=find(firsttr,j);}
{var j=j+1;}
<td width="${titd.width}" style="${titd.style}" index="${titd.index}" ${titd.eventString}>
{if titd.coltype=="flex"}
<span type="${titd.type}" title="${vtd.title}" style="${titd.style}">${vtd.value}</span></td>
{elseif  titd.coltype=="checkbox"}
<input type="checkbox" style="${titd.style}" name="${titd.name}" {if titd.disabled=="true"} disabled {/if} value="${vtd.value}" ${vtd.checked}></td>
{elseif  titd.coltype=="radio"}
<input type="radio" style="${titd.style}" name="${titd.name}" {if titd.disabled=="true"} disabled {/if} value="${vtd.value}" ${vtd.checked}></td>
{elseif  titd.coltype=="tree"}
<div align="left"><img src="${GRIDINFO.openFlag}" nodeid="${vtd.nodeid}"></div></td>
{/if}
{/for}
<td style="display:block;border-right:0;"><span></span></td></tr>
{/for}
</table><div style="overflow:hidden;width:100%;height:20px;position:absolute;"></div></div>
<div style="overflow:hidden;width:100%;height:21px;position:absolute;top:0;z-index:2"><div style="overflow:hidden;width:100%;height:21px;" class="divSumcss"><table border=0 width="100%" height=20 cellpadding=0 cellspacing=0>
{for sumtr in TabSum.rows}
<tr><td nowrap width="40px"></td>
{for sumcol in sumtr.cols}
<td width="${sumcol.width}" nowrap style="${sumcol.style}" >
<span type="${sumcol.type}" unselectable=on format="${sumcol.format}" style="${sumcol.style}">${sumcol.text}</span>
</td>
{/for}
<td style="display:block;border-right:0;"><span></span></td></tr>
{/for}
</table></div><div style="width:41px;position:absolute;top:0;left:0;z-index:2;height:21px;" class="divSumcss"><table width="100%" border=0  cellspacing=0  cellpadding=0><tr><td nowrap width="40px"><span>�ϼ�</span></td></tr></table></div></div>
<div  style="width:41px;position:absolute;height:${GRIDINFO.height-22}px;overflow:hidden;padding-top:${(TabHead.rows.length-1)*23-1};"  class="divLeftCss"><table border=0 width="100%" cellspacing=0 cellpadding=0>
{var t=0;}
{for titr in TabTi.rows}
<tr><td nowrap width="41px" style="text-align:center;vertical-align:middle" valign="middle"><span unselectable=on cansort="false">${t++}</span></td></tr>
{/for}
</table></div>
{for hidtxt in GRIDINFO.hidden}
<input type="hidden" name="${hidtxt.name}" value="${hidtxt.value}">
{/for}
<div style="display:none;" class="ctxMenu"><table CELLSPACING=1><tr><td><span>��λ����</span></td></tr><tr><td><span>��λβ��</span></td></tr></table><iframe frameborder=0 style="width:100%;height:100%;top:0;left:0;position:absolute;z-index:-1;"></iframe></div>
</div>