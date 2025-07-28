<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Search Results</title>
</head>
<body>
<div class="container mt-4">
    <h2>Search Results for "${query.encodeAsHTML()}"</h2>

    <g:if test="${events && events.size() > 0}">
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Location</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${events}" var="event">
                    <tr>
                        <td><g:link controller="event" action="show" id="${event.id}">${event.name}</g:link></td>
                        <td>${event.location}</td>
                        <td>${event.eventDate}</td>
                        <td>${event.description}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </g:if>

    <g:else>
        <div class="alert alert-info mt-3">No events found matching your search.</div>
    </g:else>
</div>
</body>
</html>
