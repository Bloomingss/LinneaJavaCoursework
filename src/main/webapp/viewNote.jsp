<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.Category" %>
<%@ page import="uk.ac.ucl.model.NotesModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Note</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>View Note</h1>
            <nav>
                <a href="${pageContext.request.contextPath}/index">Home</a>
                <a href="${pageContext.request.contextPath}/addNote">Create Note</a>
                <a href="${pageContext.request.contextPath}/createCategory">Create Category</a>
                <a href="${pageContext.request.contextPath}/search">Search</a>
            </nav>
        </header>
        <% Note note = (Note) request.getAttribute("note"); %>
        <% if (note != null) { %>
            <div class="note-content">
                <h2><%= note.getName() %></h2>
                <p class="note-date">Created: <%= note.getCreatedAt() %></p>
                <p class="note-date">Last modified: <%= note.getModiAt() %></p>

                <% List<String> noteCategories = note.getCategories(); %>
                <% if (noteCategories != null && !noteCategories.isEmpty()) { %>
                    <div class="categories">
                        <h3>Categories:</h3>
                        <ul>
                            <% for (String categoryId : noteCategories) { %>
                                <li><a href="${pageContext.request.contextPath}/viewCategory?id=<%= categoryId %>"><%= categoryId %></a></li>
                            <% } %>
                        </ul>
                    </div>
                <% } %>

                <div class="note-body">
                    <% if (note instanceof TextNote) { %>
                        <div class="text-note">
                            <p><%= ((TextNote)note).getContent() %></p>
                        </div>
                    <% } else if (note instanceof URLNote) { %>
                        <div class="url-note">
                            <p>URL: <a href="<%= ((URLNote)note).getUrl() %>" target="_blank"><%= ((URLNote)note).getUrl() %></a></p>
                        </div>
                    <% } else if (note instanceof ImageNote) { %>
                        <div class="image-note">
                            <img src="<%= ((ImageNote)note).getImagePath() %>" alt="<%= note.getTitle() %>">
                        </div>
                    <% } %>
                </div>

                <div class="note-actions">
                    <a href="${pageContext.request.contextPath}/editNote?id=<%= note.getId() %>" class="button">Edit</a>
                    <a href="${pageContext.request.contextPath}/deleteNote?id=<%= note.getId() %>" class="button delete" onclick="return confirm('Are you sure you want to delete this note?')">Delete</a>
                </div>
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