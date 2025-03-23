package uk.ac.ucl.servlets;

import jakarta.servlet.annotation.WebServlet;
import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteNote.html")
public class DeleteNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteId = request.getParameter("id");

//        if (noteId != null && !noteId.isEmpty()) {
//            NotesModel model = NotesModel.getInstance();
//            model.removeNote(noteId);
//        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}