package cn.com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Keven on 2017/7/3.
 */
@Controller
public class BaseController {
    @ExceptionHandler
    public String handlerException(Exception e, HttpServletRequest request) {
        request.setAttribute("error", e.getMessage());
        return "error";
    }
}