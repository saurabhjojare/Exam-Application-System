package com.exam.model;

/**
 * This class represents a Subject in the examination system.
 */
public class SubjectModel {
    private int id; // Unique identifier for the subject
    private String name; // Name of the subject

    /**
     * Get the ID of the subject.
     * 
     * @return The ID of the subject.
     */
    public int getId() {
        return id;
    }

    /**
     * Set the ID of the subject.
     * 
     * @param id The ID of the subject.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get the name of the subject.
     * 
     * @return The name of the subject.
     */
    public String getName() {
        return name;
    }

    /**
     * Set the name of the subject.
     * 
     * @param name The name of the subject.
     */
    public void setName(String name) {
        this.name = name;
    }
}
