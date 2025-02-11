package com.submission.mis.onlinesubmissionmis.model;

import jakarta.persistence.*;

@Entity
public class Assignment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private String description;
    private String course;

    @ManyToOne
    @JoinColumn(name = "teacher_id")  // Changed to reference teacher ID
    private Teacher teacher;

    public Assignment() {}

    // Corrected constructor
    public Assignment(String title, String description, Teacher teacher, String course) {
        this.title = title;
        this.description = description;
        this.teacher = teacher;
        this.course = course;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }
    public Teacher getTeacher() { return teacher; }
    public void setTeacher(Teacher teacher) { this.teacher = teacher; }
}