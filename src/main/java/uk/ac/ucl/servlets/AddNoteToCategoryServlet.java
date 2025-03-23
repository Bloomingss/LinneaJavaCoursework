package uk.ac.ucl.servlets;

import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddNoteToCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteId = request.getParameter("noteId");
        String categoryId = request.getParameter("categoryId");

        if (noteId != null && !noteId.isEmpty() && categoryId != null && !categoryId.isEmpty()) {
            NotesModel model = NotesModel.getInstance();
            model.addNoteToCategory(noteId, categoryId);
        }

        String referer = request.getHeader("Referer");
        if (referer != null) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}