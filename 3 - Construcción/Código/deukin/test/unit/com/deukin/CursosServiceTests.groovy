package com.deukin



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(CursosService)
class CursosServiceTests {
	
	
    void testCuentaOK() {
        def cantidadHoras = 40
		def cantidadHorasMayor = 80		
		assert cantidadHorasMayor > cantidadHoras
    }
}
