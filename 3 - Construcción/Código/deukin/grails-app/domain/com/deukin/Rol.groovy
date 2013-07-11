package com.deukin

/**
 * 
 * @author Ale Mobile
 *
 */
class Rol {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
