<%@page import="java.util.Map"%>

<%
Map<String, String> usuario = null;
if(session.getAttribute("usuario")!=null){
	usuario = (Map<String, String>) session.getAttribute("usuario");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>ARETA</title>
    <link type="text/css" href="recursos/css/inicio.css" rel="stylesheet"/>
    <script type="text/javascript" src="recursos/js/comun.js"></script>
</head>
<body class="cuerpo">
    <div class="panel">
    		<div class="logo">
    			<img alt="Logo" src="recursos/imagenes/logo.png">
    		</div>
       	<%if(usuario==null){ %>
        	<div class="panelIzq" >
               <form class="" method="post" action="servletInicioSesion">
                   <h2>Iniciar Sesión</h2>
                   <label class="dato" >E-mail:</label>
                   </br>
                   <input type="email" id="correoElectronico" name="correoElectronico" class="" required />
                   <label class="altoCero">&nbsp;</label> 
                   <div class="clear"></div>
                   <label class="dato" >Contraseña:</label>
                   </br>
	               <input type="password" id="clave" name="clave" class="" required/>
	               <label class="altoCero">&nbsp;</label> 
                   <div class="clear"></div>
                   <div class="entrar">
	                   <input id="entrar" type="submit" value="ENTRAR" class="boton"/>
	                   </br>
	                   <span onclick="window.open('/GYF-web/modulos/a/a5.jsp','recordar','height=335,width=472,left=300,location=no,titlebar=no,toolbar=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no')"  class="mano">&iquest;Olvidaste la contraseña?</span>
	               </div>
               </form>
           </div>
           <div class="panelDer">
               <form>
                   <h2>¿Aún no estas registrado?</h2>        
                   <input value="REGISTRATE" type="button" class="boton" onclick="window.open('modulos/usuario/registro.jsp','registro','height=575,width=509,left=300,location=no,titlebar=no,toolbar=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,modal=yes')"/>
               </form>
           </div>
           <%} else { %>
           <div class="bienvenido">
           	<span>&emsp;<%="Bienvenido "+usuario.get("nombres")+" "+usuario.get("apellidos")%></span>
           	<form class="" method="post" action="servletCerrarSesion">
           		<input value="Cerrar Sesión" type="submit" class=""/>
           	</form>
           </div>
           <%} %>
           <div class="clear"></div>
    </div> 
	
	<div class="contenedor">
	    <div id="menu" class="menuPrincipal">
            <ul id="" class="menu">
                <li><span class="mano" onclick="irMenu('frameMenu', 'modulos/publicidad/publicidad.jsp');">Inicio</span></li>
                <li><span class="mano" onclick="irMenu('frameMenu', 'modulos/comunidad/comunidad.jsp');">Consultar Afectado</span></li>
                <li><span class="mano" onclick="irMenu('frameMenu', 'modulos/evento/evento.jsp');">Eventos</span></li>
            </ul>
        </div>
	    <div class="clear"></div>
	    <!--jsp:include page="modulos/evento/evento.jsp" /-->
	    <iframe id="frameMenu" class="frame" src="modulos/publicidad/publicidad.jsp" scrolling="no"></iframe>
	</div>
</body>
</html>
