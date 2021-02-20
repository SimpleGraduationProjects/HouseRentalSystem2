package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.model.*;
import com.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.IntegerEditor;
import com.sun.beans.editors.LongEditor;

import com.service.*;


/*管理员用户*/
@Controller
public class UserController {


    @Resource
    private UserService userService;

    @Resource
    private DepService depService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());
        binder.registerCustomEditor(double.class, new DoubleEditor());
        binder.registerCustomEditor(float.class, new FloatEditor());
    }


    //显示添加页面
    @RequestMapping("/createUser")
    public ModelAndView createUser() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("depts", depService.getList(null));
        mav.addObject("nationals", userService.getNationals());
        mav.addObject("educations", userService.getEducation());

        mav.setViewName("user/createUser");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存添加的内容
    @RequestMapping("/saveUser")
    public ModelAndView saveUser(User user) {
        user.setNumber(String.valueOf(System.currentTimeMillis()));

        userService.saveEntity(user);

        return new ModelAndView("redirect:/searchUser.do");//跳转到控制器
    }

    //显示更新编辑页面
    @RequestMapping("/updateUser/{id}")
    public ModelAndView updateUser(@PathVariable("id") Integer id) {
        User user = userService.getUserById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("depts", depService.getList(null));
        mav.addObject("nationals", userService.getNationals());
        mav.addObject("educations", userService.getEducation());
        mav.addObject("users", user);

        mav.setViewName("user/updateUser");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //保存编辑后的数据
    @RequestMapping("/editUser/{id}")
    public ModelAndView editUser(@PathVariable("id") Integer id, User user, HttpSession session) {
        user.setId(id);
        userService.updateEntity(user);


        User user1111 = (User) session.getAttribute("user_session");
        if (user1111.getRoleId() == 0) {


            //管理员返回列表
            return new ModelAndView("redirect:/searchUser.do");//跳转到控制器
        }else{


            //非管理员返回修改界面
            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "修改成功");
            mav.addObject("path", "updateUser/"+id+".do");
            mav.setViewName("message");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

            return mav;

        }

    }


    //列表显示数据
    @RequestMapping("/searchUser")
    public ModelAndView searchUser(HttpServletRequest request, ModelMap params) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        String keyword = request.getParameter("keyword");//搜索关键词

        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数

        int rowCountTotal = userService.getCount(parameter);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<User> users = userService.getList(parameter);


        //设定页面参数,传递给JSP页面
        Map<String, Object> pager = new HashMap<String, Object>();
        int pageCount = 1;// 总页数
        // 计算总页数
        if (rowCountTotal % pageSize == 0) {
            pageCount = rowCountTotal / pageSize;
        } else {
            pageCount = rowCountTotal / pageSize + 1;
        }
        pager.put("pageNumber", pageNumber);//当前页
        pager.put("pageCount", pageCount);//总页数
        pager.put("rowCountTotal", rowCountTotal);//记录总条数


        ModelAndView mav = new ModelAndView();
        mav.addObject("listData", users);
        mav.addObject("keyword", keyword);
        mav.addObject("pager", pager);
        mav.setViewName("user/searchUser");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/deleteUser/{id}")
    public ModelAndView deleteUser(@PathVariable("id") Integer id) {

        userService.deleteEntity(id);

        return new ModelAndView("redirect:/searchUser.do");//跳转到控制器

    }






    //修改密码
    @RequestMapping("/updateUserPassword/{id}")
    public ModelAndView updateUserPassword(@PathVariable("id") Integer id, String new_password, HttpSession session) {
        User user = userService.getUserById(id);
        user.setPassword(new_password);

        userService.updateEntity(user);


        session.setAttribute("users", user);//新密码更新到缓存

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "修改成功");
        mav.addObject("path", "changePwd.jsp");
        mav.setViewName("message");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

        return mav;
    }


    //备用代码输出AJAX例子
   /* @RequestMapping("/getUserWages/{user_id}")
    public @ResponseBody
    Map<String, Object> getUserWages(@PathVariable("user_id") Integer user_id, HttpServletRequest request) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();

        User user = userService.getUserById(user_id);


        result.put("money", user.getWages());

        return result;
    }*/
}
