package io.marosile.helloworld.study.service;

import io.marosile.helloworld.study.dao.StudyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudyServiceImpl implements StudyService{

    @Autowired
    private StudyDAO dao;

}
