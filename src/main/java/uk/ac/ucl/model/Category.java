package uk.ac.ucl.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class Category implements Serializable {
    private String id;
    private String name;
    private Map<String, Note> notes;

    public Category(String name) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.notes = new HashMap<>();
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void addNote(Note note) {
        notes.put(note.getId(), note);
    }

    public void removeNote(String noteId) {
        notes.remove(noteId);
    }

    public Note getNote(String noteId) {
        return notes.get(noteId);
    }

    public List<Note> getAllNotes() {
        return new ArrayList<>(notes.values());
    }

//    public List<Note> searchNotes(String searchText) {
//        List<Note> searchResults = new ArrayList<>();
//        for (Note note : notes.values()) {
//            if (note.containsText(searchText)) {
//                searchResults.add(note);
//            }
//        }
//        return searchResults;
//    }
}