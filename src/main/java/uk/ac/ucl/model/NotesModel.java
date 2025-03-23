package uk.ac.ucl.model;

import uk.ac.ucl.utils.FileUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class NotesModel {
    private static NotesModel instance = null;
    private NoteIndex noteIndex;
    private final String DATA_DIR = "notes";
    private final String INDEX_FILE = "notes.json";
    private final ObjectMapper objectMapper = new ObjectMapper();

    public static NotesModel getInstance() {
        if (instance == null) {
            instance = new NotesModel();
        }
        return instance;
    }

//    public void addNote(Note note) {
//        noteIndex.addNote(note);
//        saveToFile();
//    }
//
//    public void removeNote(String noteId) {
//        noteIndex.removeNote(noteId);
//        saveToFile();
//    }

    public void updateNote(String noteId, String name, String content) {
        Note note = getNote(noteId);
        if (note != null) {
            note.setName(name);
//            note.setContent(content);
            saveToFile();
        }
    }

    public void addCategory(Category category) {
        noteIndex.addCategory(category);
        saveToFile();
    }

    public void removeCategory(String categoryId) {
        noteIndex.removeCategory(categoryId);
        saveToFile();
    }

    public Category getCategory(String categoryId) {
        return noteIndex.getCategory(categoryId);
    }

    public List<Category> getAllCategories() {
        return noteIndex.getAllCategories();
    }

    public void addNoteToCategory(String noteId, String categoryId) {
        noteIndex.addNoteToCategory(noteId, categoryId);
        saveToFile();
    }

//    public List<Note> searchNotes(String searchText) {
//        return noteIndex.searchNotes(searchText);
//    }

    private void saveToFile() {
        try {
            objectMapper.writeValue(new File(DATA_DIR, INDEX_FILE), noteIndex);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private ArrayList<Note> loadFromFile() throws IOException {
        File file = new File("notes/notes.json");
         return objectMapper.readValue(file, new TypeReference<ArrayList<Note>>() {});
    }

    public ArrayList<Note> getAllNotes() {
        ArrayList<Note> notes = new ArrayList<>();
        try {
            notes = loadFromFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return notes;
    }

    public Note getNote(String noteId) {
        ArrayList<Note> notes = new ArrayList<>();
        try {
            notes = loadFromFile();
            Optional<Note> foundNote = notes.stream().filter(note -> noteId.equals(note.getId())).findFirst();
            if (foundNote.isPresent()) {
                return foundNote.get();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
