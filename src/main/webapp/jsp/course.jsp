<%@ include file="db.jsp" %>

<%
if(request.getParameter("add")!=null){
PreparedStatement ps=con.prepareStatement(
"INSERT INTO Course VALUES (?,?)");
ps.setInt(1,Integer.parseInt(request.getParameter("cid")));
ps.setString(2,request.getParameter("name"));
ps.executeUpdate();
}

if(request.getParameter("del")!=null){
PreparedStatement ps=con.prepareStatement(
"DELETE FROM Course WHERE Course_ID=?");
ps.setInt(1,Integer.parseInt(request.getParameter("del")));
ps.executeUpdate();
}

if(request.getParameter("update")!=null){
PreparedStatement ps=con.prepareStatement(
"UPDATE Course SET Course_Name=? WHERE Course_ID=?");
ps.setString(1,request.getParameter("name"));
ps.setInt(2,Integer.parseInt(request.getParameter("cid")));
ps.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Course</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<h2>Course</h2>
<div class="nav"><a href="index.jsp">Home</a></div>

<form>
ID <input name="cid">
Name <input name="name">
<input type="submit" name="add" value="Add">
<input type="submit" name="update" value="Update">
</form>

<table>
<tr><th>ID</th><th>Name</th><th>Delete</th></tr>
<%
ResultSet rs=con.createStatement()
.executeQuery("SELECT * FROM Course");
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><a href="course.jsp?del=<%=rs.getInt(1)%>">Delete</a></td>
</tr>
<% } %>
</table>
</div>

</body>
</html>
