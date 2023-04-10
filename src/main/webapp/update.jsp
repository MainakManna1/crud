<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<title>Update</title>
</head>
<body>
<%
@SuppressWarnings({"unchecked", "rawtypes"})
ArrayList<HashMap> std = (ArrayList<HashMap>)request.getAttribute("students");

for(int i=0;i<std.size();i++) {
%>
<form action="updatedatabase" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="<% out.print(std.get(i).get("id")); %>">
<p>Name</p>
<p><input type="text" name="name" value="<% out.print(std.get(i).get("name")); %>"></p>

<p>Age</p>
<p><input type="number" name="age" value="<% out.print(std.get(i).get("age")); %>"></p>

<p>Gender</p>
<p><label><input <% if(std.get(i).get("gender").equals("Male")) { out.print("checked"); } %> type="radio" name="gender" value="Male">Male</label></p>
<p><label><input <% if(std.get(i).get("gender").equals("Female")) { out.print("checked"); } %> type="radio" name="gender" value="Female">Female</label></p>

<p>Stream</p>
<p>
<select name="stream">
<option value="">--Select--</option>
<option <% if(std.get(i).get("stream").equals("BBA")) { out.print("selected"); } %> value="BBA">BBA</option>
<option <% if(std.get(i).get("stream").equals("BCA")) { out.print("selected"); } %> value="BCA">BCA</option>
<option <% if(std.get(i).get("stream").equals("CSE")) { out.print("selected"); } %> value="CSE">CSE</option>
<option <% if(std.get(i).get("stream").equals("ECE")) { out.print("selected"); } %> value="EE">ECE</option>
</select>
</p>

<p>Upload Photo</p>
<p><input type="file" name="image"></p>
<p><img style="width: 65px" src="img/<% out.print(std.get(i).get("img")); %>"></p>

<p><input type="submit" value="Update"></p>
</form>
<% } %>
</body>
</html>