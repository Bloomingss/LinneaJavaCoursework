<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.Category" %>
<%@ page import="uk.ac.ucl.model.NoteContent" %>
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
                <a href="index.html">Home</a>
                <a href="addNote.html">Create Note</a>
                <a href="createCategory.html">Create Category</a>
                <a href="search.html">Search</a>
            </nav>
        </header>
        <% Note note = (Note) request.getAttribute("note"); %>
        <% if (note != null) { %>
            <div class="note-content">
                <h2><%= note.getName() %></h2>
                <p class="note-date">Created: <%= note.getCreatedAt() %></p>
                <p class="note-date">Last modified: <%= note.getModifiedAt() %></p>

                <% ArrayList<Category> noteCategories = note.getCategories(); %>
                <% if (noteCategories != null && !noteCategories.isEmpty()) { %>
                    <div class="categories">
                        <h3>Categories:</h3>
                        <ul>
                            <% for (Category category : noteCategories) { %>
                                <li><a href="${pageContext.request.contextPath}/viewCategory?id=<%= category.getId() %>"><%= category.getId() %></a></li>
                            <% } %>
                        </ul>
                    </div>
                <% } %>

                <div class="note-body">
                  <% for (NoteContent content : note.getContent()) {
                      if (content.getType().equals("text")) { %>
                        <div class="text-note">
                            <p><%= content.getContent() %></p>
                        </div>
                    <% } else if (content.getType().equals("url")) { %>
                        <div class="url-note">
                            <p>URL: <a href="<%= content.getContent() %>" target="_blank"><%= content.getContent() %></a></p>
                        </div>
                    <% } else if (content.getType().equals("image")) { %>
                        <div class="image-note">
                            <img src="<%= content.getContent() %>" alt="<%= note.getName() %>">
                        </div>
                    <% } }%>
                </div>

                <div class="note-actions">
                    <a href="/editNote.html?id=<%= note.getId() %>" class="button">Edit</a>
                    <a href="/deleteNote.html?id=<%= note.getId() %>" class="button delete" onclick="return confirm('Are you sure you want to delete this note?')">Delete</a>
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