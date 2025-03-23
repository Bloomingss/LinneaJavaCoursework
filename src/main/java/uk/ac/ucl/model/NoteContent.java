package uk.ac.ucl.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDateTime;
import java.util.UUID;

public class NoteContent {
    private String type;
    private String content;
    private String position;

    @JsonCreator
    public NoteContent(@JsonProperty("type") String type, @JsonProperty("content") String content, @JsonProperty("position")String position) {
        this.type = type;
        this.content = content;
        this.position = position;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
