package uk.ac.ucl.servlets;

import jakarta.servlet.annotation.WebServlet;
import uk.ac.ucl.model.Category;
import uk.ac.ucl.model.Note;
import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet ("/viewNotes.html")
public class ViewNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteId = request.getParameter("id");

        if (noteId != null && !noteId.isEmpty()) {
            NotesModel model = NotesModel.getInstance();
            Note note = model.getNote(noteId);

            if (note != null) {
                request.setAttribute("note", note);

//                // Get categories containing this note
//                List<Category> categories = model.getAllCategories();
//                List<Category> noteCategories = new ArrayList<>();
//                for (Category category : categories) {
//                    if (category.getNote(noteId) != null) {
//                        noteCategories.add(category);
//                    }
//                }
//                request.setAttribute("noteCategories", noteCategories);

                request.getRequestDispatcher("/viewNote.jsp").forward(request, response);
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}