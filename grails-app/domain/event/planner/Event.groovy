package event.planner

import grails.validation.Validateable

class Event {

    String name
    String location
    Date eventDate
    String description
    Integer maxCapacity = 8

    static hasMany = [attendees: Attendee] // This defines the relationship (1-to-many)

    static constraints = {
        name blank: false
        location blank: false
        eventDate nullable: false
        description nullable: true
    }
}
