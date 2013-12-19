<%@ page import="com.deukin.EspacioFisico" %>



<div class="fieldcontain ${hasErrors(bean: espacioFisicoInstance, field: 'numero', 'error')} required">
	<label for="numero" class="control-label col-lg-2">
		<g:message code="espacioFisico.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:textField name="numero" class="form-control" type="number" value="${espacioFisicoInstance.numero}" required="" onkeyup="soloNumeros(this,'#validaNumeroAula')"/>
	<span class="alert alert-error" id="validaNumeroAula" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: espacioFisicoInstance, field: 'ubicacion', 'error')} ">
	<label for="ubicacion" class="control-label col-lg-2">
		<g:message code="espacioFisico.ubicacion.label" default="Ubicacion" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="ubicacion"  class="form-control" value="${espacioFisicoInstance?.ubicacion}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: espacioFisicoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones" class="control-label col-lg-2">
		<g:message code="espacioFisico.observaciones.label" default="Observaciones" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="observaciones"  class="form-control" value="${espacioFisicoInstance?.observaciones}"/>
	</div>
</div>

