<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
Connection conexion = (Connection) request.getServletContext().getAttribute("conexion");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Eventos Pendientes</title>
	<link type="text/css" href="../../recursos/css/inicio.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../recursos/js/comun.js"></script>
</head>
<body>
	<div class="contenedor">
	<%
	String sql = "";
	Statement st = conexion.createStatement();
	ResultSet rs;
	
	sql = "select  * from repositorio.evento where id_estado=1;";
	rs = st.executeQuery(sql);
	while(rs.next()){
	%>
		<div class="evento">
			<span><a href="eventoAfectado.jsp?id_evento=<%=rs.getString("id_evento")%>" onclick=""><%=rs.getString("fecha")%></a></span>
			<span>&emsp;&emsp;&emsp;dirección: <%=rs.getString("direccion")%></span>
			<span>&emsp;&emsp;&emsp;costo: <%=rs.getString("costo")%></span>
			<form action="../../servletActualizaEvento" method="post" class="formEvento">
				<input type="hidden" name="id_evento" id="id_evento" value="<%=rs.getString("id_evento")%>"/>
				<input type="submit" class="boton" value="Aprobar">
				<input type="submit" class="boton" value="Reprobar">
			</form>
		</div>
	<%	
	}
	%>
	</div>
</body>
</html>