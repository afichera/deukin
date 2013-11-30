package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(AsignacionDocenteCursoController)
@Mock(AsignacionDocenteCurso)
class AsignacionDocenteCursoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asignacionDocenteCurso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.asignacionDocenteCursoInstanceList.size() == 0
        assert model.asignacionDocenteCursoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.asignacionDocenteCursoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.asignacionDocenteCursoInstance != null
        assert view == '/asignacionDocenteCurso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asignacionDocenteCurso/show/1'
        assert controller.flash.message != null
        assert AsignacionDocenteCurso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asignacionDocenteCurso/list'

        populateValidParams(params)
        def asignacionDocenteCurso = new AsignacionDocenteCurso(params)

        assert asignacionDocenteCurso.save() != null

        params.id = asignacionDocenteCurso.id

        def model = controller.show()

        assert model.asignacionDocenteCursoInstance == asignacionDocenteCurso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asignacionDocenteCurso/list'

        populateValidParams(params)
        def asignacionDocenteCurso = new AsignacionDocenteCurso(params)

        assert asignacionDocenteCurso.save() != null

        params.id = asignacionDocenteCurso.id

        def model = controller.edit()

        assert model.asignacionDocenteCursoInstance == asignacionDocenteCurso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asignacionDocenteCurso/list'

        response.reset()

        populateValidParams(params)
        def asignacionDocenteCurso = new AsignacionDocenteCurso(params)

        assert asignacionDocenteCurso.save() != null

        // test invalid parameters in update
        params.id = asignacionDocenteCurso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asignacionDocenteCurso/edit"
        assert model.asignacionDocenteCursoInstance != null

        asignacionDocenteCurso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asignacionDocenteCurso/show/$asignacionDocenteCurso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asignacionDocenteCurso.clearErrors()

        populateValidParams(params)
        params.id = asignacionDocenteCurso.id
        params.version = -1
        controller.update()

        assert view == "/asignacionDocenteCurso/edit"
        assert model.asignacionDocenteCursoInstance != null
        assert model.asignacionDocenteCursoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asignacionDocenteCurso/list'

        response.reset()

        populateValidParams(params)
        def asignacionDocenteCurso = new AsignacionDocenteCurso(params)

        assert asignacionDocenteCurso.save() != null
        assert AsignacionDocenteCurso.count() == 1

        params.id = asignacionDocenteCurso.id

        controller.delete()

        assert AsignacionDocenteCurso.count() == 0
        assert AsignacionDocenteCurso.get(asignacionDocenteCurso.id) == null
        assert response.redirectedUrl == '/asignacionDocenteCurso/list'
    }
}
