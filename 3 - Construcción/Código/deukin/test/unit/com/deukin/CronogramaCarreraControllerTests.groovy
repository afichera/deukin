package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(CronogramaCarreraController)
@Mock(CronogramaCarrera)
class CronogramaCarreraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cronogramaCarrera/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cronogramaCarreraInstanceList.size() == 0
        assert model.cronogramaCarreraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cronogramaCarreraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cronogramaCarreraInstance != null
        assert view == '/cronogramaCarrera/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cronogramaCarrera/show/1'
        assert controller.flash.message != null
        assert CronogramaCarrera.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cronogramaCarrera/list'

        populateValidParams(params)
        def cronogramaCarrera = new CronogramaCarrera(params)

        assert cronogramaCarrera.save() != null

        params.id = cronogramaCarrera.id

        def model = controller.show()

        assert model.cronogramaCarreraInstance == cronogramaCarrera
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cronogramaCarrera/list'

        populateValidParams(params)
        def cronogramaCarrera = new CronogramaCarrera(params)

        assert cronogramaCarrera.save() != null

        params.id = cronogramaCarrera.id

        def model = controller.edit()

        assert model.cronogramaCarreraInstance == cronogramaCarrera
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cronogramaCarrera/list'

        response.reset()

        populateValidParams(params)
        def cronogramaCarrera = new CronogramaCarrera(params)

        assert cronogramaCarrera.save() != null

        // test invalid parameters in update
        params.id = cronogramaCarrera.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cronogramaCarrera/edit"
        assert model.cronogramaCarreraInstance != null

        cronogramaCarrera.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cronogramaCarrera/show/$cronogramaCarrera.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cronogramaCarrera.clearErrors()

        populateValidParams(params)
        params.id = cronogramaCarrera.id
        params.version = -1
        controller.update()

        assert view == "/cronogramaCarrera/edit"
        assert model.cronogramaCarreraInstance != null
        assert model.cronogramaCarreraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cronogramaCarrera/list'

        response.reset()

        populateValidParams(params)
        def cronogramaCarrera = new CronogramaCarrera(params)

        assert cronogramaCarrera.save() != null
        assert CronogramaCarrera.count() == 1

        params.id = cronogramaCarrera.id

        controller.delete()

        assert CronogramaCarrera.count() == 0
        assert CronogramaCarrera.get(cronogramaCarrera.id) == null
        assert response.redirectedUrl == '/cronogramaCarrera/list'
    }
}
