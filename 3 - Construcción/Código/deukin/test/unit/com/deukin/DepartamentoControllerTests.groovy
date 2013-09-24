package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(DepartamentoController)
@Mock(Departamento)
class DepartamentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/departamento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.departamentoInstanceList.size() == 0
        assert model.departamentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.departamentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.departamentoInstance != null
        assert view == '/departamento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/departamento/show/1'
        assert controller.flash.message != null
        assert Departamento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/departamento/list'

        populateValidParams(params)
        def departamento = new Departamento(params)

        assert departamento.save() != null

        params.id = departamento.id

        def model = controller.show()

        assert model.departamentoInstance == departamento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/departamento/list'

        populateValidParams(params)
        def departamento = new Departamento(params)

        assert departamento.save() != null

        params.id = departamento.id

        def model = controller.edit()

        assert model.departamentoInstance == departamento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/departamento/list'

        response.reset()

        populateValidParams(params)
        def departamento = new Departamento(params)

        assert departamento.save() != null

        // test invalid parameters in update
        params.id = departamento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/departamento/edit"
        assert model.departamentoInstance != null

        departamento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/departamento/show/$departamento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        departamento.clearErrors()

        populateValidParams(params)
        params.id = departamento.id
        params.version = -1
        controller.update()

        assert view == "/departamento/edit"
        assert model.departamentoInstance != null
        assert model.departamentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/departamento/list'

        response.reset()

        populateValidParams(params)
        def departamento = new Departamento(params)

        assert departamento.save() != null
        assert Departamento.count() == 1

        params.id = departamento.id

        controller.delete()

        assert Departamento.count() == 0
        assert Departamento.get(departamento.id) == null
        assert response.redirectedUrl == '/departamento/list'
    }
}
