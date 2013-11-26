package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(PlanEstudioController)
@Mock(PlanEstudio)
class PlanEstudioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/planEstudio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.planEstudioInstanceList.size() == 0
        assert model.planEstudioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.planEstudioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.planEstudioInstance != null
        assert view == '/planEstudio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/planEstudio/show/1'
        assert controller.flash.message != null
        assert PlanEstudio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/planEstudio/list'

        populateValidParams(params)
        def planEstudio = new PlanEstudio(params)

        assert planEstudio.save() != null

        params.id = planEstudio.id

        def model = controller.show()

        assert model.planEstudioInstance == planEstudio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/planEstudio/list'

        populateValidParams(params)
        def planEstudio = new PlanEstudio(params)

        assert planEstudio.save() != null

        params.id = planEstudio.id

        def model = controller.edit()

        assert model.planEstudioInstance == planEstudio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/planEstudio/list'

        response.reset()

        populateValidParams(params)
        def planEstudio = new PlanEstudio(params)

        assert planEstudio.save() != null

        // test invalid parameters in update
        params.id = planEstudio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/planEstudio/edit"
        assert model.planEstudioInstance != null

        planEstudio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/planEstudio/show/$planEstudio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        planEstudio.clearErrors()

        populateValidParams(params)
        params.id = planEstudio.id
        params.version = -1
        controller.update()

        assert view == "/planEstudio/edit"
        assert model.planEstudioInstance != null
        assert model.planEstudioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/planEstudio/list'

        response.reset()

        populateValidParams(params)
        def planEstudio = new PlanEstudio(params)

        assert planEstudio.save() != null
        assert PlanEstudio.count() == 1

        params.id = planEstudio.id

        controller.delete()

        assert PlanEstudio.count() == 0
        assert PlanEstudio.get(planEstudio.id) == null
        assert response.redirectedUrl == '/planEstudio/list'
    }
}
