<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="parametrizar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%    if (session.getAttribute("usuario") == null) {
        session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil.");
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("usuario").equals("guest")) {
        session.setAttribute("error", "Ha iniciado sesión como invitado, por lo tanto no podrá acceder a la página del administrador.");
        response.sendRedirect("login.jsp");
    }
%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection(bbdd, usuario, contrasenya);
    Statement s = conexion.createStatement();
    request.setCharacterEncoding("UTF-8");
    s.execute("UPDATE Piloto set NomPil='" + request.getParameter("NomPil") + "', ApePil='" + request.getParameter("ApePil") + "', Puntos=" + request.getParameter("Puntos") + ", Victorias=" + request.getParameter("Victorias") + ", CodEqui=" + request.getParameter("CodEqui") + " WHERE CodPil=" + request.getParameter("CodPil"));
    conexion.close();

    response.sendRedirect("pilotos.jsp");

%>


<script>