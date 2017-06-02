<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Registro de Usuario</title>
    <meta id="viewport" name="viewport" content ="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link type="text/css" href="../../recursos/css/inicio.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../recursos/js/comun.js"></script>
    <script type="text/javascript">
	    function registrarse(formulario){
	    	document.getElementById("emailError").style.display = formulario.correoElectronicoPersonal.value!=formulario.confirmarCorreoElectronicoPersonal.value?"block":"none";
	    	document.getElementById("claveError").style.display = formulario.clave.value!=formulario.confirmarClave.value?"block":"none";
	    	if(formulario.correoElectronicoPersonal.value!=formulario.confirmarCorreoElectronicoPersonal.value || formulario.clave.value!=formulario.confirmarClave.value){
	    		return;
	    	}else{
	    		formulario.submit();
	    		return;
	    	}
	    }
	</script>
</head>
<body class="cuerpoSecundario">
	<div class="contenedor">
	 	<form method="post" action="../../servletRegistro">
			<div id="formulario" class="formNuevo">
                <fieldset class="fsNuevo">
                    <legend>Tus Datos Personales </legend>
                    <div>
                        <label>*Nombres:</label>
                        <input type="text" onkeypress="return sololet(event)" id="nombres" name="nombres" required/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    <div>
                        <label>*Apellidos:</label>
                        <input type="text" id="apellidos" onkeypress="return sololet(event)" name="apellidos" required/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    <div>
                        <label>*Cedula:</label>
                        <input type="number" id="cedula" onkeypress="return sololet(event)" name="cedula" pattern="[0-10]{10}" required/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    <div>
                        <label>Telefono:</label>
                        <input type="tel" id="telefono" onkeypress="return sololet(event)" name="telefono"/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    <div>
                        <label>Celular:</label>
                        <input type="tel" id="celular" onkeypress="return sololet(event)" name="celular"/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    <div>
                        <label>*Fecha de Nacimiento:</label>
                        <input type="date" title="Podrás ver y jugar en los campeonatos de tu sexo y categoria de edad " name="fechaNacimiento" id="fechaNacimiento" required/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    <div>
                        <label>*Género:</label>
                        <select id="genero" name="genero" required>
                        	<option value="">Seleccione una opción</option>
                        	<option value="M">Masculino</option>
                        	<option value="F">Femenino</option>
                        </select>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
				   <div>
				       <label>*Departamento:</label>
					   <select required id="idDepartamento" name="idDepartamento" onchange="traerResultados('idDepartamento', 'idMunicipio',this.form)" required >
						    <option value="">Selecciona una opción.</option>
						    <option value=25000>Cundinamarca</option>
							<option value=19000>Cauca</option>
							<option value=52000>Narino</option>
							<option value=76000>Valle</option>
							<option value=5000>Antioquia</option>
							<option value=23000>Cordoba</option>
							<option value=8000>Atlantico</option>
							<option value=13000>Bolivar</option>
							<option value=20000>Cesar</option>
							<option value=44000>La Guajira</option>
							<option value=70000>Sucre</option>
							<option value=17000>Caldas</option>
							<option value=63000>Quindio</option>
							<option value=66000>Risaralda</option>
							<option value=54000>Norte Santander</option>
							<option value=68000>Santander</option>
							<option value=88000>Arch.Sn Andres Y Pro</option>
							<option value=15000>Boyaca</option>
							<option value=41000>Huila</option>
							<option value=50000>Meta</option>
							<option value=73000>Tolima</option>
							<option value=91000>Amazonas</option>
							<option value=81000>Arauca</option>
							<option value=18000>Caqueta</option>
							<option value=85000>Casanare</option>
							<option value=27000>Choco</option>
							<option value=95000>Guaviare</option>
							<option value=94000>Guainia</option>
							<option value=47000>Magdalena</option>
							<option value=86000>Putumayo</option>
							<option value=97000>Vaupes</option>
							<option value=99000>Vichada</option>
							<option value=11000>Bogota D.C.</option>
					   </select>
					   <label class="altoCero">&nbsp;</label> 
					   <div class="clear"></div>
				   </div>
				   <div>
				       <label>*Ciudad:</label> 
					   <select required id="idMunicipio" name="idMunicipio" required  >
					       <option value="">Selecciona una opción.</option>
					       <option value=11001>Bogotá D.C</option>
					   </select>
					   <div class="clear"></div>
				   </div>
    
					<div class="clear"></div> 
				   	<script type="text/javascript">
						   	document.forms[0].idPais.value=48;
							document.forms[0].idDepartamento.value=11000;
							document.forms[0].idMunicipio.value=11001;
							document.forms[0].idPuntoCardinal.value="";	
							//Solo se envian ids de elementos de formulario y de un solo formulario.
					</script>
                </fieldset>
					
                <fieldset class="fsNuevo">
                    <legend>Datos de tu Cuenta</legend>
                    <div oncopy="return false;">
                        <label>*Tu Correo Electrónico:</label>
                        <input type="email" name="correoElectronicoPersonal" id="correoElectronicoPersonal" required/>
                        <label class="altoCero">&nbsp;</label>                         
                        <span class="error" style="display:none" id="emailError">No coinciden los dos correos electronicos.</span>
                        <div class="clear"></div>
                    </div>
                    <div onpaste="return false;">
                        <label>*Confirmar Correo Electrónico:</label>
                        <input type="email" name="confirmarCorreoElectronicoPersonal" id="confirmarCorreoElectronicoPersonal" required/>
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                    </br>
                    <div oncopy="return false;">
                        <label>*Contraseña:</label>
                        <input type="password" id="clave" name="clave"  required minimum="6" />
						<label class="altoCero">&nbsp;</label> 
                        <span class="error" style="display:none" id="claveError">Las contraseñas no coinciden.</span>
                        <div class="clear"></div>
                    </div>
                    <div onpaste="return false;">
						<label>*Confirmar Contraseña:</label>
                       	<input type="password" id="confirmarClave" name="confirmarClave" required minimum="6"/>                      
                        <label class="altoCero">&nbsp;</label> 
                        <div class="clear"></div>
                    </div>
                </fieldset>
                    <div class="clear"></div>              
                    <div class="">
                    	<input type="button" class="boton" value="REGISTRARME" onclick="registrarse(this.form)"/>
                        <input type="button" class="boton" value="CANCELAR" onclick="window.close()"/>
                    </div>
                    <div class="clear"></div>
                </div>
    	</form>
	</div>
</body>
</html>


