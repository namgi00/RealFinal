package org.dawin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/country")
public class MapController {

    @GetMapping("/show")
    public String showMap() {
        return "country/map"; // map.jsp 파일 이름이 맞는 경우
    }
}
