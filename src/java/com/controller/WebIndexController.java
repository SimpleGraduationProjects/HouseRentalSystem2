package com.controller;

import com.model.Customer;
import com.model.News;
import com.service.CustomerService;
import com.service.FloorService;
import com.service.RoomService;
import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.IntegerEditor;
import com.sun.beans.editors.LongEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class WebIndexController extends WebBaseController {


    @Resource
    private CustomerService customerService;

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


    //前台首页
    @RequestMapping("/webIndex")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);
        mav.setViewName("/web/index");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //判断提交的表单 是否可以登录
    @RequestMapping("/webCustomerLogin")
    public ModelAndView userLogin(String loginname, String loginpassword, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        map.put("loginname", loginname);
        map.put("loginpassword", loginpassword);


        Customer customer = customerService.customerLogin(map);
        if (customer == null) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("info", "用户名或密码错误！");
            List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
            mav.addObject("newsList", newsList);
            mav.setViewName("web/index");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

            return mav;
        } else {
            session.setAttribute("customer_session", customer);
            return new ModelAndView("redirect:/webIndex.do");//跳转到控制器

        }

    }


    //保存添加的内容
    @RequestMapping("/regSave")
    public ModelAndView saveCustomer(Customer customer, HttpSession session) {
        customerService.saveEntity(customer);
        //session.setAttribute("customer_session", customer);

        return new ModelAndView("redirect:/webIndex.do");//跳转到控制器
    }





    //退出
    @RequestMapping("/webCustomerLogout")
    public ModelAndView logout(HttpSession session) {
        session.setAttribute("customer_session", null);//清空session缓存 的用户信息

        return new ModelAndView("redirect:/webIndex.do");//跳转到控制器
    }


    //显示个人资料更新编辑页面
    @RequestMapping("/webUpdateCustomer/{id}")
    public ModelAndView webUpdateCustomer(@PathVariable("id") Integer id, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer_session");

        ModelAndView mav = new ModelAndView();
        mav.addObject("customer", customer);


  /*      User user1111 = (User) session.getAttribute("user_session");
        Map<String, Object> parameter = new HashMap<String, Object>();
        if (user1111.getRoleId() != 0) {
            parameter.put("dept_id", user1111.getDeptId());//
        }
        mav.addObject("users", userService.getList(parameter));
*/
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);
        mav.setViewName("web/changeCustomer");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/webEditCustomer/{id}")
    public ModelAndView editDept(@PathVariable("id") Integer id, Customer customer, HttpSession session) {
        customer.setId(id);
        customerService.updateEntity(customer);
        session.setAttribute("customer_session", customer);//新密码更新到缓存

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "修改成功");
        mav.addObject("path", "web/changeCustomer.jsp");
        mav.setViewName("message");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        return mav;

    }



    //显示修改密码
    @RequestMapping("/webChangePwd")
    public ModelAndView webChangePwd() {
        ModelAndView mav = new ModelAndView();
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);
        mav.setViewName("/web/changePwd");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }



    //修改密码
    @RequestMapping("/webUpdatePassword/{id}")
    public ModelAndView webUpdatePassword(@PathVariable("id") Integer id, String new_password, HttpSession session) {
        Customer customer = customerService.getEntityById(id);
        customer.setLoginpassword(new_password);

        customerService.updateEntity(customer);


        session.setAttribute("customer_session", customer);//新密码更新到缓存

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "修改成功");
        mav.addObject("path", "web/changePwd.jsp");
        mav.setViewName("message");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        return mav;
    }

}
