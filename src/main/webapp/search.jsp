<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.TextNote" %>
<%@ page import="uk.ac.ucl.model.URLNote" %>
<%@ page import="uk.ac.ucl.model.ImageNote" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Notes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Search Notes</h1>
            <nav>
                <a href="${pageContext.request.contextPath}/index">Home</a>
                <a href="${pageContext.request.contextPath}/addNote">Create Note</a>
                <a href="${pageContext.request.contextPath}/createCategory">Create Category</a>
            </nav>
        </header>

        <div class="search-container">
            <form method="get" action="${pageContext.request.contextPath}/search">
                <div class="form-group">
                    <label for="query">Search Term:</label>
                    <input type="text" id="query" name="query" value="${param.query}" required>
                </div>

                <div class="form-group">
                    <button type="submit" class="button">Search</button>
                </div>
            </form>
        </div>

        <% if (request.getParameter("query") != null && !request.getParameter("query").isEmpty()) { %>
            <div class="search-results">
                <h2>Search Results for: ${param.query}</h2>

                <% List<Note> results = (List<Note>) request.getAttribute("searchResults"); %>
                <% if (results != null && !results.isEmpty()) { %>
                    <div class="note-list">
                        <% for (Note note : results) { %>
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
                    <p>No results found.</p>
                <% } %>
            </div>
        <% } %>

        <footer>
            <p>&copy; 2025 Notes Application</p>
        </footer>
    </div>
</body>
</html>