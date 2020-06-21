package com.controller;

import com.model.Cost;
import com.model.Customer;
import com.model.News;
import com.model.Room;
import com.service.CostService;
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
import java.util.*;

/*缴费*/
@Controller
public class WebCostController extends WebBaseController  {
    @Resource
    private CostService costService;

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


    //列表显示数据
    @RequestMapping("/webSearchCost")
    public ModelAndView webSearchCost(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();

        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的
        List<Room> rooms = roomService.getList(parameter);//获得居民的房屋

        //只显示当前居民的房屋 涉及的报修
        ArrayList roomsid = new ArrayList<String>();
        for (int i = 0; i < rooms.size(); i++) {
            Room room = (Room) rooms.get(i);//转为MAP
            int id = room.getId();//获取 房产ID
            roomsid.add(  String.valueOf(id));
        }
        Map<String, Object> parameter11 = new HashMap<String, Object>();
        parameter11.put("roomsid", roomsid);

        int rowCountTotal = costService.getCount(parameter11);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Cost> costs = costService.getList(parameter);


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
        mav.addObject("listData", costs);

        mav.addObject("pager", pager);
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        mav.setViewName("web/cost_search");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //支付
    @RequestMapping("/webPayCost/{id}")
    public ModelAndView webPayCost(@PathVariable("id") Integer id) {
        Cost cost = costService.getEntityById(id);

        cost.setInfo("已支付");
        costService.updateEntity(cost);
        return new ModelAndView("redirect:/webSearchCost.do");//跳转到控制器

    }


    //退款
    @RequestMapping("/webReturnCost/{id}")
    public ModelAndView webReturnCost(@PathVariable("id") Integer id) {
        Cost cost = costService.getEntityById(id);

        cost.setInfo("已退款");
        costService.updateEntity(cost);
        return new ModelAndView("redirect:/webSearchCost.do");//跳转到控制器

    }


}
