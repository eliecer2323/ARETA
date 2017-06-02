<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
Connection conexion = (Connection) request.getServletContext().getAttribute("conexion");

String id_evento = request.getParameter("id_evento");
//System.out.println("id_evento: "+id_evento);
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
		<div class="formAfectado">
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
				<tbody>
					<%
					String sql = "";
					Statement st = conexion.createStatement();
					ResultSet rs;
					sql = "select  * from repositorio.evento_afectado where id_evento="+id_evento;
					rs = st.executeQuery(sql);
					while(rs.next()){
						String sql2 = "";
						Statement st2 = conexion.createStatement();
						ResultSet rs2;
						sql2 = "select  * from repositorio.persona where id_persona="+rs.getString("id_afectado");
						rs2 = st2.executeQuery(sql2);
						if(rs2.next()){
					%>
						<tr>
							<td><%=rs2.getString("nombres")%></td>
							<td><%=rs2.getString("apellidos")%></td>
							<td><%=rs2.getString("cedula")%></td>
							<td><%=rs2.getString("fecha_nacimiento")%></td>
							<td><%=rs2.getString("genero")%></td>
						</tr>
					<%	
						}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>