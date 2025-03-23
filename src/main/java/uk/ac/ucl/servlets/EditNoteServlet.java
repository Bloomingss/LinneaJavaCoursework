package uk.ac.ucl.servlets;

import jakarta.servlet.annotation.WebServlet;
import uk.ac.ucl.model.Note;
import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editNote.html")
public class EditNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteId = request.getParameter("id");

        if (noteId != null && !noteId.isEmpty()) {
            NotesModel model = NotesModel.getInstance();
            Note note = model.getNote(noteId);

            if (note != null) {
                request.setAttribute("note", note);
                request.getRequestDispatcher("/editNote.jsp").forward(request, response);
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteId = request.getParameter("id");
        String name = request.getParameter("name");
        String content = request.getParameter("content");

        if (noteId != null && !noteId.isEmpty()) {
            NotesModel model = NotesModel.getInstance();
            model.updateNote(noteId, name, content);
        }

        response.sendRedirect(request.getContextPath() + "/viewNote?id=" + noteId);
    }
}