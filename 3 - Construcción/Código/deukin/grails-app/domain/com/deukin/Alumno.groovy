package com.deukin

import gorm.AuditStamp
/**
 * Representa un alumno de la institucion
 * @author Ale Mobile
 *
 */
@AuditStamp
class Alumno extends Persona {

    static constraints = {
    }
}
