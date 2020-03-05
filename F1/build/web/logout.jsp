<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="parametrizar.jsp"%>
<%@page import="java.sql.Connection"%>

<%
   session.setAttribute("usuario", " ");
   response.sendRedirect("login.jsp");


%>