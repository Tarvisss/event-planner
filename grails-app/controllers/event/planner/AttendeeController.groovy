package event.planner

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AttendeeController {

    AttendeeService attendeeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 8, 100)
        respond attendeeService.list(params), model:[attendeeCount: attendeeService.count()]
    }

    def show(Long id) {
        //This grabs the Attendee object from the domain Attendee and gererates a instance of the class based of the name 
        //of the class. this allows me to use it in my views
        respond attendeeService.get(id)
    }

    def create() {
        respond new Attendee(params), model: [eventList: Event.list()]
    }

    def save(Attendee attendee) {
        def event = Event.get(attendee.event?.id)

        if (attendee == null) {
            notFound()
            return
        }

        if(Event.count() == 0) {
            flash.message = "There are currently no ongoing events. Please create one to add an attendee."
            redirect(controller: "event", action: "create")
            return
        }

        if(!event) {
            flash.message = "please choose a valid event"
            render(view: 'create', model: [attendee: attendee, eventList: Event.list()])
        }

        if (!attendee.validate()) {
        render(view: 'create', model: [attendee: attendee, eventList: Event.list()])
            return
    }
        if (event.attendees.size() >= event.maxCapacity){
            flash.message = "This event has reached max capacity"
        render(view: 'create', model: [attendee: attendee, eventList: Event.list()])   
            return
        }
        
        try {
            attendeeService.save(attendee)
        } catch (ValidationException e) {
            respond attendee.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Thanks! '${attendee.fullName}' successfully registered for event '${attendee.event?.name}' A comformation email was sent to your email address."
                redirect attendee
            }
            '*' { respond attendee, [status: CREATED] }
        }
    }

    def edit(Long id) {
        def attendee = attendeeService.get(id)
        respond attendee, model: [eventList: Event.list()]
    }

    def update(Attendee attendee) {
        if (attendee == null) {
            notFound()
            return
        }

        try {
            attendeeService.save(attendee)
        } catch (ValidationException e) {
            respond attendee.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'attendee.label', default: 'Attendee'), attendee.id])
                redirect attendee
            }
            '*'{ respond attendee, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        attendeeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'attendee.label', default: 'Attendee'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendee.label', default: 'Attendee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
