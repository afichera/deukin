package com.deukin



import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Documento)
class DocumentoTests {

    void testDocumentoAsTextCuit() {
       def documento = new Documento()
	   documento.tipoDocumento = TipoDocumento.CUIT
	   documento.numero = 20282300142
	   
	   assert '20-28230014-2'.equals(documento.numeroAsText())	   
    }
	
	
}
