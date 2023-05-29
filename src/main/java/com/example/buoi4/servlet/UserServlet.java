package com.example.buoi4.servlet;

import com.example.buoi4.dao.UserDao;
import com.example.buoi4.entity.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String check = req.getParameter("check");

    if (check == null){
        check = "";
    }

    switch (check){
        case "createUser":
            req.getRequestDispatcher("user/createUser.jsp").forward(req, resp);
            break;
        case "editUser":
            editUser(req, resp);
            break;
        case "deleteUser":
            deleteUser(req, resp);
            break;
        default:
            userList(req, resp);
            break;
    }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String check = req.getParameter("check");

        if (check == null){
            check = "";
        }

        switch (check){
            case "createUser":
                createUser(req,resp);
                break;
            case "updateUser":
                updateUser(req,resp);
                break;
        }
    }
    private void userList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserEntity> listUser = userDao.getAllUser();
        req.setAttribute("listUser", listUser);
        req.getRequestDispatcher("user/listUser.jsp").forward(req,resp);
    }
    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("userName");
        String age = req.getParameter("userAge");
        String address = req.getParameter("userAddress");

        UserEntity userEntity = new UserEntity(name,Integer.parseInt(age),address);
        userDao.insertUser(userEntity);
        userList(req,resp);
    }
    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("userId"));
        UserEntity userEntity = userDao.findUserById(id);
        req.setAttribute("user", userEntity);
        req.getRequestDispatcher("user/editUser.jsp").forward(req,resp);
    }
    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("userId");
        String name = req.getParameter("userName");
        String age = req.getParameter("userAge");
        String address = req.getParameter("userAddress");

        UserEntity userEntity = new UserEntity(Integer.parseInt(id) ,name, Integer.parseInt(age), address);
        userDao.updateUser(userEntity);
        userList(req,resp);
    }
    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        userDao.deleteUser(id);

        userList(req,resp);
    }
}

