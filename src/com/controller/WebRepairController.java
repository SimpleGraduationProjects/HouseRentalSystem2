package com.controller;

import com.model.Customer;
import com.model.News;
import com.model.Repair;
import com.model.Room;
import com.service.CustomerService;
import com.service.RepairService;
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
import java.util.*;

/*报修*/
@Controller
public class WebRepairController extends WebBaseController {
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
    @RequestMapping("/webCreateRepair")
    public ModelAndView webCreateRepair(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        Map<String, Object> parameter = new HashMap<String, Object>();
        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的
        List<Room> rooms = roomService.getList(parameter);//获得居民的房屋


        //mav.addObject("customer", customerService.getList(parameter));
        mav.addObject("room", rooms);


        mav.setViewName("web/repair_create");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        return mav;
    }


    //保存添加的内容
    @RequestMapping("/webSaveRepair")
    public ModelAndView webSaveRepair(Repair repair) {
        repair.setCreateTime(new Date());
        repairService.saveEntity(repair);

        return new ModelAndView("redirect:/webSearchRepair.do");//跳转到控制器
    }


    //显示更新编辑页面
    @RequestMapping("/webUpdateRepair/{id}")
    public ModelAndView webUpdateRepair(@PathVariable("id") Integer id, HttpSession session) {
        Repair repair = repairService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("repair", repair);


        Map<String, Object> parameter = new HashMap<String, Object>();
        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的
        List<Room> rooms = roomService.getList(parameter);//获得居民的房屋


        //mav.addObject("customer", customerService.getList(parameter));
        mav.addObject("room", rooms);
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        mav.setViewName("web/repair_update");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/webEditRepair/{id}")
    public ModelAndView webEditRepair(@PathVariable("id") Integer id, Repair repair) {
        repair.setId(id);
        repairService.updateEntity(repair);

        return new ModelAndView("redirect:/webSearchRepair.do");//跳转到控制器

    }

    //列表显示数据
    @RequestMapping("/webSearchRepair")
    public ModelAndView webSearchRepair(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的
        List<Room> rooms = roomService.getList(parameter);//获得居民的房屋

        //只显示当前居民的房屋 涉及的报修
        ArrayList  roomsid = new ArrayList<String>();
        for (int i = 0; i < rooms.size(); i++) {
            Room room = (Room) rooms.get(i);//转为MAP
            int id = room.getId();//获取 房产ID
            roomsid.add(  String.valueOf(id));
        }
        Map<String, Object> parameter11 = new HashMap<String, Object>();
        parameter11.put("roomsid", roomsid);
        int rowCountTotal = repairService.getCount(parameter11);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Repair> repairs = repairService.getList(parameter11);


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

        mav.addObject("pager", pager);
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        mav.setViewName("web/repair_search");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/webDeleteRepair/{id}")
    public ModelAndView webDeleteRepair(@PathVariable("id") Integer id) {
        repairService.deleteEntity(id);

        return new ModelAndView("redirect:/webSearchRepair.do");//跳转到控制器

    }

}
