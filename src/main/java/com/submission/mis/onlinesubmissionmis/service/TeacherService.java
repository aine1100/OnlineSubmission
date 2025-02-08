package com.submission.mis.onlinesubmissionmis.service;

import com.submission.mis.onlinesubmissionmis.model.Student;
import com.submission.mis.onlinesubmissionmis.model.Teacher;
import com.submission.mis.onlinesubmissionmis.util.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import java.util.List;

public class TeacherService {
    protected static SessionFactory sessionFactory= Hibernate.getSessionFactory();
    protected static Session session;
    protected static TeacherService teacherService;
    public static TeacherService getInstance(){
        if(teacherService==null){
            teacherService=new TeacherService();
            return teacherService;
        }
        return teacherService;
    }
    public TeacherService(){}
    public void addTeacher(Teacher teacher){
        session=sessionFactory.openSession();
        session.beginTransaction();
        session.persist(teacher);
        session.getTransaction().commit();
        session.close();
    }
    public boolean emailExists(String email){
        session=sessionFactory.openSession();
        session.beginTransaction();

        Query<Student> query=session.createQuery("FROM Teacher WHERE email= :email");
        query.setParameter("email", email);

        boolean exists=!query.getResultList().isEmpty();
        session.close();
        return exists;

    }

}
