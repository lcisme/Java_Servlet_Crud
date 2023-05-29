package com.example.buoi4.servlet;

import com.example.buoi4.dao.UserDao;
import com.example.buoi4.entity.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    UserDao userDao = new UserDao();
    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        try {
            PrintWriter out = response.getWriter();
            UserEntity user = new UserEntity("T2108E 2",22,"Ha Noi Viet Nam");
            userDao.insertUser(user);
            out.println("create user success");
        }catch (Exception ex){
            log(ex.getMessage());
        }

    }
    public void destroy() {
    }
}
