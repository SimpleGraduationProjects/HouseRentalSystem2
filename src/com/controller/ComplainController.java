package com.controller;

import com.model.Complain;
import com.service.CustomerService;
import com.service.ComplainService;
import com.service.RoomService;
import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.IntegerEditor;
import com.sun.beans.editors.LongEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*投诉*/
@Controller
public class ComplainController {
    @Resource
    private ComplainService complainService;

    @Resource
    private CustomerService customerService;

    @Resource
    private RoomService roomService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());
        binder.registerCustomEditor(double.class, new DoubleEditor());
        binder.registerCustomEditor(float.class, new FloatEditor());
    }


    //显示添加页面
    @RequestMapping("/createComplain")
    public ModelAndView createComplain(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        Map<String, Object> parameter = new HashMap<String, Object>();


        mav.addObject("room", roomService.getList(parameter));

        mav.addObject("customer", customerService.getList(parameter));
        mav.setViewName("complain/createComplain");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

        return mav;
    }


    //保存添加的内容
    @RequestMapping("/saveComplain")
    public ModelAndView saveComplain(Complain complain) {
        complainService.saveEntity(complain);

        return new ModelAndView("redirect:/searchComplain.do");//跳转到控制器
    }


    //显示更新编辑页面
    @RequestMapping("/updateComplain/{id}")
    public ModelAndView updateComplain(@PathVariable("id") Integer id, HttpSession session) {
        Complain complain = complainService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("complain", complain);


         Map<String, Object> parameter = new HashMap<String, Object>();

        mav.addObject("customer", customerService.getList(parameter));
        mav.addObject("room", roomService.getList(parameter));

        mav.setViewName("complain/updateComplain");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/editComplain/{id}")
    public ModelAndView editDept(@PathVariable("id") Integer id, Complain complain) {
        complain.setId(id);
        complainService.updateEntity(complain);

        return new ModelAndView("redirect:/searchComplain.do");//跳转到控制器

    }

    //列表显示数据
    @RequestMapping("/searchComplain")
    public ModelAndView searchComplain(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        String keyword = request.getParameter("keyword");//搜索关键词

        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数



        int rowCountTotal = complainService.getCount(parameter);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Complain> complains = complainService.getList(parameter);


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
        mav.addObject("listData", complains);
        mav.addObject("keyword", keyword);
        mav.addObject("pager", pager);

        mav.setViewName("complain/searchComplain");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/deleteComplain/{id}")
    public ModelAndView deleteComplain(@PathVariable("id") Integer id) {
        complainService.deleteEntity(id);

        return new ModelAndView("redirect:/searchComplain.do");//跳转到控制器

    }

}
