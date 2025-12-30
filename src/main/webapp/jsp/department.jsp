<%@ include file="db.jsp" %>

<%
String msg = "";

/* ADD */
if(request.getParameter("add") != null){
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");

        // Check if department already exists
        PreparedStatement check = con.prepareStatement(
            "SELECT COUNT(*) FROM Department WHERE Dept_ID=?");
        check.setInt(1, id);
        ResultSet crs = check.executeQuery();
        crs.next();

        if(crs.getInt(1) > 0){
            msg = "Department ID already exists!";
        } else {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Department VALUES (?,?)");
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.executeUpdate();
            msg = "Department added successfully!";
        }

    } catch(Exception e){
        msg = "Error while adding department!";
    }
}

/* UPDATE */
if(request.getParameter("update") != null){
    try {
        PreparedStatement ps = con.prepareStatement(
            "UPDATE Department SET Dept_Name=? WHERE Dept_ID=?");
        ps.setString(1, request.getParameter("name"));
        ps.setInt(2, Integer.parseInt(request.getParameter("id")));
        int rows = ps.executeUpdate();

        if(rows == 0){
            msg = "Department ID not found!";
        } else {
            msg = "Department updated successfully!";
        }
    } catch(Exception e){
        msg = "Error while updating department!";
    }
}

/* DELETE */
if(request.getParameter("del") != null){
    try {
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM Department WHERE Dept_ID=?");
        ps.setInt(1, Integer.parseInt(request.getParameter("del")));
        ps.executeUpdate();
        msg = "Department deleted successfully!";
    } catch(Exception e){
        msg = "Cannot delete department (used in other tables)";
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Department</title>
<link rel="stylesheet" href="style.css">
</head>

<body>
<div class="container">

<h2>Department Management</h2>

<div class="nav">
    <a href="index.jsp">Home</a>
</div>

<!-- MESSAGE -->
<% if(!msg.equals("")) { %>
<p style="color:green; font-weight:bold;"><%= msg %></p>
<% } %>

<form>
    Department ID
    <input name="id" required>

    Department Name
    <input name="name" required>

    <input type="submit" name="add" value="Add">
    <input type="submit" name="update" value="Update">
</form>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Delete</th>
</tr>

<%
ResultSet rs = con.createStatement()
                  .executeQuery("SELECT * FROM Department ORDER BY Dept_ID");
while(rs.next()){
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td>
        <a href="department.jsp?del=<%= rs.getInt(1) %>"
           onclick="return confirm('Are you sure?')">
           Delete
        </a>
    </td>
</tr>
<% } %>

</table>

</div>
</body>
</html>
