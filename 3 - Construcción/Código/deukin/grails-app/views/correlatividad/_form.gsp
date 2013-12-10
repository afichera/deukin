<%@ page import="com.deukin.Correlatividad" %>



<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materiaPrincipal', 'error')} required row">
	<label for="materiaPrincipal" class="control-label col-lg-2">
		<g:message code="correlatividad.materiaPrincipal.label" default="Materia Principal" />: 
	</label>
<div class="col-lg-10">
	<g:hiddenField id ="materiaPrincipal.id" name ="materiaPrincipal.id" value="${correlatividadInstance?.materiaPrincipal?.id}"/>
	<richui:autoComplete name="materiaPrincipalNombre" onItemSelect="eligeMateriaPrincipal(id)" 
		value="${correlatividadInstance?.materiaPrincipal?.toString()}" required="true"
		action="${createLinkTo('dir': 'correlatividad/searchMateriasCoordinador')}" forceSelection="true"/>

</div></div>

<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materiaPredecesora', 'error')} required row">
	<label for="materiaPredecesora" class="control-label col-lg-2">
		<g:message code="correlatividad.materiaPredecesora.label" default="Materia Predecesora" />: 
	</label>
	<div class="col-lg-10">
	<g:hiddenField id ="materiaPredecesora.id" name ="materiaPredecesora.id" value="${correlatividadInstance?.materiaPredecesora?.id}"/>
	<richui:autoComplete name="materiaPredecesoraNombre" minQueryLength="2" onItemSelect="eligeMateriaPredecesora(id)" value="${correlatividadInstance?.materiaPredecesora?.toString()}"
		action="${createLinkTo('dir': 'correlatividad/searchMateriasCoordinador')}" forceSelection="true" required="true"/>

</div></div>

