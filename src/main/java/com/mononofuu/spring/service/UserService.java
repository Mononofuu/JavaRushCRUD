package com.mononofuu.spring.service;

import com.mononofuu.spring.model.User;

import java.util.List;

public interface UserService {

    void addUser(User u);

    void updateUser(User u);

    List<User> listUsers();

    User getUserById(int id);

    void removeUser(int id);

}
