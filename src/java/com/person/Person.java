package com.person;

import java.math.BigDecimal;
import java.sql.Date;

public class Person {

    private Integer id;
    private String firstName;
    private String lastName;
    private Date birthData;
    private BigDecimal salary;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setBirthData(Date birthData) {
        this.birthData = birthData;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }

    public Integer getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Date getBirthData() {
        return birthData;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    public Person(Integer id, String name, String surName, Date birthData, BigDecimal salary) {
        firstName = name;
        lastName = surName;
        this.birthData = birthData;
        this.salary = salary;
        this.id = id;
    }

    @Override
    public String toString() {
        return "Person{" + "firstName=" + firstName + ", lastName=" + lastName + ", birthData=" + birthData + ", salary=" + salary + '}';
    }
}
