package com.deukin

class AreaCarrera {

	def nombre	
	AreaCarrera areaMadre	
	
    static constraints = {
		nombre blank:false
		areaMadre nulleable:true
    }
}
