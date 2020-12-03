<%@ page import="org.hibernate.Session" %>
<%@ page import="bd.edu.seu.helper.FactoryProvider" %>
<%@ page import="bd.edu.seu.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/06/2020
  Time: 1:27 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp"%>
    <title>Edit Page</title>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %>
<%
    int noteId = Integer.parseInt(request.getParameter("note_id"));
    Session s = FactoryProvider.getFactory().openSession();
    Note note = (Note)s.get(Note.class,noteId);
//    s.close();
%>
    <br>
        <div class="container bg-info p-5">
    <h1 class="text-center text-warning text-uppercase">Please Edit from here!</h1>
    <br>
    <%--    Edit note code--%>
    <form action="UpdateServlet" method="post">
        <input name="note_id" type="hidden" value="<%=note.getId()%>" />
        <div class="form-group">
            <label for="title" class="text-light">Note Title</label>
            <input name="title" required type="text" class="form-control" id="title" aria-describedby="" placeholder="Enter Here"
            value="<%=note.getTitle()%>">
        </div>
        <div class="form-group" >
            <label for="content" class="text-light">Write Note</label>
            <textarea name="content" required id="content" class="form-control" placeholder="Write Here" style="height: 200px"><%=note.getContent()%>
            </textarea>
        </div>
        <div class="container text-center mt-3">
            <button type="submit" class="btn btn-outline-warning">Update</button>
        </div>

    </form>
        </div>
</div>
</body>
</html>
