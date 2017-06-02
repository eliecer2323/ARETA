<%
String direccion = request.getParameter("direccion");
//System.out.println("direccion: "+direccion);
String costo = request.getParameter("costo");
//System.out.println("costo: "+costo);
String fechaEvento = request.getParameter("fecha");
//System.out.println("fechaEvento: "+fechaEvento);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" href="../../recursos/css/inicio.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../recursos/js/comun.js"></script>
	<title>Inscripción de Evento</title>
	
	<script type="text/javascript">
		var num = 1;
	
		function agregar(formulario) {
			var padre = document.getElementById('formularioAfectado');
			//alert('padre: '+padre);
			var tabla = document.getElementById('tablaAfectados');
			var fila = document.createElement('tr');
		    for (i=1; i<formulario.length-1; i++) {
		    	//alert(formulario[i].name+": "+formulario[i].value);
		    	var columna = document.createElement('td');
		    	columna.innerHTML = formulario[i].value;
		    	fila.appendChild(columna);
		    	var hijo = document.createElement('input');
		    	hijo.type = "hidden";
				hijo.name = formulario[i].name+num;
				hijo.value = formulario[i].value;
			    padre.appendChild(hijo);
			}
		    tabla.appendChild(fila);
			num++;
			return false;
		}
	</script>
</head>
<body>
		<form id="agregarAfectado" onsubmit="return agregar(this)">
			<div id="formularioAgregarAfectado" class="formNuevo">
				<fieldset class="fsNuevo">
	            	<legend>Agregar Afectado</legend>
		            <label>Nombres:</label>
		            <input class="w110" type="text" id="nombres" name="nombres" required/>
		            <label>Apellidos:</label>
		            <input class="w110" type="text" id="apellidos" name="apellidos" required/>
		            <label>Cedula:</label>
		            <input class="w110" type="text" id="cedula" name="cedula" required/>
		            <label>Fecha Nacimiento:</label>
		            <input class="w110" type="date" id="fecha" name="fecha" required/>
		            <label>Género:</label>
		            <select class="w110" id="genero" name="genero" required>
		            	<option value="">Seleccione una opción</option>
		            	<option value="M">Masculino</option>
		            	<option value="F">Femenino</option>
		            </select>
		        	<input type="submit" class="boton" value="AGREGAR" />
		        	<div class="clear"></div>
		       	</fieldset>
			</div>
		</form>
		<form id="afectados" method="post" action="../../servletNuevoEvento">
			<div id="formularioAfectado" class="formAfectado">
				<input type="hidden" id="direccion" name="direccion" value="<%=direccion%>"/>
				<input type="hidden" id="costo" name="costo" value="<%=costo%>"/>
				<input type="hidden" id="fechaEvento" name="fechaEvento" value="<%=fechaEvento%>"/>
				<table class="tabla">
					<thead>
						<tr>
			        		<th>Nombres</th>
					        <th>Apellidos</th>
					        <th>Cedula</th>
					        <th>Fecha Nacimiento</th>
					        <th>Genero</th>
					    </tr>
					</thead>
					<tbody id="tablaAfectados">
					</tbody>
				</table>
				<input type="submit" class="boton" value="Guardar"/>
			</div>
		</form>
</body>
</html>