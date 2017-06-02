<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" href="../../recursos/css/inicio.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../recursos/js/comun.js"></script>
	<title>Inscripción de Evento</title>
</head>
<body>
	<form id="formularioEvento" action="nuevoAfectados.jsp" method="get">
		<div id="formulario" class="formNuevo">
	       	<fieldset class="fsNuevo">
	            <legend>Inscribir un nuevo evento</legend>
	            <div>
	                <label>Dirección:</label>
	                <input class="w160" type="text" id="direccion" name="direccion" required/>
	                <label class="altoCero">&nbsp;</label> 
	                <div class="clear"></div>
	            </div>
	            <div>
	                <label>Costo:</label>
	                <input class="w160" type="number" id="costo" name="costo" required/>
	                <label class="altoCero">&nbsp;</label> 
	                <div class="clear"></div>
	            </div>
	            <div>
	                <label>Fecha:</label>
	                <input class="w160" type="date" id="fecha" name="fecha" required/>
	                <label class="altoCero">&nbsp;</label> 
	                <div class="clear"></div>
	            </div>
	            <div>
	        		<input type="submit" class="boton" value="Continuar"/>
            	</div>
	        </fieldset>
		</div>
	</form>
</body>
</html>