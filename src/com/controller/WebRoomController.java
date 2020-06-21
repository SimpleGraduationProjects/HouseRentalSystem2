package com.controller;

import com.model.Customer;
import com.model.News;
import com.model.Room;
import com.service.CustomerService;
import com.service.FloorService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*房产*/
@Controller
public class WebRoomController extends WebBaseController {
    @Resource
    private RoomService roomService;

    @Resource
    private FloorService floorService;

    @Resource
    private CustomerService customerService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());
        binder.registerCustomEditor(double.class, new DoubleEditor());
        binder.registerCustomEditor(float.class, new FloatEditor());
    }


    //显示更新编辑页面
    @RequestMapping("/WebUpdateRoom/{id}")
    public ModelAndView WebUpdateRoom(@PathVariable("id") Integer id, HttpSession session) {
        Room room = roomService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("room", room);


        Map<String, Object> parameter = new HashMap<String, Object>();

        mav.addObject("floor", floorService.getList(parameter));
        mav.addObject("customer", customerService.getList(parameter));

        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        mav.setViewName("web/room_update");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //显示更新编辑页面
    @RequestMapping("/webUpdateRoomMap/{id}")
    public ModelAndView WebUpdateRoomMap(@PathVariable("id") Integer id, HttpSession session) {


        ModelAndView mav = new ModelAndView();
        mav.addObject("floor", floorService.getEntityById(id));
        mav.setViewName("web/room_search_public_Map");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //退租
    @RequestMapping("/webUpdateRoomDelete/{id}")
    public ModelAndView webUpdateRoomDelete(@PathVariable("id") Integer id, HttpSession session,HttpServletRequest request) {


        //退租
        roomService.updateRoomDeleteCustomer(id);

        Map<String, Object> parameter = new HashMap<String, Object>();
        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的
        int rowCountTotal = roomService.getCount(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Room> rooms = roomService.getList(parameter);
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
        mav.addObject("listData", rooms);
        mav.addObject("customer_id", customer_id);
        mav.addObject("pager", pager);
        mav.addObject("floor", floorService.getList(parameter));
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);
        mav.setViewName("web/room_search");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;

    }

    @RequestMapping("/getRoom")
    @ResponseBody
    public String getRoom(Integer id) throws Exception {
        return roomService.getEntityById(id).getCustomer_id();
    }




    //列表显示数据所有
    @RequestMapping("/webSearchRoom_public")
    public ModelAndView webSearchRoom_public(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        parameter.put("customer_id", 0);//只显示当前登录用户的


        int rowCountTotal = roomService.getCount(parameter);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Room> rooms = roomService.getList(parameter);


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
        mav.addObject("listData", rooms);

        mav.addObject("pager", pager);
        mav.addObject("floor", floorService.getList(parameter));

        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);
        mav.setViewName("web/room_search_public");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //列表显示数据---已经拥有  租赁的
    @RequestMapping("/webSearchRoom")
    public ModelAndView webSearchRoom(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的


        int rowCountTotal = roomService.getCount(parameter);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Room> rooms = roomService.getList(parameter);


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
        mav.addObject("listData", rooms);
        mav.addObject("customer_id", customer_id);
        mav.addObject("pager", pager);
        mav.addObject("floor", floorService.getList(parameter));

        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);
        mav.setViewName("web/room_search");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    // 保存租赁房屋
    @RequestMapping("/webUpdateRoom/{id}")
    public ModelAndView webUpdateRoom(@PathVariable("id") Integer id, HttpSession session) {
        Room room = roomService.getEntityById(id);
        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();

        room.setCustomer_id(String.valueOf(customer_id));

        roomService.updateEntity(room);


        return new ModelAndView("redirect:/webSearchRoom.do");//跳转到控制器

    }


}
