package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(CorrelatividadController)
@Mock(Correlatividad)
class CorrelatividadControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/correlatividad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.correlatividadInstanceList.size() == 0
        assert model.correlatividadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.correlatividadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.correlatividadInstance != null
        assert view == '/correlatividad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/correlatividad/show/1'
        assert controller.flash.message != null
        assert Correlatividad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/correlatividad/list'

        populateValidParams(params)
        def correlatividad = new Correlatividad(params)

        assert correlatividad.save() != null

        params.id = correlatividad.id

        def model = controller.show()

        assert model.correlatividadInstance == correlatividad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/correlatividad/list'

        populateValidParams(params)
        def correlatividad = new Correlatividad(params)

        assert correlatividad.save() != null

        params.id = correlatividad.id

        def model = controller.edit()

        assert model.correlatividadInstance == correlatividad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/correlatividad/list'

        response.reset()

        populateValidParams(params)
        def correlatividad = new Correlatividad(params)

        assert correlatividad.save() != null

        // test invalid parameters in update
        params.id = correlatividad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/correlatividad/edit"
        assert model.correlatividadInstance != null

        correlatividad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/correlatividad/show/$correlatividad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        correlatividad.clearErrors()

        populateValidParams(params)
        params.id = correlatividad.id
        params.version = -1
        controller.update()

        assert view == "/correlatividad/edit"
        assert model.correlatividadInstance != null
        assert model.correlatividadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/correlatividad/list'

        response.reset()

        populateValidParams(params)
        def correlatividad = new Correlatividad(params)

        assert correlatividad.save() != null
        assert Correlatividad.count() == 1

        params.id = correlatividad.id

        controller.delete()

        assert Correlatividad.count() == 0
        assert Correlatividad.get(correlatividad.id) == null
        assert response.redirectedUrl == '/correlatividad/list'
    }
}
