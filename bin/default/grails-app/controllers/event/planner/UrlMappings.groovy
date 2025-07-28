package event.planner

/**
 *   Contains all route mappings 
*/


class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        //
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')


        // Specific routes for your event planner functionality:
         "/events"(controller: 'event', action: 'index') // List all events
         "/events/create"(controller: 'event', action: 'create') // Create a new event
         "/events/edit/$id"(controller: 'event', action: 'edit') // Edit an existing event
         "/events/$id"(controller: 'event', action: 'show') // View event details
    }
}
