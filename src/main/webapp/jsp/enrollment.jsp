<%@ include file="db.jsp" %>

<%
if(request.getParameter("add")!=null){
PreparedStatement ps=con.prepareStatement(
"INSERT INTO Enrollment VALUES (?,?,?)");
ps.setInt(1,Integer.parseInt(request.getParameter("eid")));
ps.setInt(2,Integer.parseInt(request.getParameter("sid")));
ps.setInt(3,Integer.parseInt(request.getParameter("cid")));
ps.executeUpdate();
}

if(request.getParameter("del")!=null){
PreparedStatement ps=con.prepareStatement(
"DELETE FROM Enrollment WHERE Enrollment_ID=?");
ps.setInt(1,Integer.parseInt(request.getParameter("del")));
ps.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Enrollment</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<h2>Enrollment</h2>
<div class="nav"><a href="index.jsp">Home</a></div>

<form>
Enroll ID <input name="eid">
Student ID <input name="sid">
Course ID <input name="cid">
<input type="submit" name="add" value="Enroll">
</form>

<table>
<tr><th>ID</th><th>Student</th><th>Course</th><th>Delete</th></tr>
<%
ResultSet rs=con.createStatement()
.executeQuery("SELECT * FROM Enrollment");
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getInt(2)%></td>
<td><%=rs.getInt(3)%></td>
<td><a href="enrollment.jsp?del=<%=rs.getInt(1)%>">Delete</a></td>
</tr>
<% } %>
</table>
</div>

</body>
</html>
