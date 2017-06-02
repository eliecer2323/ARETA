<%@page import="org.apache.catalina.Context"%>
<%@page import="gov.publicidad.Publicitor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ARETA</title>
    <link type="text/css" href="/ARETA/recursos/css/inicio.css" rel="stylesheet"/>
	<title>Publicidad</title>
</head>
<body>
<%
/*Publicitor publicitor = new Publicitor();
publicitor.publicitar((Connection) request.getServletContext().getAttribute("conexion"));*/
%>
	<div class="contenedor">
		<div class="anuncio">
			<img alt="Publicidad 1" src="../../recursos/imagenes/p1.png">
		</div>
	</div>
</body>
</html>