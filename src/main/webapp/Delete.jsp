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
Connection con;
PreparedStatement pst;
ResultSet rs;
JSONObject obj = new JSONObject();
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/usermanagment","root","9928");
pst = con.prepareStatement("delete from person where id = ?");
pst.setString(1, id);
pst.executeUpdate();
obj.put("name", "success");
list.add(obj);
out.println(list.toJSONString());
out.flush();
%>