<%@ page import="com.deukin.Equivalencia" %>

<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materiaPrincipal', 'error')} required row">
	<label for="materiaPrincipal" class="control-label col-lg-2">
		<g:message code="equivalencia.materiaPrincipal.label" default="Materia Principal" />: 
		
	</label>
	<div class="col-lg-10">
	<g:hiddenField id ="materiaPrincipal.id" name ="materiaPrincipal.id" value="${equivalenciaInstance?.materiaPrincipal?.id}"/>
	<richui:autoComplete name="materiaPrincipalNombre" minQueryLength="2" onItemSelect="eligeMateriaPrincipal(id)" value="${equivalenciaInstance?.materiaPrincipal}"
		action="${createLinkTo('dir': 'equivalencia/searchMateriasCoordinador')}" forceSelection="false"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materiaEquivalente', 'error')} required row">
	<label for="materiaEquivalente" class="control-label col-lg-2">
		<g:message code="equivalencia.materiaEquivalente.label" default="Materia Equivalente" />:
		
	</label>
	<div class="col-lg-10">
	<g:hiddenField id ="materiaEquivalente.id" name ="materiaEquivalente.id" value="${equivalenciaInstance?.materiaEquivalente?.id}"/>
	<richui:autoComplete name="materiaEquivalenteNombre" minQueryLength="2" onItemSelect="eligeMateriaEquivalente(id)" value="${equivalenciaInstance?.materiaEquivalente}"
		action="${createLinkTo('dir': 'equivalencia/searchMaterias')}" forceSelection="false"/>	
</div>
</div>

