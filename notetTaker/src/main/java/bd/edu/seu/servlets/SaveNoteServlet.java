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
import java.io.PrintWriter;
import java.util.Date;

public class SaveNoteServlet extends HttpServlet {
    public SaveNoteServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            PrintWriter out = response.getWriter();
            String title = request.getParameter("title");
            String content =  request.getParameter("content");
            Note note = new Note(title,content,new Date());
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            s.save(note);
            tx.commit();
            s.close();
            response.setContentType("text/html");
            out.println("<h1>Content Saved !</h1>");
          }catch (Exception e){
            System.out.println("ADD NOTE SERVLET");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
