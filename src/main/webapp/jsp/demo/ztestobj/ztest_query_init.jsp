<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>


<HTML>
<HEAD>
<TITLE>����</TITLE>
<!--��ϸģ����JAVA����-->

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

</HEAD>
<BODY topmargin="10px">
	<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

	<bsp:container title="����">
		<!-- ���밴ť -->
		<bsp:containbutton action="ztest.cmd?method=forinsert"
			onclick="forInsert()" text="����"></bsp:containbutton>
		<bsp:containbutton action="ztest.cmd?method=forupdate"
			onclick="forUpdate()" text="�޸�"></bsp:containbutton>
		<bsp:containbutton action="ztest.cmd?method=detail"
			onclick="forDetail()" text="��ϸ"></bsp:containbutton>
		<bsp:containbutton action="ztest.cmd?method=delete"
			onclick="forDelete()" text="ɾ��"></bsp:containbutton>
		<html:messages></html:messages>
		<html:form name="frmList" action="ztestquery_page_init.cmd">
			<flex:search>
				<tr>
					<td>���� <flex:searchText name="ID" searchName="ZTEST.ID"
							dataType="java.lang.String" operSymbol="=" value="" size="12" />
					</td>

					<td><flex:searchImg name="chaxun" action="" image="search.gif" />
					</td>

				</tr>
			</flex:search>
			</table>
			<flex:flexgrid name="grid" height="420"
				action="ztestquery_page_init.cmd" isSubmit="true">
				<!-- �ڱ��� -->
				<flex:checkboxCol caption="ȫѡ" width="35" property="i$ZTEST$CODENUM"
					name="primaryKey" sortName="ZTEST.CODENUM"></flex:checkboxCol>
				<flex:flexCol caption="��" width="100" property="i$ZTEST$ID"
					sortName="ZTEST.ID" />
				<flex:flexCol caption="ֵ" width="100" property="i$ZTEST$VALUE"
					sortName="ZTEST.VALUE" />
			</flex:flexgrid>
			<flex:pagePolit action="ztestquery_page_init.cmd" pageSize="100">
			</flex:pagePolit>
		</html:form>
	</bsp:container>
</BODY>
</HTML>



<script>
 grid.show(); 
function onload_func1(){
	grid.dblclickEvent=function(){ 
	    var ishelpsign = document.getElementById("is_helpersign").value;
	    var isshowbutton =document.getElementById("isshowbutton").value;//������Ϣʱ 
	    if(isshowbutton=="1"){return;}//������Ϣ����ʾʱ;���ṩ�����÷����¼���
	    if(ishelpsign=="y")return;//����ҳ����Ϊͨ�ð���ҳ��ʱ�����ṩ�����÷����¼���
	    
	    var primaryKey= grid.getCellValue(grid.getCurrentLine(),1);  
	    var sign_power="0";//���޸ı�־ 
	    if(!forDetail_PowerSign()){sign_power="1";}; 
	    document.forms[0].action ="ztest.cmd?method=detail&sign_power="+sign_power+"&primaryKey="+primaryKey;    
	    document.forms[0].submit();
	}
	
}
function forInsert(){
 document.forms[0].action ="ztest.cmd?method=forinsert";       
  document.forms[0].submit();	
}
function forUpdate(){
 //  if(!getSelect()) return;
 document.forms[0].action ="ztest.cmd?method=forupdate";     
  document.forms[0].submit();	
}
function forDetail(){
  // if(!getSelect()) return;
  // if(!forDetail_PowerSign()){sign_power="1";};
  // document.forms[0].action ="ztest.cmd?method=detail&sign_power="+sign_power;
  document.forms[0].action ="ztest.cmd?method=detail";    
  document.forms[0].submit();	
}
/***
 * �߼�ɾ�����߼��ָ�������ɾ����������
 * value:undefined ����ɾ��,value:0 �߼��ָ�,value:1 �߼�ɾ��
 */
function forDelete(){
	var value=document.getElementById('recycleId').value;
	var flag=document.getElementById('isRecId').value;
	if(flag!="1"||value=="1"){ 
		if(!getPowerDatas('1'))return;
		if(!getDelete()) return;
document.forms[0].action ="ztest.cmd?method=delete"
	}else if(value==""){ 
		if(!getPowerDatas('1'))return;
		if(!getDelete()) return;
		document.forms[0].action ="ztest.cmd?method=update&updateType=1";
	}else{
		var sel=grid.getCheckLine();
		if(sel==""){
			alert("��ѡ��Ҫ�ָ��ļ�¼!");
			return false;
		}
		if (!confirm("���Ҫ�ָ�ѡ�еļ�¼��")) {
		   	return false;
		}
		if(!getPowerDatas('1'))return;
		document.forms[0].action ="ztest.cmd?method=update&updateType=0";
	}
  	document.forms[0].submit();	
}

/***
 * ���������û�����վ������Ա����վ���˳�����վ��������
 * value:undefined �˳�����վ,value:0 �����û�����վ,value:1�������Ա����վ
 */
function forRecycle(){
	var value=document.getElementById('recycleId').value;
	if(value==""){
		document.all("isInRecycle").value='0';
	}else{
		document.all("isInRecycle").value="";
	}
	document.forms[0].submit();
}
/***
 *��ѯ����
 *
 *
 */
function forQuery(){
    if(!is_NonullPro_Vilidate()){return;} 
    var url="ztestquery_page_init.cmd";//����Ӳ�ѯ��URL;��:test.cmd
    var isshowbutton =document.getElementById("isshowbutton").value;
    document.forms[0].action =url+"?iframesign=y"+"&isshowbutton="+isshowbutton;    
    document.forms[0].submit();
 }
 
 function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}
</script>