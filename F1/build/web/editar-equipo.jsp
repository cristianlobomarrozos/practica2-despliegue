<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="parametrizar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%            if (session.getAttribute("usuario") == null) {
                session.setAttribute("error", "Debe iniciar sesión para acceder a la página.");
                response.sendRedirect("login.jsp");
            } else if (session.getAttribute("usuario").equals("guest")) {
                session.setAttribute("error", "Ha iniciado sesión como invitado, por lo tanto no podrá acceder a la página del administrador.");
                response.sendRedirect("login.jsp");
            }
%>

<%
    
Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(bbdd,usuario, contrasenya);
            Statement s = conexion.createStatement();
request.setCharacterEncoding("UTF-8");
s.execute ("UPDATE Equipo set NomEqui='"+request.getParameter("NomEqui")+"', Campeonatos="+request.getParameter("Campeonatos")+" WHERE CodEqui="+request.getParameter("CodEqui"));
conexion.close();

response.sendRedirect("equipos.jsp");

%>


