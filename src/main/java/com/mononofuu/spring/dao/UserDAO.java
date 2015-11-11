package com.mononofuu.spring.dao;

import com.mononofuu.spring.model.User;

import java.util.List;

public interface UserDAO {

    void addUser(User u);

    void updateUser(User u);

    List<User> listUsers();

    User getUserById(int id);

    void removeUser(int id);
}
