
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
      JSONArray list = new JSONArray();

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
                con = DriverManager.getConnection("jdbc:mysql://localhost/usermanagment", "root", "9928");
                pst = con.prepareStatement("insert into person (name,nic,address,zipCode,phoneNumber,email)values(?,?,?,?,?,?)");

                      pst.setString(1, name);
                      pst.setString(2, nic);
                      pst.setString(3, address);
                      pst.setString(4, zipCode);
                      pst.setString(5, phoneNumber);
                      pst.setString(6, email);

                      pst.executeUpdate();
                      
                    obj.put("name", "success");
                      list.add(obj);
                      
           out.println(list.toJSONString());
           out.flush();
%>