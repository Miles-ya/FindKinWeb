package com.example.findkinweb.entity;

import java.time.LocalDate;

public class MissingPerson {
    private int id;
    private int userId;
    private String name;
    private String gender;
    private int age;
    private LocalDate missingTime;
    private String missingLocation;
    private String description;
    private byte[] photo;
    private String contactInfo;
    private int contactVisibility;
    private int status;
    private LocalDate createTime;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public LocalDate getMissingTime() {
        return missingTime;
    }

    public void setMissingTime(LocalDate missingTime) {
        this.missingTime = missingTime;
    }

    public String getMissingLocation() {
        return missingLocation;
    }

    public void setMissingLocation(String missingLocation) {
        this.missingLocation = missingLocation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public int getContactVisibility() {
        return contactVisibility;
    }

    public void setContactVisibility(int contactVisibility) {
        this.contactVisibility = contactVisibility;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public LocalDate getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDate createTime) {
        this.createTime = createTime;
    }
}
