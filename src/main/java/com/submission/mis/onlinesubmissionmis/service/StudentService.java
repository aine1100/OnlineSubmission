package com.submission.mis.onlinesubmissionmis.service;

import com.submission.mis.onlinesubmissionmis.model.Student;
import com.submission.mis.onlinesubmissionmis.util.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import java.util.List;

public class StudentService {
    protected static SessionFactory sessionFactory= Hibernate.getSessionFactory();
    protected static Session session;
    protected static StudentService studentService;
    public static StudentService getInstance(){
        if(studentService==null){
            studentService=new StudentService();
            return studentService;
        }
        return studentService;
    }
    public StudentService(){}
    public void addStudent(Student student){
        session=sessionFactory.openSession();
        session.beginTransaction();
        session.persist(student);
        session.getTransaction().commit();
        session.close();
    }
    public boolean emailExists(String email){
        session=sessionFactory.openSession();
        session.beginTransaction();

        Query<Student> query=session.createQuery("FROM Student WHERE email= :email");
        query.setParameter("email", email);

        boolean exists=!query.getResultList().isEmpty();
        session.close();
        return exists;

    }

}
