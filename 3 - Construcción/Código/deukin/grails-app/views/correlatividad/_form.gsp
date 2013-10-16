<%@ page import="com.deukin.Correlatividad" %>



<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materiaPrincipal', 'error')} required">
	<label for="materiaPrincipal" class="control-label">
		<g:message code="correlatividad.materiaPrincipal.label" default="Materia Principal" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id ="materiaPrincipal.id" name ="materiaPrincipal.id" value=""/>
	<richui:autoComplete name="materiaPrincipalNombre" minQueryLength="2" onItemSelect="eligeMateriaPrincipal(id)" value="${correlatividadInstance?.materiaPrincipal}"
		action="${createLinkTo('dir': 'correlatividad/searchMateriasCoordinador')}" forceSelection="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materiaPredecesora', 'error')} required">
	<label for="materiaPredecesora" class="control-label">
		<g:message code="correlatividad.materiaPredecesora.label" default="Materia Predecesora" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id ="materiaPredecesora.id" name ="materiaPredecesora.id" value=""/>
	<richui:autoComplete name="materiaPredecesoraNombre" minQueryLength="2" onItemSelect="eligeMateriaPredecesora(id)" value="${correlatividadInstance?.materiaPredecesora}"
		action="${createLinkTo('dir': 'correlatividad/searchMateriasCoordinador')}" forceSelection="true"/>
</div>

