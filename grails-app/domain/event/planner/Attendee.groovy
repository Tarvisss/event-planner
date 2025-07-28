package event.planner

import grails.validation.Validateable


class Attendee {

    String fullName
    String email
    Event event 

    static belongsTo = [event: Event] 

    static constraints = {
        fullName blank: false
        email email: true, blank: false 
        event nullable: false 
    }
}
