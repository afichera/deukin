package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(AsignacionPeriodoMateriaController)
@Mock(AsignacionPeriodoMateria)
class AsignacionPeriodoMateriaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asignacionPeriodoMateria/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.asignacionPeriodoMateriaInstanceList.size() == 0
        assert model.asignacionPeriodoMateriaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.asignacionPeriodoMateriaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.asignacionPeriodoMateriaInstance != null
        assert view == '/asignacionPeriodoMateria/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asignacionPeriodoMateria/show/1'
        assert controller.flash.message != null
        assert AsignacionPeriodoMateria.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asignacionPeriodoMateria/list'

        populateValidParams(params)
        def asignacionPeriodoMateria = new AsignacionPeriodoMateria(params)

        assert asignacionPeriodoMateria.save() != null

        params.id = asignacionPeriodoMateria.id

        def model = controller.show()

        assert model.asignacionPeriodoMateriaInstance == asignacionPeriodoMateria
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asignacionPeriodoMateria/list'

        populateValidParams(params)
        def asignacionPeriodoMateria = new AsignacionPeriodoMateria(params)

        assert asignacionPeriodoMateria.save() != null

        params.id = asignacionPeriodoMateria.id

        def model = controller.edit()

        assert model.asignacionPeriodoMateriaInstance == asignacionPeriodoMateria
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asignacionPeriodoMateria/list'

        response.reset()

        populateValidParams(params)
        def asignacionPeriodoMateria = new AsignacionPeriodoMateria(params)

        assert asignacionPeriodoMateria.save() != null

        // test invalid parameters in update
        params.id = asignacionPeriodoMateria.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asignacionPeriodoMateria/edit"
        assert model.asignacionPeriodoMateriaInstance != null

        asignacionPeriodoMateria.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asignacionPeriodoMateria/show/$asignacionPeriodoMateria.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asignacionPeriodoMateria.clearErrors()

        populateValidParams(params)
        params.id = asignacionPeriodoMateria.id
        params.version = -1
        controller.update()

        assert view == "/asignacionPeriodoMateria/edit"
        assert model.asignacionPeriodoMateriaInstance != null
        assert model.asignacionPeriodoMateriaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asignacionPeriodoMateria/list'

        response.reset()

        populateValidParams(params)
        def asignacionPeriodoMateria = new AsignacionPeriodoMateria(params)

        assert asignacionPeriodoMateria.save() != null
        assert AsignacionPeriodoMateria.count() == 1

        params.id = asignacionPeriodoMateria.id

        controller.delete()

        assert AsignacionPeriodoMateria.count() == 0
        assert AsignacionPeriodoMateria.get(asignacionPeriodoMateria.id) == null
        assert response.redirectedUrl == '/asignacionPeriodoMateria/list'
    }
}
