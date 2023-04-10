<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<title>Insert</title>
</head>
<body>
<div class="container">
<form action="<% out.print(request.getContextPath()); %>/insertstudent" method="post" enctype="multipart/form-data">
<br>
<p class="h1 text-center">ENTER YOUR DETAILS</P><br>
<div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp" placeholder="Enter your Name">
    <small id="textHelp" class="form-text text-muted"></small>
  </div>
<br>
  <div class="row">
    <div class="col">
    <label for="exampleInputEmail1">Age</label>
      <input type="text" class="form-control" name="age" placeholder="Enter your age">
    </div>
    <div class="col">
     <div class="form-check">
     <label for="exampleInputEmail1">Gender</label><br>
  <input class="form-check-input" type="checkbox" value="Male" name="gender" id="flexCheckDefault">
  <label class="form-check-label" for="flexCheckDefault">Male</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="Femaler" name="gender" id="flexCheckChecked">
  <label class="form-check-label" for="flexCheckChecked">Female</label>
 </div>
 </div>
 </div>
<br>
<label for="exampleInputEmail1">Stream</label>
 <select class="form-select form-select-lg mb-3" name="stream" aria-label=".form-select-lg example">
  <option selected>--Select--</option>
  <option value="BBA">BBA</option>
  <option value="BCA">BCA</option>
  <option value="EE">ECE</option>
  <option value="CSE">CSE</option>
  </select>
<br>
<label for="exampleInputEmail1" >Upload Photo</label>
<input type="file" class="form-control" name="image" id="customFile" />
<br>
<div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-primary" type="submit" value="Submit">Submit</button>
</div><br>
</form>
</div><br><br><hr>
</body>
</html>