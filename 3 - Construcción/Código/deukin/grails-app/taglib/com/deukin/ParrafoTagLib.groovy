package com.deukin

class ParrafoTagLib {
	def parrafo = {attrs, body ->
		def str = attrs['string']
		String[] stringArray = str.split('\n')
		stringArray.each {
		   out << """<p> ${it} </p>"""
      } 
   } 
}
