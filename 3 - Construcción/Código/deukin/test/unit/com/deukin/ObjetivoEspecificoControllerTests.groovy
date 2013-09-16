package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(ObjetivoEspecificoController)
@Mock(ObjetivoEspecifico)
class ObjetivoEspecificoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/objetivoEspecifico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.objetivoEspecificoInstanceList.size() == 0
        assert model.objetivoEspecificoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.objetivoEspecificoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.objetivoEspecificoInstance != null
        assert view == '/objetivoEspecifico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/objetivoEspecifico/show/1'
        assert controller.flash.message != null
        assert ObjetivoEspecifico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivoEspecifico/list'

        populateValidParams(params)
        def objetivoEspecifico = new ObjetivoEspecifico(params)

        assert objetivoEspecifico.save() != null

        params.id = objetivoEspecifico.id

        def model = controller.show()

        assert model.objetivoEspecificoInstance == objetivoEspecifico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivoEspecifico/list'

        populateValidParams(params)
        def objetivoEspecifico = new ObjetivoEspecifico(params)

        assert objetivoEspecifico.save() != null

        params.id = objetivoEspecifico.id

        def model = controller.edit()

        assert model.objetivoEspecificoInstance == objetivoEspecifico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivoEspecifico/list'

        response.reset()

        populateValidParams(params)
        def objetivoEspecifico = new ObjetivoEspecifico(params)

        assert objetivoEspecifico.save() != null

        // test invalid parameters in update
        params.id = objetivoEspecifico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/objetivoEspecifico/edit"
        assert model.objetivoEspecificoInstance != null

        objetivoEspecifico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/objetivoEspecifico/show/$objetivoEspecifico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        objetivoEspecifico.clearErrors()

        populateValidParams(params)
        params.id = objetivoEspecifico.id
        params.version = -1
        controller.update()

        assert view == "/objetivoEspecifico/edit"
        assert model.objetivoEspecificoInstance != null
        assert model.objetivoEspecificoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/objetivoEspecifico/list'

        response.reset()

        populateValidParams(params)
        def objetivoEspecifico = new ObjetivoEspecifico(params)

        assert objetivoEspecifico.save() != null
        assert ObjetivoEspecifico.count() == 1

        params.id = objetivoEspecifico.id

        controller.delete()

        assert ObjetivoEspecifico.count() == 0
        assert ObjetivoEspecifico.get(objetivoEspecifico.id) == null
        assert response.redirectedUrl == '/objetivoEspecifico/list'
    }
}
