package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(MateriaController)
@Mock(Materia)
class MateriaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/materia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materiaInstanceList.size() == 0
        assert model.materiaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.materiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.materiaInstance != null
        assert view == '/materia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/materia/show/1'
        assert controller.flash.message != null
        assert Materia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/materia/list'

        populateValidParams(params)
        def materia = new Materia(params)

        assert materia.save() != null

        params.id = materia.id

        def model = controller.show()

        assert model.materiaInstance == materia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/materia/list'

        populateValidParams(params)
        def materia = new Materia(params)

        assert materia.save() != null

        params.id = materia.id

        def model = controller.edit()

        assert model.materiaInstance == materia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/materia/list'

        response.reset()

        populateValidParams(params)
        def materia = new Materia(params)

        assert materia.save() != null

        // test invalid parameters in update
        params.id = materia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/materia/edit"
        assert model.materiaInstance != null

        materia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/materia/show/$materia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        materia.clearErrors()

        populateValidParams(params)
        params.id = materia.id
        params.version = -1
        controller.update()

        assert view == "/materia/edit"
        assert model.materiaInstance != null
        assert model.materiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/materia/list'

        response.reset()

        populateValidParams(params)
        def materia = new Materia(params)

        assert materia.save() != null
        assert Materia.count() == 1

        params.id = materia.id

        controller.delete()

        assert Materia.count() == 0
        assert Materia.get(materia.id) == null
        assert response.redirectedUrl == '/materia/list'
    }
}
