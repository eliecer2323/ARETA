<%
String correo = "";
if(request.getAttribute("correo")!=null){
	correo = (String) request.getAttribute("correo");
}
System.out.println("correo: "+request.getAttribute("correo"));
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>ARETA</title>
    <link href="recursos/css/inicio.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="recursos/js/comun.js"></script>
</head>
<body>
    <div id="panel">
        <div class="">
        	<%if(correo.equals("")){ %>
            <div class="panelIzq" >
                <form class="" method="post" action="servletInicioSesion">
                    <h2>Iniciar Sesión</h2>
                    <label class="" >E-mail:</label>
                    <input type="email" id="correoElectronico" name="correoElectronico" class="" required />
                    <label class="altoCero">&nbsp;</label> 
                    <div class="clear"></div>
                    <label class="" >Contraseña:</label>
                   	<input type="password" id="clave" name="clave" class="" required/>
                   	<label class="altoCero">&nbsp;</label> 
                    <div class="clear"></div>
                   	<input type="submit" value="Entrar" class=""/>
                    <a href="#" onclick="window.open('/GYF-web/modulos/a/a5.jsp','recordar','height=335,width=472,left=300,location=no,titlebar=no,toolbar=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no')"  class="lost-pwd">&iquest;Olvidaste la contraseña?</a>
                </form>
            </div>
            <div class="panelDer">
                <form>
                    <h2>¿Aún no estas registrado?</h2>        
                    <input value="Regístrate" type="button" class="" onclick="window.open('modulos/usuario/registro.jsp','registro','height=575,width=509,left=300,location=no,titlebar=no,toolbar=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,modal=yes')"/>
                </form>
            </div>
            <%} else { %>
            <div class="">
            	<span><%="Bienvenido "+correo%></span>
            </div>
            <%} %>
            <div class="clear"></div>
        </div>
    </div> 
	
	<div id="contenedor" class="">
	    <div id="menuPrincipal" class="">
	        <div id="" >
	            <ul id="" class="menu">
	                <li><a href="#" onclick="irMenu('modulos/publicidad/publicidad.jsp')">Inicio</a></li>
	                <li><a href="#" onclick="irMenu('modulos/comunidad/comunidad.jsp')">Consultar Afectado</a></li>
	                <li><a href="#" onclick="irMenu('modulos/evento/evento.jsp')">Eventos</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="clear"></div>
	    <iframe id="frameMenu" src="modulos/publicidad/publicidad.jsp" height="100%" width="100%"></iframe>
	</div>
</body>
</html>
