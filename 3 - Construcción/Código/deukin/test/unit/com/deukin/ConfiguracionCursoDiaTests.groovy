package com.deukin



import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ConfiguracionCursoDia)
class ConfiguracionCursoDiaTests {

    void testSumaHorasPositivasOK() {
		ConfiguracionCursoDia configuracion = new ConfiguracionCursoDia()
		configuracion.horaInicio=6
		configuracion.horaFin=7
		configuracion.minutosInicio=0
		configuracion.minutosFin=10
		
		assert configuracion.getSumaHoras() == (70/60)
		
		
    }
	
	void testSumaHorasNegativasOK() {
		ConfiguracionCursoDia configuracion = new ConfiguracionCursoDia()
		configuracion.horaInicio=6
		configuracion.horaFin=7
		configuracion.minutosInicio=10
		configuracion.minutosFin=0
		
		assert configuracion.getSumaHoras() == (50/60)
		
	 }
	
	void testSumaHorasIgualesOK() {
	
		ConfiguracionCursoDia configuracion = new ConfiguracionCursoDia()
		configuracion.horaInicio=6
		configuracion.horaFin=6
		configuracion.minutosInicio=0
		configuracion.minutosFin=0
		
		assert configuracion.getSumaHoras() == 0
		
	}
	
	void testDiaDesfasadoOK() {
		
			ConfiguracionCursoDia configuracion = new ConfiguracionCursoDia()
			configuracion.horaInicio=22
			configuracion.horaFin=2
			configuracion.minutosInicio=0
			configuracion.minutosFin=0
			
			assert configuracion.getSumaHoras() == 4

			println  Float.parseFloat(TipoPorcentajeAsignacion.ASIGNADO_AL_100.name) *40
			println  Float.parseFloat(TipoPorcentajeAsignacion.ASIGNADO_AL_50.name) *30
			
		}
	
}
