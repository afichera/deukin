<%@ page import="com.deukin.Equivalencia" %>



<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materia', 'error')} ">
	<label for="materia" class="control-label">
		<g:message code="equivalencia.materia.label" default="Materia" />
		
	</label>
	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" value="${equivalenciaInstance?.materia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'equivalentes', 'error')} ">
	<label for="equivalentes" class="control-label">
		<g:message code="equivalencia.equivalentes.label" default="Equivalentes" />
		
	</label>
	<g:select name="equivalentes" from="${com.deukin.Materia.list()}" multiple="multiple" optionKey="id" size="5" value="${equivalenciaInstance?.equivalentes*.id}" class="many-to-many"/>
</div>

