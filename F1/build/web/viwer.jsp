<html>
    <head>
        <title>Guest</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

        <%            if (session.getAttribute("usuario") == null) {
                session.setAttribute("error", "Debe iniciar sesión para acceder a la página.");
                response.sendRedirect("login.jsp");
            } else if (session.getAttribute("usuario").equals("admin")) {
                session.setAttribute("error", "Ha iniciado sesión como admin, por lo tanto no podrá acceder a la página del invitado.");
                response.sendRedirect("login.jsp");
            }
        %>

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="f1-icon.png" class="icono""></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="login.jsp">Login <span class="sr-only"></span></a></li>
                        <li><a href="pilotos.jsp">Pilotos</a></li>
                        <li><a href="equipos.jsp">Equipos</a></li>
                        <li><a href="jefe.jsp">Jefes</a></li>
                        <li><a href="logout.jsp"><span class="float-left">Logout</span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="marco">
            <h1>Has entrado como invitado</h1>
        </div>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-2">
                    <form action="equipos.jsp">
                        <button type="submit" class="btn btn-info btn-responsive btninter"><span>Equipos</span></button>
                    </form>
                </div>
                <div class="col-md-2">
                    <form action="pilotos.jsp">
                        <button type="submit" class="btn btn-info btn-responsive btninter right"><span>Pilotos</span></button>
                    </form>
                </div>
                <div class="col-md-2">
                    <form action="jefe.jsp">
                        <button type="submit" class="btn btn-info btn-responsive btninter right"><span>Jefes</span></button>
                    </form>
                </div>
                <div class="col-md-3">

                </div>
            </div>
        </div>
    </body>
</html>