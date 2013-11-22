package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(EspacioFisicoController)
@Mock(EspacioFisico)
class EspacioFisicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/espacioFisico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.espacioFisicoInstanceList.size() == 0
        assert model.espacioFisicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.espacioFisicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.espacioFisicoInstance != null
        assert view == '/espacioFisico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/espacioFisico/show/1'
        assert controller.flash.message != null
        assert EspacioFisico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/espacioFisico/list'

        populateValidParams(params)
        def espacioFisico = new EspacioFisico(params)

        assert espacioFisico.save() != null

        params.id = espacioFisico.id

        def model = controller.show()

        assert model.espacioFisicoInstance == espacioFisico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/espacioFisico/list'

        populateValidParams(params)
        def espacioFisico = new EspacioFisico(params)

        assert espacioFisico.save() != null

        params.id = espacioFisico.id

        def model = controller.edit()

        assert model.espacioFisicoInstance == espacioFisico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/espacioFisico/list'

        response.reset()

        populateValidParams(params)
        def espacioFisico = new EspacioFisico(params)

        assert espacioFisico.save() != null

        // test invalid parameters in update
        params.id = espacioFisico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/espacioFisico/edit"
        assert model.espacioFisicoInstance != null

        espacioFisico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/espacioFisico/show/$espacioFisico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        espacioFisico.clearErrors()

        populateValidParams(params)
        params.id = espacioFisico.id
        params.version = -1
        controller.update()

        assert view == "/espacioFisico/edit"
        assert model.espacioFisicoInstance != null
        assert model.espacioFisicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/espacioFisico/list'

        response.reset()

        populateValidParams(params)
        def espacioFisico = new EspacioFisico(params)

        assert espacioFisico.save() != null
        assert EspacioFisico.count() == 1

        params.id = espacioFisico.id

        controller.delete()

        assert EspacioFisico.count() == 0
        assert EspacioFisico.get(espacioFisico.id) == null
        assert response.redirectedUrl == '/espacioFisico/list'
    }
}
