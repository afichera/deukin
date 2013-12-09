<%@ page import="com.deukin.PlanEstudio" %>



<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'identificacion', 'error')} required  row">
	<label for="identificacion" class="control-label col-lg-2">
		<g:message code="planEstudio.identificacion.label" default="Identificacion" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:textField name="identificacion" required="" value="${planEstudioInstance?.identificacion}"/>
	</div>
</div>
 <g:if test="${params.action == 'edit'}">
<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'estado', 'error')} required  row">
	<label for="estado" class="control-label col-lg-2">
		<g:message code="planEstudio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="estado" required="" from="${com.deukin.EstadoDeCreacion?.values()}" keys="${com.deukin.EstadoDeCreacion.values()*.name()}" required="" value="${planEstudioInstance?.estado?.name()}" />
	</div>
</div>
</g:if>
<g:else>
<g:hiddenField id ="estado" required="" name ="estado" value="BORRADOR"/>

</g:else>
<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'cantidadPeriodosAcademicos', 'error')}   row">
	<label for="cantidadPeriodosAcademicos" class="control-label col-lg-2">
		<g:message code="planEstudio.cantidadPeriodosAcademicos.label" default="Cantidad Periodos Academicos" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField type="number"  name="cantidadPeriodosAcademicos" value="${planEstudioInstance.cantidadPeriodosAcademicos}" class="form-control" onkeyup="soloNumeros(this,'#validaCantidadPeriodosAcademicos')"/>
	<span class="alert alert-error" id="validaCantidadPeriodosAcademicos" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'carrera', 'error')} required  row">
	<label for="carrera" class="control-label col-lg-2">
		<g:message code="planEstudio.carrera.label" default="Carrera" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	
	<g:hiddenField id ="carrera.id" name ="carrera.id" value="${planEstudioInstance?.carrera?.id}"/>
	<richui:autoComplete name="carreraTitulo" minQueryLength="2" onItemSelect="eligeCarrera(id)" value="${planEstudioInstance?.carrera}"
		action="${createLinkTo('dir': 'planEstudio/searchCarrerasAutocomplete')}" forceSelection="false"  class="form-control required" /></div>
	
	
	
<%--	<g:select id="carrera" name="carrera.id" from="${com.deukin.Carrera.list()}" optionKey="id" required="" value="${planEstudioInstance?.carrera?.id}" class="many-to-one"/>--%>
	</div>



