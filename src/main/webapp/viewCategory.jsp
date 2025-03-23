<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.Category" %>
<%@ page import="uk.ac.ucl.model.TextNote" %>
<%@ page import="uk.ac.ucl.model.URLNote" %>
<%@ page import="uk.ac.ucl.model.ImageNote" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Category</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>View Category</h1>
            <nav>
                <a href="${pageContext.request.contextPath}/index">Home</a>
                <a href="${pageContext.request.contextPath}/addNote">Create Note</a>
                <a href="${pageContext.request.contextPath}/createCategory">Create Category</a>
                <a href="${pageContext.request.contextPath}/search">Search</a>
            </nav>
        </header>

        <% Category category = (Category) request.getAttribute("category"); %>
        <% if (category != null) { %>
            <div class="category-details">
                <h2><%= category.getName() %></h2>

                <% if (category.getDescription() != null && !category.getDescription().isEmpty()) { %>
                    <div class="category-description">
                        <p><%= category.getDescription() %></p>
                    </div>
                <% } %>

                <h3>Notes in this Category</h3>
                <% List<Note> categoryNotes = (List<Note>) request.getAttribute("categoryNotes"); %>
                <% if (categoryNotes != null && !categoryNotes.isEmpty()) { %>
                    <div class="note-list">
                        <% for (Note note : categoryNotes) { %>
                            <div class="note-card">
                                <h3><a href="${pageContext.request.contextPath}/viewNote?id=<%= note.getId() %>"><%= note.getTitle() %></a></h3>
                                <p class="note-date">Created: <%= note.getCreatedAt() %></p>
                                <p class="note-type">
                                    <% if (note instanceof TextNote) { %>
                                        Text Note
                                    <% } else if (note instanceof URLNote) { %>
                                        URL Note
                                    <% } else if (note instanceof ImageNote) { %>
                                        Image Note
                                    <% } %>
                                </p>
                            </div>
                        <% } %>
                    </div>
                <% } else { %>
                    <p>No notes in this category.</p>
                <% } %>

                <div class="category-actions">
                    <a href="${pageContext.request.contextPath}/editCategory?id=<%= category.getId() %>" class="button">Edit Category</a>
                    <a href="${pageContext.request.contextPath}/deleteCategory?id=<%= category.getId() %>" class="button delete" onclick="return confirm('Are you sure you want to delete this category? This will not delete the notes in the category.')">Delete Category</a>
                </div>
            </div>
        <% } else { %>
            <div class="error-message">
                <p>Category not found.</p>
            </div>
        <% } %>

        <footer>
            <p>&copy; 2025 Notes Application</p>
        </footer>
    </div>
</body>
</html>