package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(AreaCarreraController)
@Mock(AreaCarrera)
class AreaCarreraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/areaCarrera/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.areaCarreraInstanceList.size() == 0
        assert model.areaCarreraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.areaCarreraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.areaCarreraInstance != null
        assert view == '/areaCarrera/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/areaCarrera/show/1'
        assert controller.flash.message != null
        assert AreaCarrera.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/areaCarrera/list'

        populateValidParams(params)
        def areaCarrera = new AreaCarrera(params)

        assert areaCarrera.save() != null

        params.id = areaCarrera.id

        def model = controller.show()

        assert model.areaCarreraInstance == areaCarrera
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/areaCarrera/list'

        populateValidParams(params)
        def areaCarrera = new AreaCarrera(params)

        assert areaCarrera.save() != null

        params.id = areaCarrera.id

        def model = controller.edit()

        assert model.areaCarreraInstance == areaCarrera
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/areaCarrera/list'

        response.reset()

        populateValidParams(params)
        def areaCarrera = new AreaCarrera(params)

        assert areaCarrera.save() != null

        // test invalid parameters in update
        params.id = areaCarrera.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/areaCarrera/edit"
        assert model.areaCarreraInstance != null

        areaCarrera.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/areaCarrera/show/$areaCarrera.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        areaCarrera.clearErrors()

        populateValidParams(params)
        params.id = areaCarrera.id
        params.version = -1
        controller.update()

        assert view == "/areaCarrera/edit"
        assert model.areaCarreraInstance != null
        assert model.areaCarreraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/areaCarrera/list'

        response.reset()

        populateValidParams(params)
        def areaCarrera = new AreaCarrera(params)

        assert areaCarrera.save() != null
        assert AreaCarrera.count() == 1

        params.id = areaCarrera.id

        controller.delete()

        assert AreaCarrera.count() == 0
        assert AreaCarrera.get(areaCarrera.id) == null
        assert response.redirectedUrl == '/areaCarrera/list'
    }
}
