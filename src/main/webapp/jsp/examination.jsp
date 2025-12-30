<%@ include file="db.jsp" %>

<%
if(request.getParameter("add")!=null){
PreparedStatement ps=con.prepareStatement(
"INSERT INTO Examination VALUES (?,?,?,?)");
ps.setInt(1,Integer.parseInt(request.getParameter("eid")));
ps.setInt(2,Integer.parseInt(request.getParameter("marks")));
ps.setInt(3,Integer.parseInt(request.getParameter("cid")));
ps.setInt(4,Integer.parseInt(request.getParameter("sid")));
ps.executeUpdate();
}

if(request.getParameter("del")!=null){
PreparedStatement ps=con.prepareStatement(
"DELETE FROM Examination WHERE Exam_ID=?");
ps.setInt(1,Integer.parseInt(request.getParameter("del")));
ps.executeUpdate();
}

if(request.getParameter("update")!=null){
PreparedStatement ps=con.prepareStatement(
"UPDATE Examination SET MARKS=? WHERE Exam_ID=?");
ps.setInt(1,Integer.parseInt(request.getParameter("marks")));
ps.setInt(2,Integer.parseInt(request.getParameter("eid")));
ps.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Examination</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<h2>Examination</h2>
<div class="nav"><a href="index.jsp">Home</a></div>

<form>
Exam ID <input name="eid">
Marks <input name="marks">
Course ID <input name="cid">
Student ID <input name="sid">

<input type="submit" name="add" value="Add">
<input type="submit" name="update" value="Update">
</form>

<table>
<tr><th>ID</th><th>Marks</th><th>Delete</th></tr>
<%
ResultSet rs=con.createStatement()
.executeQuery("SELECT * FROM Examination");
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getInt(2)%></td>
<td><a href="examination.jsp?del=<%=rs.getInt(1)%>">Delete</a></td>
</tr>
<% } %>
</table>
</div>

</body>
</html>
