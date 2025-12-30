<%@ page import="java.sql.*" %>
<%
Connection con = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:XE",
        "parth",
        "Parth@123"
    );
} catch (Exception e) {
    out.println("<p style='color:red'>Database connection failed</p>");
}
%>

