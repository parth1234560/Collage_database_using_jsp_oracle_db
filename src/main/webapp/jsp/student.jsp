<%@ include file="db.jsp" %>

<%
if(request.getParameter("add")!=null){
PreparedStatement ps=con.prepareStatement(
"INSERT INTO Student VALUES (?,?,?)");
ps.setInt(1,Integer.parseInt(request.getParameter("sid")));
ps.setString(2,request.getParameter("name"));
ps.setInt(3,Integer.parseInt(request.getParameter("dept")));
ps.executeUpdate();
}

if(request.getParameter("del")!=null){
PreparedStatement ps=con.prepareStatement(
"DELETE FROM Student WHERE Stu_ID=?");
ps.setInt(1,Integer.parseInt(request.getParameter("del")));
ps.executeUpdate();
}

if(request.getParameter("update")!=null){
PreparedStatement ps=con.prepareStatement(
"UPDATE Student SET Stu_Name=?,Dept_ID=? WHERE Stu_ID=?");
ps.setString(1,request.getParameter("name"));
ps.setInt(2,Integer.parseInt(request.getParameter("dept")));
ps.setInt(3,Integer.parseInt(request.getParameter("sid")));
ps.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Student</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<h2>Student</h2>
<div class="nav"><a href="index.jsp">Home</a></div>

<form>
ID <input name="sid">
Name <input name="name">
Dept
<select name="dept">
<%
ResultSet d=con.createStatement()
.executeQuery("SELECT * FROM Department");
while(d.next()){
%>
<option value="<%=d.getInt(1)%>"><%=d.getString(2)%></option>
<% } %>
</select>

<input type="submit" name="add" value="Add">
<input type="submit" name="update" value="Update">
</form>

<table>
<tr><th>ID</th><th>Name</th><th>Dept</th><th>Delete</th></tr>
<%
ResultSet rs=con.createStatement()
.executeQuery("SELECT * FROM Student");
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getInt(3)%></td>
<td><a href="student.jsp?del=<%=rs.getInt(1)%>">Delete</a></td>
</tr>
<% } %>
</table>
</div>

</body>
</html>
