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

@WebServlet("/index.html")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NotesModel model = NotesModel.getInstance();

        // Get sorting parameter
        String sortBy = request.getParameter("sortBy");
        ArrayList<Note> notes = model.getAllNotes();

        if ("name".equals(sortBy)) {
            notes.sort((a, b) -> a.getName().compareToIgnoreCase(b.getName()));
        } else if ("date".equals(sortBy)) {
            notes.sort((a, b) -> b.getModifiedAt().compareTo(a.getModifiedAt()));
        }

        List<Category> categories = model.getAllCategories();

        request.setAttribute("recentNotes", notes);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}