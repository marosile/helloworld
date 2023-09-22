package io.marosile.helloworld.recruit.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import io.marosile.helloworld.recruit.model.service.RecruitService_OHS;


@Controller 
public class RecuritController2 {

	@Autowired
	private RecruitService_OHS service;
	
}
