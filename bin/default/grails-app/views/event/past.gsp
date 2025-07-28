<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="Form" class="col-12 content scaffold-list" role="main">
                    <h1>Past Events</h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table class="table">
                        <thead>
                          <tr>
                            <th>Name</th>
                            <th>Location</th>
                            <th>Date</th>
                            <th>Description</th>
                          </tr>
                        </thead>
                          <tbody>
                            <g:each in="${eventList}" var="event">
                              <tr>
                                <td>
                                <%-- link to a single event where the user can then edit or delete the event --%>
                                    <g:link controller="event" action="show" id="${event.id}">${event.name}</g:link>
                                </td>
                                <td>${event.location}</td>
                                <td>${event.eventDate}</td>
                                <td>${event.description}</td>
                              </tr>
                            </g:each>
                          </tbody>
                       </table>

                    <g:if test="${eventCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${eventCount ?: 0}" max="${params.max}"/>
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>