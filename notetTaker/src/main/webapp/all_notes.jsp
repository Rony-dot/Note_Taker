<%@ page import="org.hibernate.Session" %>
<%@ page import="bd.edu.seu.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="bd.edu.seu.entities.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp"%>
    <title>All Notes</title>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@include file="navbar.jsp" %>
    <div class="container">
        <br>
    <h1 class="text-uppercase text-center  text-info">All Notes </h1>

    <div CLASS="row">
        <div class="col-12">
            <%
                Session s = FactoryProvider.getFactory().openSession();
                Query q = s.createQuery("From Note");
                List<Note> list =  q.list();
                for(Note note : list){
            %>

            <div class="card bg-warning mt-3">
                <img class="card-img-top m-3 mx-auto" src="img/note.png"  style="width: 80px" alt="Card image cap">
                <div class="card-body px-5">
                    <h5 class="card-title  text-danger font-weight-bold"><%= note.getTitle()%></h5>
                    <p class="card-text lead"><%= note.getContent()%></p>
                    <p class="card-text  font-weight-bold text-primary text-right"><%= note.getAddedDate()%></p>
                    <div class="container text-center mt-5" >
                        <a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-danger">Delete</a>
                        <a href="edit.jsp?note_id=<%= note.getId()%>" class="btn btn-primary">Update</a>
                    </div>

                </div>
            </div>

            <%
                }
                s.close();
            %>
        </div>
    </div>
</div>
</div>
</body>
</html>
