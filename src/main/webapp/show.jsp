<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<title>Preview</title>
</head>
<body class="text-center">
<%
String n = (String)request.getAttribute("name");
int a = (int)request.getAttribute("age");
String g = (String)request.getAttribute("gender");
String s = (String)request.getAttribute("stream");
String fn = (String)request.getAttribute("image");
%>

<h2>Data inserted successfully</h2>
<h4>Name: <% out.print(n); %></h4>
<h4>Age: <% out.print(a); %></h4>
<h4>Gender: <% out.print(g); %></h4>
<h4>Stream: <% out.print(s); %></h4>
<img style="width: 100px" alt="Photo" src="img/<% out.print(fn); %>">

<br><br>

<button onclick="document.location='index.jsp'" class="btn btn-primary px-4">Home</button>
</body>
</html>