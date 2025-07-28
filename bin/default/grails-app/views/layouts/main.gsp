<%-- this layout is a page wrapper containing all other pages rendered within using <g:layoutBody/> --%>

<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="TheBestEvent"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon-16x16.png" type="image/x-ico"/>

    <%-- this is where all the css is connected. --%>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>

    <g:layoutHead/>
</head>
<body class="page-wrapper">
  <nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
      <div class="container-fluid">
          <a class="navbar-brand" href="/#"><asset:image src="android-chrome-192x192.png" alt="Best Event Planner"/></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
  
          <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
            <form action="${createLink(controller: 'event', action: 'search')}" method="GET">
                <div class="input-group">
                    <input type="text" name="query" class="form-control" placeholder="Search for events..." />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit">Search</button>
                    </div>
                </div>
            </form>
              <ul class="nav navbar-nav ml-auto">
                  <li><g:link controller="event" action="index"><b>Current Events</b></g:link></li>
                  <li><g:link controller="event" action="past"><b>Past Events</b></g:link></li>
                  <li><g:link controller="event" action="create"><b>Create Event</b></g:link></li>
                  <li><g:link controller="attendee" action="create"><b>Add Attendee</b></g:link></li>
                  <%-- this will dynamiclly add content depending on which view the user is on  --%>
                  <%-- <g:pageProperty name="page.nav"/> --%>
              </ul>
          </div>
      </div>
  </nav>
    <%-- all other views will be inside here. I'm wrapping the body to use flex for a sticky footer --%>
    <%-- using a page-wrapper to keep a fixed in place footer --%>
    
    <div class="content">
      <g:layoutBody/>
    </div>
<div class="footer" role="contentinfo">
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <asset:image src="DJV MAR 1034-01.png" alt="Plan" class=" footer-image float-left"/>
                <h3>Idea?</h3>
                <strong><p>Have an upcoming event?</p></strong>
            </div>
            <div class="col">
                <asset:image src="2240546.png" alt="Plan" class=" footer-image float-left"/>
                <h3>Plan/Create</h3>
                <strong><p>Plan and create with our easy-to-use event planner </p></strong>
            </div>
            <div class="col">
                <asset:image src="3542833.png" alt="Plan" class=" footer-image float-left"/>
                <h3>Relax...</h3>
                <strong><p>No worries. It's done. Just relax.</p></strong>
            </div>
        </div>
    </div>
<%-- </div> --%>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
