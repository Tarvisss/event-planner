<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="list" action="past"><g:message code="default.past.label" args="[entityName]" /></g:link></li>

                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="Form" class="col-12 content scaffold-show" role="main">
                    <h1>Event</h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>

            <%-- replaced <f:table collection="${eventList}" /> with the following to have control of the layout of the information. --%>

                        <table class="table table-bordered">
                          <tr>
                            <th>Name</th>
                            <td>${event.name}</td>
                          </tr>
                          <tr>
                            <th>Location</th>
                            <td>${event.location}</td>
                          </tr>
                          <tr>
                            <th>Date</th>
                            <td>${event.eventDate}</td>
                          </tr>
                          <tr>
                            <th>Description</th>
                            <td>${event.description}</td>
                          </tr>
                        </table>

                        <h1>Attendees:</h1>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${attendees}" var="attendee">
                                <tr>
                                    <td>${attendee.fullName}</td>
                                    <td>${attendee.email}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <g:form resource="${this.event}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="create mr-2" action="create" controller="attendee" params="[eventId: event?.id]"><g:message code="default.button.add.label" default="Add Attendee" /></g:link>
                            <g:link class="edit mr-2" action="edit" resource="${this.event}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
