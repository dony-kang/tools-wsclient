package com.mocomsys.tools.wsclient.wsclient.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@CrossOrigin(origins = "*")
@Controller
public class RequestForm {

    @RequestMapping(value = "/wsclient.do")
    public String getWSClient(@RequestParam Map<String, Object> params) {
        System.out.println(params);

        return "wsform";
    }

    @RequestMapping(value = "/testRest.do", method = RequestMethod.POST)
    public void receiveData(@RequestBody Map<String, Object> params) {
        System.out.println(params);
    }

}