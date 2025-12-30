<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Exam Report</title>

    <!-- ✅ External CSS -->
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <h2>Exam Report</h2>

    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="student.jsp">Student</a>
    </div>

    <form>
        Student ID
        <input name="sid" required>
        <input type="submit" value="View Report">
    </form>

    <table>
        <tr>
            <th>Student Name</th>
            <th>Course</th>
            <th>Marks</th>
        </tr>

        <%
        if (request.getParameter("sid") != null) {

            if (con != null) {
                try {
                    PreparedStatement ps = con.prepareStatement(
                        "SELECT s.stu_name, c.course_name, e.marks " +
                        "FROM student s, course c, examination e " +
                        "WHERE s.stu_id = e.stu_id " +
                        "AND c.course_id = e.course_id " +
                        "AND s.stu_id = ?"
                    );
                    ps.setInt(1, Integer.parseInt(request.getParameter("sid")));
                    ResultSet rs = ps.executeQuery();

                    boolean found = false;
                    while (rs.next()) {
                        found = true;
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getInt(3) %></td>
        </tr>
        <%
                    }
                    if (!found) {
        %>
        <tr>
            <td colspan="3" style="color:red; text-align:center;">
                No exam records found for this student
            </td>
        </tr>
        <%
                    }
                } catch (Exception e) {
        %>
        <tr>
            <td colspan="3" style="color:red; text-align:center;">
                Error fetching report
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3" style="color:red; text-align:center;">
                Database connection not available
            </td>
        </tr>
        <%
            }
        }
        %>

    </table>

</div>

</body>
</html>
