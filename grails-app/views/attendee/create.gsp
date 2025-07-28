<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'attendee.label', default: 'Attendee')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </section>
        <section class="row">
            <div id="Form" class="col-12 content scaffold-create" role="main">
                <h1>Add Attendee</h1>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <g:hasErrors bean="${attendee}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${attendee}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                <g:message error="${error}"/>
                            </li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>

                <g:form resource="${attendee}" method="POST">
                    <fieldset class="form">
                        <div class="form-group">
                            <label for="fullname">Full Name</label>
                            <g:textField name="fullName" value="${attendee.fullName}" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <g:textField name="email" value="${attendee.email}" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="event">Event</label>
                            <g:select name="event.id"
                                      from="${eventList}"
                                      optionKey="id"
                                      optionValue="name"
                                      value="${attendee?.event?.id}"
                                      class="form-control"/>
                        </div>
                    </fieldset>

                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </g:form>
            </div>
        </section>
    </div>
</div>
</body>
</html>
