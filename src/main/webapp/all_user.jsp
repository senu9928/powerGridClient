<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
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
 
String query = "select * from person";
 
Statement stmt = con.createStatement();
 
rs = stmt.executeQuery(query);
 
 
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String name = rs.getString("name");
    String nic = rs.getString("nic");
    String address = rs.getString("address");
    String zipCode = rs.getString("zipCode");
    String phoneNumber = rs.getString("phoneNumber");
    String email = rs.getString("email");
    
    obj.put("name", name);
    obj.put("nic", nic);
    obj.put("address", address);
    obj.put("zipCode", zipCode);
    obj.put("phoneNumber", phoneNumber);
    obj.put("email", email);
    obj.put("id", id);
    list.add(obj);
}
 
out.print(list.toJSONString());
out.flush();
 
%>>