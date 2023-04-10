<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>View</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="container mt-3">
  <h2>Student List</h2>
  <p>Major Project Team:</p>
  <table class="table table-striped table-hover">
    <thead>
      <tr>
        <th>Name</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Stream</th>
        <th>Image</th>
        <th class="text-center">Delete</th>
        <th class="text-center">Update</th>
      </tr>
    </thead>
    <tbody>
    <%
    @SuppressWarnings({"unchecked", "rawtypes"})
    ArrayList<HashMap> std = (ArrayList<HashMap>)request.getAttribute("students");
    
    for(int i=0;i<std.size();i++) {
    %>
      <tr>
        <td><% out.print(std.get(i).get("name")); %></td>
        <td><% out.print(std.get(i).get("age")); %></td>
        <td><% out.print(std.get(i).get("gender")); %></td>
        <td><% out.print(std.get(i).get("stream")); %></td>
        <td><img style="width: 50px" src="img/<% out.print(std.get(i).get("img")); %>"></td>
        <td class="text-center">
        <form action="deletestudent" method="post">
        <input type="hidden" name="id" value="<% out.print(std.get(i).get("id")); %>">
        <button onclick="return confirm('Are you sure ?')" type="submit" class="btn btn-danger px-2">Remove</button>
        </form>
        </td>
        <td class="text-center">
        <form action="updatestudent" method="post">
        <input type="hidden" name="id" value="<% out.print(std.get(i).get("id")); %>">
        <button type="submit" class="btn btn-warning px-4">Edit</button>
        </form>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

<div class="container text-center">
	<button onclick="document.location='index.jsp'" class="btn btn-primary px-4">Home</button>
</div>

</body>
</html>