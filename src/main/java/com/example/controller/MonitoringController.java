package com.example.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MonitoringController {

    @RequestMapping("/monitor")
    @ResponseBody
    public String monitor() {
        JSONObject json = new JSONObject();
        json.put("status", "OK");
        json.put("uptime", "24 hours");
        json.put("cpuUsage", "15%");
        json.put("memoryUsage", "60%");
        return json.toString();
    }
}
