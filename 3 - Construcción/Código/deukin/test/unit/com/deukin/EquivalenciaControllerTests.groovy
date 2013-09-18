package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(EquivalenciaController)
@Mock(Equivalencia)
class EquivalenciaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/equivalencia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.equivalenciaInstanceList.size() == 0
        assert model.equivalenciaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.equivalenciaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.equivalenciaInstance != null
        assert view == '/equivalencia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/equivalencia/show/1'
        assert controller.flash.message != null
        assert Equivalencia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/equivalencia/list'

        populateValidParams(params)
        def equivalencia = new Equivalencia(params)

        assert equivalencia.save() != null

        params.id = equivalencia.id

        def model = controller.show()

        assert model.equivalenciaInstance == equivalencia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/equivalencia/list'

        populateValidParams(params)
        def equivalencia = new Equivalencia(params)

        assert equivalencia.save() != null

        params.id = equivalencia.id

        def model = controller.edit()

        assert model.equivalenciaInstance == equivalencia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/equivalencia/list'

        response.reset()

        populateValidParams(params)
        def equivalencia = new Equivalencia(params)

        assert equivalencia.save() != null

        // test invalid parameters in update
        params.id = equivalencia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/equivalencia/edit"
        assert model.equivalenciaInstance != null

        equivalencia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/equivalencia/show/$equivalencia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        equivalencia.clearErrors()

        populateValidParams(params)
        params.id = equivalencia.id
        params.version = -1
        controller.update()

        assert view == "/equivalencia/edit"
        assert model.equivalenciaInstance != null
        assert model.equivalenciaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/equivalencia/list'

        response.reset()

        populateValidParams(params)
        def equivalencia = new Equivalencia(params)

        assert equivalencia.save() != null
        assert Equivalencia.count() == 1

        params.id = equivalencia.id

        controller.delete()

        assert Equivalencia.count() == 0
        assert Equivalencia.get(equivalencia.id) == null
        assert response.redirectedUrl == '/equivalencia/list'
    }
}
