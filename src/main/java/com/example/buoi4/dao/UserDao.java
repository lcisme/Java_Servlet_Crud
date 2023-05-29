package com.example.buoi4.dao;

import com.example.buoi4.entity.UserEntity;
import com.example.buoi4.util.PersistenceUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;

public class UserDao {
    EntityManager em;
    EntityTransaction tran;
    // tao ra tra ve 1 thang entitymanagerfactory ( neu cham create thi tao ra em)
    //
    public UserDao(){
        em = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        tran = em.getTransaction();
    }

    public void insertUser(UserEntity user){
        try{
            tran.begin();
            em.persist(user);
            tran.commit();
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            tran.rollback();
        }
    }
    public List<UserEntity> getAllUser(){
        try {
            Query query = em.createQuery("select a from UserEntity as a");
            return query.getResultList();
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void updateUser(UserEntity user) {
        try {
            tran.begin();
            em.merge(user);
            tran.commit();
        } catch (Exception ex){
            System.out.println(ex.getMessage());
            tran.rollback();
        }
    }

    public UserEntity findUserById(Integer id){
        UserEntity userEntity = null;
        try {
            em.find(UserEntity.class, id);
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            tran.rollback();
        }
        finally {
            em.close();
        }
        return userEntity;
    }
    public void deleteUser(Integer id){
        try {
            tran.begin();
            em.remove(id);
            tran.commit();

        } catch (Exception ex){
            System.out.println(ex.getMessage());
            tran.rollback();
        }
    }


}
