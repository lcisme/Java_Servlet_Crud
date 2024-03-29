package com.example.buoi4.entity;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class UserEntity {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    private Integer age;
    private String address;

    public UserEntity() {
    }
    public UserEntity(Integer id, String name, Integer age, String address) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.address = address;
    }

    public UserEntity(String name, Integer age, String address) {
        this.name = name;
        this.age = age;
        this.address = address;
    }


}
