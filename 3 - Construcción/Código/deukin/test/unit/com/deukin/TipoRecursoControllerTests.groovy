package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoRecursoController)
@Mock(TipoRecurso)
class TipoRecursoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoRecurso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoRecursoInstanceList.size() == 0
        assert model.tipoRecursoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoRecursoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoRecursoInstance != null
        assert view == '/tipoRecurso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoRecurso/show/1'
        assert controller.flash.message != null
        assert TipoRecurso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoRecurso/list'

        populateValidParams(params)
        def tipoRecurso = new TipoRecurso(params)

        assert tipoRecurso.save() != null

        params.id = tipoRecurso.id

        def model = controller.show()

        assert model.tipoRecursoInstance == tipoRecurso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoRecurso/list'

        populateValidParams(params)
        def tipoRecurso = new TipoRecurso(params)

        assert tipoRecurso.save() != null

        params.id = tipoRecurso.id

        def model = controller.edit()

        assert model.tipoRecursoInstance == tipoRecurso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoRecurso/list'

        response.reset()

        populateValidParams(params)
        def tipoRecurso = new TipoRecurso(params)

        assert tipoRecurso.save() != null

        // test invalid parameters in update
        params.id = tipoRecurso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoRecurso/edit"
        assert model.tipoRecursoInstance != null

        tipoRecurso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoRecurso/show/$tipoRecurso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoRecurso.clearErrors()

        populateValidParams(params)
        params.id = tipoRecurso.id
        params.version = -1
        controller.update()

        assert view == "/tipoRecurso/edit"
        assert model.tipoRecursoInstance != null
        assert model.tipoRecursoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoRecurso/list'

        response.reset()

        populateValidParams(params)
        def tipoRecurso = new TipoRecurso(params)

        assert tipoRecurso.save() != null
        assert TipoRecurso.count() == 1

        params.id = tipoRecurso.id

        controller.delete()

        assert TipoRecurso.count() == 0
        assert TipoRecurso.get(tipoRecurso.id) == null
        assert response.redirectedUrl == '/tipoRecurso/list'
    }
}
