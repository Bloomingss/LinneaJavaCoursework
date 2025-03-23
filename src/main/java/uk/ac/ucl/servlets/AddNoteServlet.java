package uk.ac.ucl.servlets;

import jakarta.servlet.annotation.WebServlet;
import uk.ac.ucl.model.Note;
import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.stream.Collectors;

@WebServlet("/addNote.html")
public class AddNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/createNote.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String a = request.getParameter("addNote");

        NotesModel model = NotesModel.getInstance();
        Note note = null;

//        if ("text".equals(type)) {
//            String content = request.getParameter("content");
//            note = new TextNote(name, content);
//        } else if ("url".equals(type)) {
//            String url = request.getParameter("url");
//            String description = request.getParameter("description");
//            note = new URLNote(name, url, description);
//        } else if ("image".equals(type)) {
//            Part filePart = request.getPart("image");
//            String description = request.getParameter("description");
//
//            // Convert image to Base64
//            InputStream fileContent = filePart.getInputStream();
//            byte[] imageBytes = new byte[(int) filePart.getSize()];
//            fileContent.read(imageBytes);
//            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//
//            note = new ImageNote(name, base64Image, description);
//        }
//
//        if (note != null) {
////            model.addNote(note);
//
//            // Add to category if selected
//            String categoryId = request.getParameter("categoryId");
//            if (categoryId != null && !categoryId.isEmpty()) {
//                model.addNoteToCategory(note.getId(), categoryId);
//            }
//        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}