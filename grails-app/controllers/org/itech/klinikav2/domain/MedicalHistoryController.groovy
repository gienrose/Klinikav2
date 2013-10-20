package org.itech.klinikav2.domain

import org.springframework.dao.DataIntegrityViolationException

/**
 * MedicalHistoryController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class MedicalHistoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [medicalHistoryInstanceList: MedicalHistory.list(params), medicalHistoryInstanceTotal: MedicalHistory.count()]
    }

    def create() {
        [medicalHistoryInstance: new MedicalHistory(params)]
    }

    def save() {
        def medicalHistoryInstance = new MedicalHistory(params)
        if (!medicalHistoryInstance.save(flush: true)) {
            render(view: "create", model: [medicalHistoryInstance: medicalHistoryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), medicalHistoryInstance.id])
        redirect(action: "show", id: medicalHistoryInstance.id)
    }

    def show() {
        def medicalHistoryInstance = MedicalHistory.get(params.id)
        if (!medicalHistoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
            redirect(action: "list")
            return
        }

        [medicalHistoryInstance: medicalHistoryInstance]
    }

    def edit() {
        def medicalHistoryInstance = MedicalHistory.get(params.id)
        if (!medicalHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
            redirect(action: "list")
            return
        }

        [medicalHistoryInstance: medicalHistoryInstance]
    }

    def update() {
        def medicalHistoryInstance = MedicalHistory.get(params.id)
        if (!medicalHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (medicalHistoryInstance.version > version) {
                medicalHistoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'medicalHistory.label', default: 'MedicalHistory')] as Object[],
                          "Another user has updated this MedicalHistory while you were editing")
                render(view: "edit", model: [medicalHistoryInstance: medicalHistoryInstance])
                return
            }
        }

        medicalHistoryInstance.properties = params

        if (!medicalHistoryInstance.save(flush: true)) {
            render(view: "edit", model: [medicalHistoryInstance: medicalHistoryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), medicalHistoryInstance.id])
        redirect(action: "show", id: medicalHistoryInstance.id)
    }

    def delete() {
        def medicalHistoryInstance = MedicalHistory.get(params.id)
        if (!medicalHistoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
            redirect(action: "list")
            return
        }

        try {
            medicalHistoryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
