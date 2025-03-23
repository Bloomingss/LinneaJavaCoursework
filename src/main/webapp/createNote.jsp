<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Category" %>
<%@ page import="uk.ac.ucl.model.NotesModel" %>

<%
    List<Category> categories = new ArrayList<>(); // Default empty list in case of errors
    try {
        categories = NotesModel.getInstance().getAllCategories();
    } catch (Exception e) {
        e.printStackTrace(); // Log error for debugging
    }
    request.setAttribute("categories", categories);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Note</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script>
        function showFields(type) {
            document.getElementById('text-fields').style.display = 'none';
            document.getElementById('url-fields').style.display = 'none';
            document.getElementById('image-fields').style.display = 'none';

            if (type === 'text') {
                document.getElementById('text-fields').style.display = 'block';
            } else if (type === 'url') {
                document.getElementById('url-fields').style.display = 'block';
            } else if (type === 'image') {
                document.getElementById('image-fields').style.display = 'block';
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <header>
            <h1>Create Note</h1>
            <nav>
                <a href="${pageContext.request.contextPath}/index">Home</a>
                <a href="${pageContext.request.contextPath}/addNote">Create Note</a>
                <a href="${pageContext.request.contextPath}/createCategory">Create Category</a>
                <a href="${pageContext.request.contextPath}/search">Search</a>
            </nav>
        </header>

        <form action="${pageContext.request.contextPath}/addNote" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Note Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="type">Note Type:</label>
                <select id="type" name="type" onchange="showFields(this.value)" required>
                    <option value="">Select type</option>
                    <option value="text">Text</option>
                    <option value="url">URL</option>
                    <option value="image">Image</option>
                </select>
            </div>

            <div id="text-fields" style="display: none;">
                <div class="form-group">
                    <label for="content">Content:</label>
                    <textarea id="content" name="content"></textarea>
                </div>
            </div>

            <div id="url-fields" style="display: none;">
                <div class="form-group">
                    <label for="url">URL:</label>
                    <input type="url" id="url" name="url">
                </div>
                <div class="form-group">
                    <label for="url-description">Description:</label>
                    <textarea id="url-description" name="description"></textarea>
                </div>
            </div>

            <div id="image-fields" style="display: none;">
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="file" id="image" name="image" accept="image/*">
                </div>
                <div class="form-group">
                    <label for="image-description">Description:</label>
                    <textarea id="image-description" name="description"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="categoryId">Add to Category (Optional):</label>
                <select id="categoryId" name="categoryId">
                    <option value="">None</option>
                    <% for (Category category : categories) { %>
                        <option value="<%= category.getId() %>"><%= category.getName() %></option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Create Note</button>
        </form>
    </div>
</body>
</html>
