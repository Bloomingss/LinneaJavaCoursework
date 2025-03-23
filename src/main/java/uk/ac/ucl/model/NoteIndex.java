package uk.ac.ucl.model;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NoteIndex implements Serializable {
    private Map<String, Note> notes;
    private Map<String, Category> categories;

    public NoteIndex() {
        this.notes = new HashMap<>();
        this.categories = new HashMap<>();
    }

    public Note getNote(String noteId) {
        return notes.get(noteId);
    }

    public void addCategory(Category category) {
        categories.put(category.getId(), category);
    }

    public void removeCategory(String categoryId) {
        categories.remove(categoryId);
    }

    public Category getCategory(String categoryId) {
        return categories.get(categoryId);
    }

    public List<Category> getAllCategories() {
        if (categories == null) {
            return new ArrayList<>(); // Return empty list if categories is null
        }
        return new ArrayList<>(categories.values());
    }

    public void addNoteToCategory(String noteId, String categoryId) {
        Note note = notes.get(noteId);
        Category category = categories.get(categoryId);
        if (note != null && category != null) {
            category.addNote(note);
        }
    }
}