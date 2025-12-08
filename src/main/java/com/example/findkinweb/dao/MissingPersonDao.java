package com.example.findkinweb.dao;

import com.example.findkinweb.entity.MissingPerson;
import com.example.findkinweb.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MissingPersonDao {

    public void save(MissingPerson person) {
        String sql = "INSERT INTO missing_person (user_id, name, gender, age, missing_time, missing_location, description, photo, contact_info, contact_visibility, status, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, person.getUserId());
            stmt.setString(2, person.getName());
            stmt.setString(3, person.getGender());
            stmt.setInt(4, person.getAge());
            stmt.setDate(5, java.sql.Date.valueOf(person.getMissingTime()));
            stmt.setString(6, person.getMissingLocation());
            stmt.setString(7, person.getDescription());
            stmt.setBytes(8, person.getPhoto());
            stmt.setString(9, person.getContactInfo());
            stmt.setInt(10, person.getContactVisibility());
            stmt.setInt(11, person.getStatus());
            stmt.setDate(12, java.sql.Date.valueOf(person.getCreateTime()));
            stmt.executeUpdate();
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    person.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<MissingPerson> findAll() {
        List<MissingPerson> people = new ArrayList<>();
        String sql = "SELECT * FROM missing_person";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MissingPerson person = new MissingPerson();
                person.setId(rs.getInt("id"));
                person.setUserId(rs.getInt("user_id"));
                person.setName(rs.getString("name"));
                person.setGender(rs.getString("gender"));
                person.setAge(rs.getInt("age"));
                person.setMissingTime(rs.getDate("missing_time").toLocalDate());
                person.setMissingLocation(rs.getString("missing_location"));
                person.setDescription(rs.getString("description"));
                person.setPhoto(rs.getBytes("photo"));
                person.setContactInfo(rs.getString("contact_info"));
                person.setContactVisibility(rs.getInt("contact_visibility"));
                person.setStatus(rs.getInt("status"));
                person.setCreateTime(rs.getDate("create_time").toLocalDate());
                people.add(person);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return people;
    }

    public List<MissingPerson> search(String location, java.time.LocalDate startTime, java.time.LocalDate endTime, Integer startAge, Integer endAge, String keyword) {
        List<MissingPerson> people = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM missing_person WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (location != null && !location.isEmpty()) {
            sql.append(" AND missing_location LIKE ?");
            params.add("%" + location + "%");
        }
        if (startTime != null) {
            sql.append(" AND missing_time >= ?");
            params.add(java.sql.Date.valueOf(startTime));
        }
        if (endTime != null) {
            sql.append(" AND missing_time <= ?");
            params.add(java.sql.Date.valueOf(endTime));
        }
        if (startAge != null) {
            sql.append(" AND age >= ?");
            params.add(startAge);
        }
        if (endAge != null) {
            sql.append(" AND age <= ?");
            params.add(endAge);
        }
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (name LIKE ? OR description LIKE ?)");
            params.add("%" + keyword + "%");
            params.add("%" + keyword + "%");
        }

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MissingPerson person = new MissingPerson();
                    person.setId(rs.getInt("id"));
                    person.setUserId(rs.getInt("user_id"));
                    person.setName(rs.getString("name"));
                    person.setGender(rs.getString("gender"));
                    person.setAge(rs.getInt("age"));
                    person.setMissingTime(rs.getDate("missing_time").toLocalDate());
                    person.setMissingLocation(rs.getString("missing_location"));
                    person.setDescription(rs.getString("description"));
                    person.setPhoto(rs.getBytes("photo"));
                    person.setContactInfo(rs.getString("contact_info"));
                    person.setContactVisibility(rs.getInt("contact_visibility"));
                    person.setStatus(rs.getInt("status"));
                    person.setCreateTime(rs.getDate("create_time").toLocalDate());
                    people.add(person);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return people;
    }

    public MissingPerson findById(int id) {
        String sql = "SELECT * FROM missing_person WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    MissingPerson person = new MissingPerson();
                    person.setId(rs.getInt("id"));
                    person.setUserId(rs.getInt("user_id"));
                    person.setName(rs.getString("name"));
                    person.setGender(rs.getString("gender"));
                    person.setAge(rs.getInt("age"));
                    person.setMissingTime(rs.getDate("missing_time").toLocalDate());
                    person.setMissingLocation(rs.getString("missing_location"));
                    person.setDescription(rs.getString("description"));
                    person.setPhoto(rs.getBytes("photo"));
                    person.setContactInfo(rs.getString("contact_info"));
                    person.setContactVisibility(rs.getInt("contact_visibility"));
                    person.setStatus(rs.getInt("status"));
                    person.setCreateTime(rs.getDate("create_time").toLocalDate());
                    return person;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void update(MissingPerson person) {
        String sql = "UPDATE missing_person SET name = ?, gender = ?, age = ?, missing_time = ?, missing_location = ?, description = ?, contact_info = ?, contact_visibility = ?, status = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, person.getName());
            stmt.setString(2, person.getGender());
            stmt.setInt(3, person.getAge());
            stmt.setDate(4, java.sql.Date.valueOf(person.getMissingTime()));
            stmt.setString(5, person.getMissingLocation());
            stmt.setString(6, person.getDescription());
            stmt.setString(7, person.getContactInfo());
            stmt.setInt(8, person.getContactVisibility());
            stmt.setInt(9, person.getStatus());
            stmt.setInt(10, person.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM missing_person WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countAll() {
        String sql = "SELECT COUNT(*) FROM missing_person";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countFound() {
        String sql = "SELECT COUNT(*) FROM missing_person WHERE status = 1";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countLast7Days() {
        String sql = "SELECT COUNT(*) FROM missing_person WHERE create_time >= DATE_SUB(NOW(), INTERVAL 7 DAY)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}

