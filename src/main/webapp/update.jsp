<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
    
JSONArray list = new JSONArray();
 
 
String id = request.getParameter("id"); 
String name = request.getParameter("name");
String nic = request.getParameter("nic");
String address = request.getParameter("address");
String zipCode = request.getParameter("zipCode");
String phoneNumber = request.getParameter("phoneNumber");
String email = request.getParameter("email");

Connection con;
PreparedStatement pst;
ResultSet rs;
 
 
JSONObject obj = new JSONObject();
 
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/usermanagment","root","9928");
pst = con.prepareStatement("update person set name = ?, nic= ? , address= ? , zipCode= ? , phoneNumber= ?, email= ? where id = ?");
pst.setString(1, id);
pst.setString(2, name);
pst.setString(3, nic);
pst.setString(4, address);
pst.setString(5, zipCode);
pst.setString(6, phoneNumber);
pst.setString(7, email);

pst.executeUpdate();
obj.put("name", "success");
list.add(obj);
out.println(list.toJSONString());
out.flush();
 
 
 
 
%>