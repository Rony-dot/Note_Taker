package bd.edu.seu.servlets;

import bd.edu.seu.entities.Note;
import bd.edu.seu.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.FactoryConfigurationError;
import java.io.IOException;
import java.util.Date;

public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int noteId = Integer.parseInt(request.getParameter("note_id"));
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            Note note =(Note) s.get(Note.class,noteId);
            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());
            tx.commit();
            s.close();
            response.sendRedirect("all_notes.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
