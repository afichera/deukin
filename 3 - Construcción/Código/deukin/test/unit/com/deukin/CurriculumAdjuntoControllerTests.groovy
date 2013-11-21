package com.deukin



import org.junit.*
import grails.test.mixin.*

@TestFor(CurriculumAdjuntoController)
@Mock(CurriculumAdjunto)
class CurriculumAdjuntoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/curriculumAdjunto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.curriculumAdjuntoInstanceList.size() == 0
        assert model.curriculumAdjuntoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.curriculumAdjuntoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.curriculumAdjuntoInstance != null
        assert view == '/curriculumAdjunto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/curriculumAdjunto/show/1'
        assert controller.flash.message != null
        assert CurriculumAdjunto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculumAdjunto/list'

        populateValidParams(params)
        def curriculumAdjunto = new CurriculumAdjunto(params)

        assert curriculumAdjunto.save() != null

        params.id = curriculumAdjunto.id

        def model = controller.show()

        assert model.curriculumAdjuntoInstance == curriculumAdjunto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculumAdjunto/list'

        populateValidParams(params)
        def curriculumAdjunto = new CurriculumAdjunto(params)

        assert curriculumAdjunto.save() != null

        params.id = curriculumAdjunto.id

        def model = controller.edit()

        assert model.curriculumAdjuntoInstance == curriculumAdjunto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculumAdjunto/list'

        response.reset()

        populateValidParams(params)
        def curriculumAdjunto = new CurriculumAdjunto(params)

        assert curriculumAdjunto.save() != null

        // test invalid parameters in update
        params.id = curriculumAdjunto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/curriculumAdjunto/edit"
        assert model.curriculumAdjuntoInstance != null

        curriculumAdjunto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/curriculumAdjunto/show/$curriculumAdjunto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        curriculumAdjunto.clearErrors()

        populateValidParams(params)
        params.id = curriculumAdjunto.id
        params.version = -1
        controller.update()

        assert view == "/curriculumAdjunto/edit"
        assert model.curriculumAdjuntoInstance != null
        assert model.curriculumAdjuntoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/curriculumAdjunto/list'

        response.reset()

        populateValidParams(params)
        def curriculumAdjunto = new CurriculumAdjunto(params)

        assert curriculumAdjunto.save() != null
        assert CurriculumAdjunto.count() == 1

        params.id = curriculumAdjunto.id

        controller.delete()

        assert CurriculumAdjunto.count() == 0
        assert CurriculumAdjunto.get(curriculumAdjunto.id) == null
        assert response.redirectedUrl == '/curriculumAdjunto/list'
    }
}
