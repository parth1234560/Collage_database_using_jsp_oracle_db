<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Faculty</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<h2>Faculty</h2>

<div class="nav">
<a href="index.jsp">Home</a>
</div>

<form>
Faculty ID
<input name="fid">

Name
<input name="name">

Department ID
<input name="dept">

Course ID
<input name="cid">

<input type="submit" name="add" value="Add Faculty">
</form>

<%
if(request.getParameter("add")!=null){
PreparedStatement ps=con.prepareStatement(
"INSERT INTO Faculty VALUES (?,?,?,?)");
ps.setInt(1,Integer.parseInt(request.getParameter("fid")));
ps.setString(2,request.getParameter("name"));
ps.setInt(3,Integer.parseInt(request.getParameter("dept")));
ps.setInt(4,Integer.parseInt(request.getParameter("cid")));
ps.executeUpdate();
}
%>

</div>
</body>
</html>
