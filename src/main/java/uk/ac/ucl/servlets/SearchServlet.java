package uk.ac.ucl.servlets;

import jakarta.servlet.annotation.WebServlet;
import uk.ac.ucl.model.Note;
import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search.html")
public class SearchServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String searchQuery = request.getParameter("query");
    String categoryId = request.getParameter("categoryId");

    NotesModel model = NotesModel.getInstance();
    List<Note> searchResults;

//    if (searchQuery != null && !searchQuery.isEmpty()) {
//      if (categoryId != null && !categoryId.isEmpty()) {
//        // Search within a specific category
//        searchResults = model.getNoteIndex().searchNotesInCategory(categoryId, searchQuery);
//        request.setAttribute("categoryName", model.getCategory(categoryId).getName());
//      } else {
//        // Search all notes
//        searchResults = model.searchNotes(searchQuery);
//      }
//
//      request.setAttribute("searchQuery", searchQuery);
//      request.setAttribute("searchResults", searchResults);
//    }

    request.getRequestDispatcher("/search.jsp").forward(request, response);
  }

//  @Override
//  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    doGet(request, response);
//  }
}