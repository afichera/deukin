package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(InscripcionInstitucionController)
@Mock(InscripcionInstitucion)
class InscripcionInstitucionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inscripcionInstitucion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inscripcionInstitucionInstanceList.size() == 0
        assert model.inscripcionInstitucionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inscripcionInstitucionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inscripcionInstitucionInstance != null
        assert view == '/inscripcionInstitucion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inscripcionInstitucion/show/1'
        assert controller.flash.message != null
        assert InscripcionInstitucion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inscripcionInstitucion/list'

        populateValidParams(params)
        def inscripcionInstitucion = new InscripcionInstitucion(params)

        assert inscripcionInstitucion.save() != null

        params.id = inscripcionInstitucion.id

        def model = controller.show()

        assert model.inscripcionInstitucionInstance == inscripcionInstitucion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inscripcionInstitucion/list'

        populateValidParams(params)
        def inscripcionInstitucion = new InscripcionInstitucion(params)

        assert inscripcionInstitucion.save() != null

        params.id = inscripcionInstitucion.id

        def model = controller.edit()

        assert model.inscripcionInstitucionInstance == inscripcionInstitucion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inscripcionInstitucion/list'

        response.reset()

        populateValidParams(params)
        def inscripcionInstitucion = new InscripcionInstitucion(params)

        assert inscripcionInstitucion.save() != null

        // test invalid parameters in update
        params.id = inscripcionInstitucion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inscripcionInstitucion/edit"
        assert model.inscripcionInstitucionInstance != null

        inscripcionInstitucion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inscripcionInstitucion/show/$inscripcionInstitucion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inscripcionInstitucion.clearErrors()

        populateValidParams(params)
        params.id = inscripcionInstitucion.id
        params.version = -1
        controller.update()

        assert view == "/inscripcionInstitucion/edit"
        assert model.inscripcionInstitucionInstance != null
        assert model.inscripcionInstitucionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inscripcionInstitucion/list'

        response.reset()

        populateValidParams(params)
        def inscripcionInstitucion = new InscripcionInstitucion(params)

        assert inscripcionInstitucion.save() != null
        assert InscripcionInstitucion.count() == 1

        params.id = inscripcionInstitucion.id

        controller.delete()

        assert InscripcionInstitucion.count() == 0
        assert InscripcionInstitucion.get(inscripcionInstitucion.id) == null
        assert response.redirectedUrl == '/inscripcionInstitucion/list'
    }
}
