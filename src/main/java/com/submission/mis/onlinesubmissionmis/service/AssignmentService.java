package com.submission.mis.onlinesubmissionmis.service;

import com.submission.mis.onlinesubmissionmis.model.Assignment;
import com.submission.mis.onlinesubmissionmis.model.Student;
import com.submission.mis.onlinesubmissionmis.util.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;


public class AssignmentService {
    protected static SessionFactory sessionFactory= Hibernate.getSessionFactory();
    protected static Session session;
    protected static AssignmentService assignmentService;
    public static AssignmentService getInstance(){
        if(assignmentService==null){
            assignmentService=new AssignmentService();
            return assignmentService;
        }
        return assignmentService;
    }
    public AssignmentService(){}
    public void addAssignment(Assignment assignment){
        session=sessionFactory.openSession();
        session.beginTransaction();
        session.persist(assignment);
        session.getTransaction().commit();
        session.close();
    }

    public List<Assignment> getAssignment(){
        session=sessionFactory.openSession();
        session.beginTransaction();
        Query<Assignment> assignmentQuery=session.createQuery("FROM Assignment ",Assignment.class);
        List<Assignment> assignmentList=assignmentQuery.list();
        session.getTransaction().commit();
        session.close();
        return assignmentList;
    }

}
