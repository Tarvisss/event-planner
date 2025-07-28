<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <div class="welcome-content" role="main">
        <div class="container">
            <div id="Welcome" class="text-center">
                <h2>Click on the planner to begin.</h2>

                <g:link controller="event" action="create">
                    <img src="${resource(dir: 'images', file: '—Pngtree—flat planner business icon design_6296930 (1).png')}"
                         alt="Create Event" style="max-width: 250px; height: auto;" />
                </g:link>
            </div>
        </div>
        
    </div>
</body>
</html>
