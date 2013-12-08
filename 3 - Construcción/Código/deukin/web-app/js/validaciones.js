function soloNumeros(value, span) {
	var valor = value.value;
	if (!$.isNumeric(valor) && valor != "") {
		$(span).show(500)
	} else {
		$(span).hide(500)
	}
}

$(function() {
	$(".required").each(function(index) {
		jQuery(this).attr("required", "required")
	})
});