package com.controller;

import com.model.Repair;
import com.service.RepairService;
import com.service.CustomerService;
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

/*报修*/
@Controller
public class RepairController {
    @Resource
    private RepairService repairService;

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
    @RequestMapping("/createRepair")
    public ModelAndView createRepair(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        Map<String, Object> parameter = new HashMap<String, Object>();


        mav.addObject("room", roomService.getList(parameter));

        mav.addObject("customer", customerService.getList(parameter));
        mav.setViewName("repair/createRepair");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

        return mav;
    }


    //保存添加的内容
    @RequestMapping("/saveRepair")
    public ModelAndView saveRepair(Repair repair) {
        repairService.saveEntity(repair);

        return new ModelAndView("redirect:/searchRepair.do");//跳转到控制器
    }


    //显示更新编辑页面
    @RequestMapping("/updateRepair/{id}")
    public ModelAndView updateRepair(@PathVariable("id") Integer id, HttpSession session) {
        Repair repair = repairService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("repair", repair);


         Map<String, Object> parameter = new HashMap<String, Object>();

        mav.addObject("customer", customerService.getList(parameter));
        mav.addObject("room", roomService.getList(parameter));

        mav.setViewName("repair/updateRepair");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/editRepair/{id}")
    public ModelAndView editDept(@PathVariable("id") Integer id, Repair repair) {
        repair.setId(id);
        repairService.updateEntity(repair);

        return new ModelAndView("redirect:/searchRepair.do");//跳转到控制器

    }

    //列表显示数据
    @RequestMapping("/searchRepair")
    public ModelAndView searchRepair(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        String keyword = request.getParameter("keyword");//搜索关键词

        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数



        int rowCountTotal = repairService.getCount(parameter);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Repair> repairs = repairService.getList(parameter);


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
        mav.addObject("listData", repairs);
        mav.addObject("keyword", keyword);
        mav.addObject("pager", pager);

        mav.setViewName("repair/searchRepair");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/deleteRepair/{id}")
    public ModelAndView deleteRepair(@PathVariable("id") Integer id) {
        repairService.deleteEntity(id);

        return new ModelAndView("redirect:/searchRepair.do");//跳转到控制器

    }

}
