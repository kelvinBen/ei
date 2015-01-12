<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.permit.context.BspInfo"%>
<%@ page import="net.mast.bsp.permit.pap.domain.providers.UserProvider"%>
<%@ page import="net.mast.bsp.permit.pap.data.User"%>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>

<TITLE>≤‚ ‘</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<%
    BspInfo bspInfo=(BspInfo)request.getAttribute("bspInfo");
    if(bspInfo!=null){
        out.println(bspInfo.getUserName());
        //out.println(bspInfo.getCorporation());
       //out.println(bspInfo.getDataResourcePermit("2"));
      // out.println(bspInfo.getDataResourcePermit("4"));
       //out.println(bspInfo.getDataResourcePermit("6"));
       //out.println(bspInfo.getDataResourcePermit("8"));
      // out.println(bspInfo.getDefaultDataResourcePermit("1"));
       //out.println(bspInfo.getDepartment());
       // out.println( bspInfo.getEmployee());
       // out.println(bspInfo.getFunctionId());
        //out.println(bspInfo.getLoginCorporation());
       //out.println(bspInfo.getLoginDate());
        //out.println(bspInfo.getSecurityLevel());
        //out.println(bspInfo.getStruId());
        //out.println(bspInfo.getStruName());
       //out.println(bspInfo.getUserId());

    }
     UserProvider userProvider=new UserProvider();
       List list=userProvider.getUserListOfRole("SUPERADMIN");
       for(int i=0;i<list.size();i++){
            User user=(User)list.get(i);
            out.println(user.getUserName());
       }
       out.println("-----------------------------");
       List list2=userProvider.getUserListOfSystem();
       for(int i=0;i<list2.size();i++){
            User user=(User)list2.get(i);
            out.println(user.getUserName());
       }
       out.println("-----------------------------");
       List list1=userProvider.getUserListOfEmployee("S00000000000014");
           for(int j=0;j<list1.size();j++){
            User user=(User)list1.get(j);
            out.println(user.getUserName());
       }
       out.println("-----------------------------");
       List list3=userProvider.getUserListOfCorporation("1");
           for(int j=0;j<list3.size();j++){
            User user=(User)list3.get(j);
            out.println(user.getEmployee().getOrgan().getOrganId());
       }
       out.println("-----------------------------");
        List list4=userProvider.getUserListOfStru("1","1");
           for(int j=0;j<list4.size();j++){
            User user=(User)list4.get(j);
            out.println(user.getEmployee().getOrgan().getOrganId());
       }
        out.println("-----------------------------");
        List list5=userProvider.getUserListOfOrgan("1");
           for(int j=0;j<list5.size();j++){
            User user=(User)list5.get(j);
            out.println(user.getEmployee().getOrgan().getOrganId());
       }
   
%>
</HEAD>
</HTML>
<script language="javascript">

</script>