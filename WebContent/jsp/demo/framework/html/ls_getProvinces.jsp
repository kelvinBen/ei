<%@ taglib uri="/tags/web-seltree" prefix="tree" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.demo.html.data.*" %>      
<%   
        ArrayList list = new ArrayList();
        list=(ArrayList)request.getAttribute("provinces");
        String value =(String)request.getAttribute("default");
        //request.setAttribute("provinces",list);   
        out.print(value);
        StringBuffer sb = new StringBuffer(); 
         for(int i=0;i<list.size();i++){
        	 Province Province=null;
        	 Province=(Province)list.get(i);
        	 String ProvinceId=Province.getId();
        	 String ProvinceName=Province.getName();
        	 String countryId=Province.getCountryId();
        	// sb.append("<option value=\""+ProvinceId+"\"");
        	 if(ProvinceName.equals(value)){
        		 //sb.append("<option value="+ProvinceId+">"+ProvinceName+"</option>");	
        		 sb.append("<option value="+ProvinceId+" selected>"+ProvinceName+"</option>");	
        	 }
        	 else sb.append("<option value="+ProvinceId+">"+ProvinceName+"</option>");	
        	 //sb.append("<option value="+ProvinceId+"selected>"+ProvinceName+"</option>");		   
       //<html:multiSelect title= collection="provinces"></html:multiSelect></td>
           }
         out.print(sb.toString());
%>
