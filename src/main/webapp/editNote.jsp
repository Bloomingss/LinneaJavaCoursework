<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.TextNote" %>
<%@ page import="uk.ac.ucl.model.URLNote" %>
<%@ page import="uk.ac.ucl.model.ImageNote" %>
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
                <a href="${pageContext.request.contextPath}/index">Home</a>
                <a href="${pageContext.request.contextPath}/addNote">Create Note</a>
                <a href="${pageContext.request.contextPath}/createCategory">Create Category</a>
                <a href="${pageContext.request.contextPath}/search">Search</a>
            </nav>
        </header>

        <% Note note = (Note) request.getAttribute("note"); %>
        <% if (note != null) { %>
            <div class="form-container">
                <form method="post" action="${pageContext.request.contextPath}/editNote">
                    <input type="hidden" name="id" value="<%= note.getId() %>">

                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" id="title" name="title" value="<%= note.getTitle() %>" required>
                    </div>

                    <% if (note instanceof TextNote) { %>
                        <div class="form-group">
                            <label for="content">Content:</label>
                            <textarea id="content" name="content" rows="10" required><%= ((TextNote)note).getContent() %></textarea>
                        </div>
                    <% } else if (note instanceof URLNote) { %>
                        <div class="form-group">
                            <label for="url">URL:</label>
                            <input type="url" id="url" name="url" value="<%= ((URLNote)note).getUrl() %>" required>
                        </div>
                    <% } else if (note instanceof ImageNote) { %>
                        <div class="form-group">
                            <label for="imagePath">Image Path:</label>
                            <input type="text" id="imagePath" name="imagePath" value="<%= ((ImageNote)note).getImagePath() %>" required>
                        </div>
                    <% } %>

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