package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(ObjetivoController)
@Mock(Objetivo)
class ObjetivoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/objetivo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.objetivoInstanceList.size() == 0
        assert model.objetivoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.objetivoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.objetivoInstance != null
        assert view == '/objetivo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/objetivo/show/1'
        assert controller.flash.message != null
        assert Objetivo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivo/list'

        populateValidParams(params)
        def objetivo = new Objetivo(params)

        assert objetivo.save() != null

        params.id = objetivo.id

        def model = controller.show()

        assert model.objetivoInstance == objetivo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivo/list'

        populateValidParams(params)
        def objetivo = new Objetivo(params)

        assert objetivo.save() != null

        params.id = objetivo.id

        def model = controller.edit()

        assert model.objetivoInstance == objetivo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/objetivo/list'

        response.reset()

        populateValidParams(params)
        def objetivo = new Objetivo(params)

        assert objetivo.save() != null

        // test invalid parameters in update
        params.id = objetivo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/objetivo/edit"
        assert model.objetivoInstance != null

        objetivo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/objetivo/show/$objetivo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        objetivo.clearErrors()

        populateValidParams(params)
        params.id = objetivo.id
        params.version = -1
        controller.update()

        assert view == "/objetivo/edit"
        assert model.objetivoInstance != null
        assert model.objetivoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/objetivo/list'

        response.reset()

        populateValidParams(params)
        def objetivo = new Objetivo(params)

        assert objetivo.save() != null
        assert Objetivo.count() == 1

        params.id = objetivo.id

        controller.delete()

        assert Objetivo.count() == 0
        assert Objetivo.get(objetivo.id) == null
        assert response.redirectedUrl == '/objetivo/list'
    }
}
