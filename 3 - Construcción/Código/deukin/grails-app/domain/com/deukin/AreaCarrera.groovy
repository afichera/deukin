package com.deukin

class AreaCarrera {

	def nombre	
	AreaCarrera areaMadre	
	
    static constraints = {
		nombre blank:false, maxSize:100
		areaMadre nullable:true
    }
}
