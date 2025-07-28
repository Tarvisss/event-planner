<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="Form" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.event}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.event}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.event}" method="PUT">
                        <g:hiddenField name="version" value="${this.event?.version}" />
                        <fieldset class="form">
                            <div class="form-group">
                                <label for="name">Event Name</label>
                                <g:textField name="name" value="${event.name}" class="form-control"/>
                            </div>
    
                            <div class="form-group">
                                <label for="location"> Event Location</label>
                                <g:textField name="location" value="${event.location}" class="form-control"/>
                            </div>
    
                            <input type="datetime-local"
                                   name="eventDate"
                                   value="${formatDate(date: event?.eventDate, format: 'yyyy-MM-dd\'T\'HH:mm')}"
                                   class="form-control" />

                            <div class="form-group">
                                <label for="description">Event Description</label>
                                <g:textArea name="description" value="${event.description}" class="form-control"/>
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
