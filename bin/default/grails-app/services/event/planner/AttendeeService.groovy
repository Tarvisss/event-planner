package event.planner

import grails.gorm.services.Service

@Service(Attendee)
interface AttendeeService {

    Attendee get(Serializable id)

    List<Attendee> list(Map args)

    Long count()

    void delete(Serializable id)

    Attendee save(Attendee attendee)

}