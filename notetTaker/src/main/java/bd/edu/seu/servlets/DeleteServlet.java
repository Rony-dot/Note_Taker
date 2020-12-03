package bd.edu.seu.servlets;

import bd.edu.seu.entities.Note;
import bd.edu.seu.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            int noteId = Integer.parseInt(request.getParameter("note_id"));
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            Note note =(Note) s.get(Note.class,noteId);
            s.delete(note);
            tx.commit();
            s.close();
            response.sendRedirect("all_notes.jsp");

        }catch (Exception e){
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
