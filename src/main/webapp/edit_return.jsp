<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
JSONArray list = new JSONArray();
Connection con;
PreparedStatement pst;
ResultSet rs;
 
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/usermanagment","root","9928");
 
String id = request.getParameter("id");
 
pst = con.prepareStatement("select id,name,nic,address,zipCode,phoneNumber,email from person where id = ?");
 
pst.setString(1, id);
rs = pst.executeQuery();
 
if(rs.next()==true)
{
    String id1 = rs.getString(1);
    String name = rs.getString(2);
    String unic = rs.getString(3);
    String uaddress = rs.getString(4);
    String uzipCode = rs.getString(4);
    String uphoneNumber = rs.getString(4);
    String uemail = rs.getString(4);
    
     JSONObject obj = new JSONObject();
    
     obj.put("id",id1);
     obj.put("name",name);
     obj.put("unic",unic);
     obj.put("uaddress",uaddress);
     obj.put("uzipCode",uzipCode);
     obj.put("uphoneNumber",uphoneNumber);
     obj.put("uemail",uemail);
     
     list.add(obj);
    
    
}
 
out.print(list.toJSONString());
out.flush();
 
 
 
 
%>