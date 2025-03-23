package uk.ac.ucl.servlets;

import jakarta.servlet.annotation.WebServlet;
import uk.ac.ucl.model.Category;
import uk.ac.ucl.model.NotesModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createCategory.html")
public class CreateCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/createCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        if (name != null && !name.isEmpty()) {
            NotesModel model = NotesModel.getInstance();
            Category category = new Category(name);
            model.addCategory(category);
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}