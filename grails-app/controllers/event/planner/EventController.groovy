package event.planner

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class EventController {

    EventService eventService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 8, 100)
        respond eventService.list(params), model:[eventCount: eventService.count()]
    }

    def past(Integer max) {
        params.max = Math.min(max ?: 8, 100)
        def now = new Date()
        def pastEvents = Event.where { eventDate < now }.list(params)
        def pastCount = Event.where { eventDate < now }.count()

        respond pastEvents, view: 'past', model: [eventCount: pastCount]
    }

    def show(Long id) {
        def event = Event.get(id)

        if (!event) {
            flash.message = "Event not found"
            redirect(action: "index")
            return
            }

        respond event, model: [attendees: event.attendees]
    }

    def create() {
        respond new Event(params)
    }

    def save(Event event) {
        if (event == null) {
            notFound()
            return
        }

        if (event.eventDate.before(new Date())) {
            event.errors.rejectValue("eventDate", "event.date.inPast", "The event can't be in the past. Please choose a future date.")
            respond event, view: 'create'
            return
        }

        try {
            eventService.save(event)
        } catch (ValidationException e) {
            respond event.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*' { respond event, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond eventService.get(id)
    }

    def update(Event event) {
        if (event == null) {
            notFound()
            return
        }

        try {
            eventService.save(event)
        } catch (ValidationException e) {
            respond event.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }

    def search() {
        String query = params.query?.trim()
    
        if (!query) {
            flash.message = "Showing all events"
            def allEvents = Event.list()
            render(view: 'searchResults', model: [query: '', events: allEvents])
            return
        }
    
        def events = Event.findAllByNameIlike("%${query}%")  // <-- case-insensitive LIKE
    
        if (events.isEmpty()) {
            flash.message = "No events found for '${query}'"
        }
    
        render(view: 'searchResults', model: [query: query, events: events])
    }


    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        eventService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'event.label', default: 'Event'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
