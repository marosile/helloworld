package io.marosile.helloworld.tag.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.tag.model.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TagController {

    @Autowired
    private TagService service;

    @PostMapping("/tag/list")
    @ResponseBody
    public String selectTagList() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(service.selectTagList());
    }

}
