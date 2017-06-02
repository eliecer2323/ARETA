<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" href="../../recursos/css/inicio.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../recursos/js/comun.js"></script>
	<title>Programar Evento</title>
</head>
<body>
	<div class="contenedor">
        <div id="menu" class="menuSecundario">
            <ul id="" class="menu">
                <li><span class="mano" onclick="irMenu('frameMenuSecundario', 'nuevo.jsp')">Nuevo Evento</span></li>
                <li><span class="mano" onclick="irMenu('frameMenuSecundario', 'pendiente.jsp')">Eventos Pendientes</span></li>
            </ul>
        </div>
        <div class="clear"></div>
	    <iframe id="frameMenuSecundario" src="nuevo.jsp"></iframe>
	</div>
</body>
</html>