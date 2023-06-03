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
        if(!Objects.isNull(req.getParameter("delete"))){
            userDao.deleteUser(Integer.parseInt(req.getParameter("userId")));
            List<UserEntity> listUser = userDao.getAllUser();
            req.setAttribute("listUser",listUser);
            req.getRequestDispatcher("user/listUser.jsp").forward(req,resp);
        }else {
            if (Objects.isNull(req.getParameter("userId"))){
                req.setAttribute("id","");
                req.setAttribute("name","");
                req.setAttribute("age","");
                req.setAttribute("address","");
                req.getRequestDispatcher("user/createOrUpdate.jsp").forward(req,resp);
            }
            else {
                req.setAttribute("id",req.getParameter("userId"));
                req.setAttribute("name",req.getParameter("userName"));
                req.setAttribute("age",req.getParameter("userAge"));
                req.setAttribute("address",req.getParameter("userAddress"));
                req.getRequestDispatcher("user/createOrUpdate.jsp").forward(req,resp);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserEntity userEntity;
            List<UserEntity> listUser;
            String name = req.getParameter("userName");
            Integer age = Integer.parseInt(req.getParameter("userAge"));
            String address = req.getParameter("userAddress");

            if (req.getParameter("userId").equals("")){
                userEntity = new UserEntity(name,age,address);
                userDao.insertUser(userEntity);
            }else {
                Integer id = Integer.parseInt(req.getParameter("userId"));
                userEntity = new UserEntity(id,name,age,address);
                userDao.updateUser(userEntity);
            }
            listUser = userDao.getAllUser();
            req.setAttribute("listUser",listUser);
            req.getRequestDispatcher("user/listUser.jsp").forward(req,resp);
        }catch (Exception ex){
            log(ex.getMessage());
            System.out.println(ex.getMessage());
        }
    }

//    @Override
//    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//
//            List<UserEntity> listUser;
//            Integer id = Integer.parseInt(req.getParameter("userId"));
//            userDao.deleteUser(id);
//            listUser = userDao.getAllUser();
//            req.setAttribute("listUser", listUser);
//            req.getRequestDispatcher("user/listUser.jsp").forward(req, resp);
//        }catch (Exception ex){
//            log(ex.getMessage());
//        }
//    }
}

