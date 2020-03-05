<%-- 
    Document   : login
    Created on : Apr 22, 2019, 8:18:44 PM
    Author     : tux
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <p>
            <%= session.getAttribute("error") == null ? "<b>Logueate</b>" : session.getAttribute("error")%>
            <%
                session.removeAttribute("error");
            %>
        </p>
        <form action="validacion.jsp">
            <div id="wrapper">
                <div class="form-group">
                    <label for="exampleInputEmail1">Usuario</label>
                    <input type="String" class="form-control" name="usuario">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Contraseña</label>
                    <input type="password" class="form-control" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Entrar</button>
        </form>
    </div>
</body>
</html>