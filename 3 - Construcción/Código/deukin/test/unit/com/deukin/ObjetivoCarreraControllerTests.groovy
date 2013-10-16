package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(ObjetivoCarreraController)
@Mock(ObjetivoCarrera)
class ObjetivoCarreraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/objetivoCarrera/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.objetivoCarreraInstanceList.size() == 0
        assert model.objetivoCarreraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.objetivoCarreraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.objetivoCarreraInstance != null
        assert view == '/objetivoCarrera/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/objetivoCarrera/show/1'
        assert controller.flash.message != null
        assert ObjetivoCarrera.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivoCarrera/list'

        populateValidParams(params)
        def objetivoCarrera = new ObjetivoCarrera(params)

        assert objetivoCarrera.save() != null

        params.id = objetivoCarrera.id

        def model = controller.show()

        assert model.objetivoCarreraInstance == objetivoCarrera
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivoCarrera/list'

        populateValidParams(params)
        def objetivoCarrera = new ObjetivoCarrera(params)

        assert objetivoCarrera.save() != null

        params.id = objetivoCarrera.id

        def model = controller.edit()

        assert model.objetivoCarreraInstance == objetivoCarrera
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivoCarrera/list'

        response.reset()

        populateValidParams(params)
        def objetivoCarrera = new ObjetivoCarrera(params)

        assert objetivoCarrera.save() != null

        // test invalid parameters in update
        params.id = objetivoCarrera.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/objetivoCarrera/edit"
        assert model.objetivoCarreraInstance != null

        objetivoCarrera.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/objetivoCarrera/show/$objetivoCarrera.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        objetivoCarrera.clearErrors()

        populateValidParams(params)
        params.id = objetivoCarrera.id
        params.version = -1
        controller.update()

        assert view == "/objetivoCarrera/edit"
        assert model.objetivoCarreraInstance != null
        assert model.objetivoCarreraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/objetivoCarrera/list'

        response.reset()

        populateValidParams(params)
        def objetivoCarrera = new ObjetivoCarrera(params)

        assert objetivoCarrera.save() != null
        assert ObjetivoCarrera.count() == 1

        params.id = objetivoCarrera.id

        controller.delete()

        assert ObjetivoCarrera.count() == 0
        assert ObjetivoCarrera.get(objetivoCarrera.id) == null
        assert response.redirectedUrl == '/objetivoCarrera/list'
    }
}
