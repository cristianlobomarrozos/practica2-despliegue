<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="parametrizar.jsp"%>
<%@page import="java.sql.Connection"%>

<%    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection(bbdd, usuario, contrasenya);
    Statement s = conexion.createStatement();

    String user = request.getParameter("usuario");
    String password = request.getParameter("password");

    ResultSet usuarios = s.executeQuery("SELECT * FROM User WHERE NomUser='" + user + "' AND Password='" + password + "'");

    if (user.length() == 0 || password.length() == 0) {
        session.setAttribute("error", "Nombre de usuario o contraseña incorrecto. Por favor, introduzca de nuevo sus datos.");
        response.sendRedirect("login.jsp");
    } else {

        if (usuarios.next()) {
            session.setAttribute("usuario", user);
            if (session.getAttribute("usuario").equals("admin")) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("viwer.jsp");
            }
        } else {
            session.setAttribute("error", "Nombre de usuario o contraseña incorrecto. Por favor, introduzca de nuevo sus datos.");
            response.sendRedirect("login.jsp");
        }

    }

%>