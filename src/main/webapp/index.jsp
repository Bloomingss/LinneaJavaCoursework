<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import= "java.util.List"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "uk.ac.ucl.model.Note"%>
<%@ page import= "uk.ac.ucl.model.Category"%>



<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notes Application</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Notes Application</h1>
            <nav>
                <form type="POST" action="addNote.html">
                   <button type="submit" name="addNote" value="true">Create Note</button>
                </form>
                <form type="POST" action="createCategory.html">
                   <button type="submit" name="createCategory" value="true">Create Category</button>
                </form>
                <form type="POST" action="search.html">
                   <button type="submit" name="search" value="true">Search</button>
                </form>
              </nav>
        </header>

        <div class="dashboard">
            <div class="section">
                <h2>Recent Notes</h2>
                <% ArrayList<Note> recentNotes = (ArrayList<Note>) request.getAttribute("recentNotes"); %>
                <% if (recentNotes != null && !recentNotes.isEmpty()) { %>
                    <div class="note-list">
                        <% for (Note note : recentNotes) { %>
                          <form type="GET" action="viewNotes.html">
                            <div class="note-card">
                                <button type = "submit" name= "id" value="<%=note.getId()%>"><%= note.getName() %></a>
                            </div></form>
                        <% } %>
                    </div>
                <% } else { %>
                    <p>No notes available.</p>
                <% } %>
            </div>

            <div class="section">
                <h2>Categories</h2>
                <% List<Category> categories = (List<Category>) request.getAttribute("categories"); %>
                <% if (categories != null && !categories.isEmpty()) { %>
                    <div class="category-list">
                        <% for (Category category : categories) { %>
                            <div class="category-card">
                                <h3><a href="${pageContext.request.contextPath}/viewCategory?id=<%= category.getId() %>"><%= category.getName() %></a></h3>
                            </div>
                        <% } %>
                    </div>
                <% } else { %>
                    <p>No categories available.</p>
                <% } %>
            </div>
        </div>

        <footer>
            <p>&copy; 2025 Notes Application</p>
        </footer>
    </div>
</body>
</html>