<%@ page import="com.deukin.ObjetivoEspecifico"%>



<div
	class="fieldcontain ${hasErrors(bean: objetivoEspecificoInstance, field: 'descripcion', 'error')} row">
	<label for="descripcion" class="control-label col-lg-2"> <g:message
			code="objetivoEspecifico.descripcion.label" default="Descripcion" />

	</label>
	<div class="col-lg-10">
	<g:textField name="descripcion"
		value="${objetivoEspecificoInstance?.descripcion}" required="" />
		</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: objetivoEspecificoInstance, field: 'materia', 'error')} required row">
	<label for="materia" class="control-label col-lg-2"> <g:message
			code="objetivoEspecifico.materia.label" default="Materia" />:

	</label>
	<div class="col-lg-10">
		${objetivoEspecificoInstance?.materia?.toString()}
		<g:hiddenField id="materia" name="materia.id" optionKey="id"
			required="" value="${objetivoEspecificoInstance?.materia?.id}"
			class="many-to-one" required="" />
	</div>
</div>

