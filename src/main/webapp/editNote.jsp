<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.NoteContent" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Note</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Edit Note</h1>
            <nav>
                <a href="index.html">Home</a>
                <a href="addNote.html">Create Note</a>
                <a href="createCategory.html">Create Category</a>
                <a href="search.html">Search</a>
            </nav>
        </header>

        <% Note note = (Note) request.getAttribute("note"); %>
        <% if (note != null) { %>
            <div class="form-container">
                <form method="POST" action="editNote.html">
                    <input type="hidden" name="id" value="<%= note.getId() %>">

                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" id="title" name="title" value="<%= note.getName() %>" required>
                    </div>

                    <% for (NoteContent content : note.getContent()) {
                    if (content.getType().equals("text")) { %>
                        <div class="form-group">
                            <label for="content">Content:</label>
                            <textarea id="content" name="content" rows="10" required><%= ((TextNote)note).getContent() %></textarea>
                        </div>
                    <% } else if (content.getType().equals("url")) { %>
                        <div class="form-group">
                            <label for="url">URL:</label>
                            <input type="url" id="url" name="url" value="<%= ((URLNote)note).getUrl() %>" required>
                        </div>
                    <% } else if (content.getType().equals("image"))) { %>
                        <div class="form-group">
                            <label for="imagePath">Image Path:</label>
                            <input type="text" id="imagePath" name="imagePath" value="<%= ((ImageNote)note).getImagePath() %>" required>
                        </div>
                    <% } } %>

                    <div class="button-group">
                        <button type="submit" class="button">Save Changes</button>
                        <a href="${pageContext.request.contextPath}/viewNote?id=<%= note.getId() %>" class="button">Cancel</a>
                    </div>
                </form>
            </div>
        <% } else { %>
            <div class="error-message">
                <p>Note not found.</p>
            </div>
        <% } %>

        <footer>
            <p>&copy; 2025 Notes Application</p>
        </footer>
    </div>
</body>
</html>