<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attendee.label', default: 'Attendee')}" />
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
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="Form" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                     <table class="table">
                        <thead>
                          <tr>
                            <th>FullName</th>
                            <th>Email</th>
                            <th>Event</th>
                          </tr>
                        </thead>
                          <tbody>
                            <g:each in="${attendeeList}" var="attendee">
                              <tr>
                                <td>
                                <%-- link to a single event where the user can then edit or delete the event --%>
                                    <g:link controller="attendee" action="show" id="${attendee.id}">${attendee.fullName}</g:link>
                                </td>
                                <td>${attendee.email}</td>
                                <td>
                                    <g:link controller="event" action="show" id="${attendee?.event?.id}">${attendee?.event?.name}</g:link>
                                </td>
                              </tr>
                            </g:each>
                          </tbody>
                       </table>

                    <g:if test="${attendeeCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${attendeeCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>