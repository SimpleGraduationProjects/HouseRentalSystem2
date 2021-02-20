package com.controller;

import com.model.Room;
import com.model.User;
import com.service.CustomerService;
import com.service.FloorService;
import com.service.RoomService;
import com.service.UserService;
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

/*房产*/
@Controller
public class RoomController {
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


    //显示添加页面
    @RequestMapping("/createRoom")
    public ModelAndView createRoom(HttpSession session) {
        ModelAndView mav = new ModelAndView();



        Map<String, Object> parameter = new HashMap<String, Object>();

        mav.addObject("floor", floorService.getList(parameter));
        mav.addObject("customer", customerService.getList(parameter));
        mav.setViewName("room/createRoom");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

        return mav;
    }


    //保存添加的内容
    @RequestMapping("/saveRoom")
    public ModelAndView saveRoom(Room room) {
        roomService.saveEntity(room);

        return new ModelAndView("redirect:/searchRoom.do");//跳转到控制器
    }


    //显示房产照片
    @RequestMapping("/getRoomPhoto/{id}")
    public ModelAndView getRoomPhoto(@PathVariable("id") Integer id, HttpSession session) {
        Room room = roomService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("room", room);




        mav.setViewName("room/photo");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //显示更新编辑页面
    @RequestMapping("/updateRoom/{id}")
    public ModelAndView updateRoom(@PathVariable("id") Integer id, HttpSession session) {
        Room room = roomService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("room", room);



        Map<String, Object> parameter = new HashMap<String, Object>();

        mav.addObject("floor", floorService.getList(parameter));
        mav.addObject("customer", customerService.getList(parameter));


        mav.setViewName("room/updateRoom");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/editRoom/{id}")
    public ModelAndView editDept(@PathVariable("id") Integer id, Room room) {
        room.setId(id);
        roomService.updateEntity(room);

        return new ModelAndView("redirect:/searchRoom.do");//跳转到控制器

    }

    //列表显示数据
    @RequestMapping("/searchRoom")
    public ModelAndView searchRoom(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        String keyword = request.getParameter("keyword");//搜索关键词

        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数

        String floor_id = request.getParameter("floor_id");//搜索关键词

        if (floor_id != null && floor_id != "") parameter.put("floor_id", floor_id);//搜索参数


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
        mav.addObject("keyword", keyword);
        mav.addObject("floor_id", floor_id);
        mav.addObject("pager", pager);
        mav.addObject("floor", floorService.getList(parameter));

        mav.setViewName("room/searchRoom");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/deleteRoom/{id}")
    public ModelAndView deleteRoom(@PathVariable("id") Integer id) {
        roomService.deleteEntity(id);

        return new ModelAndView("redirect:/searchRoom.do");//跳转到控制器

    }

}
