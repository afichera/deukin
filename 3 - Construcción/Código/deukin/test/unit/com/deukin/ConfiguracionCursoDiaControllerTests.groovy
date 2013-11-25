package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(ConfiguracionCursoDiaController)
@Mock(ConfiguracionCursoDia)
class ConfiguracionCursoDiaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/configuracionCursoDia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.configuracionCursoDiaInstanceList.size() == 0
        assert model.configuracionCursoDiaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.configuracionCursoDiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.configuracionCursoDiaInstance != null
        assert view == '/configuracionCursoDia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/configuracionCursoDia/show/1'
        assert controller.flash.message != null
        assert ConfiguracionCursoDia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracionCursoDia/list'

        populateValidParams(params)
        def configuracionCursoDia = new ConfiguracionCursoDia(params)

        assert configuracionCursoDia.save() != null

        params.id = configuracionCursoDia.id

        def model = controller.show()

        assert model.configuracionCursoDiaInstance == configuracionCursoDia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracionCursoDia/list'

        populateValidParams(params)
        def configuracionCursoDia = new ConfiguracionCursoDia(params)

        assert configuracionCursoDia.save() != null

        params.id = configuracionCursoDia.id

        def model = controller.edit()

        assert model.configuracionCursoDiaInstance == configuracionCursoDia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracionCursoDia/list'

        response.reset()

        populateValidParams(params)
        def configuracionCursoDia = new ConfiguracionCursoDia(params)

        assert configuracionCursoDia.save() != null

        // test invalid parameters in update
        params.id = configuracionCursoDia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/configuracionCursoDia/edit"
        assert model.configuracionCursoDiaInstance != null

        configuracionCursoDia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/configuracionCursoDia/show/$configuracionCursoDia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        configuracionCursoDia.clearErrors()

        populateValidParams(params)
        params.id = configuracionCursoDia.id
        params.version = -1
        controller.update()

        assert view == "/configuracionCursoDia/edit"
        assert model.configuracionCursoDiaInstance != null
        assert model.configuracionCursoDiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/configuracionCursoDia/list'

        response.reset()

        populateValidParams(params)
        def configuracionCursoDia = new ConfiguracionCursoDia(params)

        assert configuracionCursoDia.save() != null
        assert ConfiguracionCursoDia.count() == 1

        params.id = configuracionCursoDia.id

        controller.delete()

        assert ConfiguracionCursoDia.count() == 0
        assert ConfiguracionCursoDia.get(configuracionCursoDia.id) == null
        assert response.redirectedUrl == '/configuracionCursoDia/list'
    }
}
