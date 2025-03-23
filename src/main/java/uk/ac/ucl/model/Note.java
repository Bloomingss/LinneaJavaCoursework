package uk.ac.ucl.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Note {
    private String id;
    private String name;
    private List<NoteContent> content;
    private String createdAt;
    private String modifiedAt;
    private ArrayList<Category> categories;

    @JsonCreator
    public Note(@JsonProperty("name") String name, @JsonProperty("id") String id,@JsonProperty("createdAt") String createdAt, @JsonProperty("modifiedAt") String modifiedAt, @JsonProperty("content") ArrayList<NoteContent> content, @JsonProperty("categories") ArrayList<Category> categories) {
        this.id = id;
        this.name = name;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.content = content;
        this.categories = categories;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
        this.modifiedAt = LocalDateTime.now().toString();
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public String getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(String newModifyTime) {
        this.modifiedAt = newModifyTime;
    }

    public List<NoteContent> getContent() {
        return content;
    }

    public void setContent(List<NoteContent> newContent) {
        this.content = newContent;
    }

    public void setCategories(ArrayList<Category> newCategories) {
        this.categories = newCategories;
    }

    public ArrayList<Category> getCategories() {
        return categories;
    }


}