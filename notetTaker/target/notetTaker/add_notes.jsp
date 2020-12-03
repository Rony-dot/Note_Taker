
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp"%>
    <title>Add Notes</title>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %>
<br>
    <div class="container bg-dark p-5">
    <h1 class="text-center text-warning text-uppercase">Please Fill Your Note Details Here</h1>
<br>
    <%--    Add note code--%>
    <form action="SaveNoteServlet" method="post" >
        <div class="form-group">
            <label for="title" class="text-light">Note Title</label>
            <input name="title" required type="text" class="form-control " id="title" aria-describedby="" placeholder="Enter Here">
        </div>
        <div class="form-group">
            <label for="content" class="text-light">Write Note</label>
          <textarea name="content" required id="content" class="form-control" placeholder="Write Here" style="height: 200px"></textarea>
        </div>
        <div class="container text-center">
            <button type="submit" class="btn btn-outline-warning mt-3">Add Note</button>
        </div>

    </form>
    </div>
</div>
</body>
</html>
