package uk.ac.ucl.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

public class FileUtils {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    public static void writeJsonToFile(File file, Object data) throws IOException {
        objectMapper.writerWithDefaultPrettyPrinter().writeValue(file, data);
    }

    public static <T> T readJsonFromFile(File file, Class<T> valueType) throws IOException {
        return objectMapper.readValue(file, valueType);
    }

    public static String readTextFromFile(File file) throws IOException {
        return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
    }

    public static void writeTextToFile(File file, String text) throws IOException {
        Files.write(file.toPath(), text.getBytes(StandardCharsets.UTF_8));
    }
}
