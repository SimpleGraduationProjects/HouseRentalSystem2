package com.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.model.*;


import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.IntegerEditor;
import com.sun.beans.editors.LongEditor;


import com.service.*;


@Controller
public class IndexController {


    @Resource
    private UserService userService;

    @Resource
    private RoomService roomService;

    @Resource
    private FloorService floorService;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());
        binder.registerCustomEditor(double.class, new DoubleEditor());
        binder.registerCustomEditor(float.class, new FloatEditor());
    }


    //首页
    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //显示登录界面
    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("info", "请登录");
        mav.setViewName("login");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //判断提交的表单 是否可以登录
    @RequestMapping("/userLogin")
    public ModelAndView userLogin(String account, String password, Integer roleId, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        map.put("account", account);
        map.put("password", password);
        map.put("roleId", roleId);

        User user = userService.userLogin(map);
        if (user == null) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("info", "用户名或密码错误！");
            mav.addObject("message", "用户名或密码错误！");
            mav.setViewName("login");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
            
            return mav;
        } else {
            session.setAttribute("user_session", user);
            return new ModelAndView("redirect:/index.do");//跳转到控制器

        }

    }


    //退出
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.setAttribute("user_session", null);//清空session缓存 的用户信息

        return new ModelAndView("redirect:login.do");//跳转到控制器
    }








}
