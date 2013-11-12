<%@ page import="com.deukin.Equivalencia" %>

<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materiaPrincipal', 'error')} required">
	<label for="materiaPrincipal" class="control-label">
		<g:message code="equivalencia.materiaPrincipal.label" default="Materia Principal" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id ="materiaPrincipal.id" name ="materiaPrincipal.id" value="${equivalenciaInstance?.materiaPrincipal?.id}"/>
	<richui:autoComplete name="materiaPrincipalNombre" minQueryLength="2" onItemSelect="eligeMateriaPrincipal(id)" value="${equivalenciaInstance?.materiaPrincipal}"
		action="${createLinkTo('dir': 'equivalencia/searchMateriasCoordinador')}" forceSelection="false"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materiaEquivalente', 'error')} required">
	<label for="materiaEquivalente" class="control-label">
		<g:message code="equivalencia.materiaEquivalente.label" default="Materia Equivalente" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id ="materiaEquivalente.id" name ="materiaEquivalente.id" value="${equivalenciaInstance?.materiaEquivalente?.id}"/>
	<richui:autoComplete name="materiaEquivalenteNombre" minQueryLength="2" onItemSelect="eligeMateriaEquivalente(id)" value="${equivalenciaInstance?.materiaEquivalente}"
		action="${createLinkTo('dir': 'equivalencia/searchMaterias')}" forceSelection="false"/>	
</div>

