package com.controller;

import com.model.Complain;
import com.model.Customer;
import com.model.News;
import com.service.ComplainService;
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

/*投诉*/
@Controller
public class WebComplainController extends WebBaseController {
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
    @RequestMapping("/webCreateComplain")
    public ModelAndView webCreateComplain(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        //mav.addObject("customer", customerService.getList(parameter));
        mav.setViewName("web/complain_create");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        return mav;
    }


    //保存添加的内容
    @RequestMapping("/webSaveComplain")
    public ModelAndView webSaveComplain(Complain complain, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        complain.setCustomer_id(String.valueOf(customer_id));
        complain.setCreateTime(new Date());
        complainService.saveEntity(complain);

        return new ModelAndView("redirect:/webSearchComplain.do");//跳转到控制器
    }


    //显示更新编辑页面
    @RequestMapping("/webUpdateComplain/{id}")
    public ModelAndView webUpdateComplain(@PathVariable("id") Integer id, HttpSession session) {
        Complain complain = complainService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("complain", complain);


        Map<String, Object> parameter = new HashMap<String, Object>();

        //mav.addObject("customer", customerService.getList(parameter));
        //mav.addObject("room", roomService.getList(parameter));
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        mav.setViewName("web/complain_update");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/webEditComplain/{id}")
    public ModelAndView webEditComplain(@PathVariable("id") Integer id, Complain complain) {
        complain.setId(id);
        complainService.updateEntity(complain);

        return new ModelAndView("redirect:/webSearchComplain.do");//跳转到控制器

    }

    //列表显示数据
    @RequestMapping("/webSearchComplain")
    public ModelAndView webSearchComplain(HttpServletRequest request, ModelMap params, HttpSession session) throws Exception {
        Map<String, Object> parameter = new HashMap<String, Object>();


        String keyword = request.getParameter("keyword");//搜索关键词

        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数

        Customer customer = (Customer) session.getAttribute("customer_session");
        int customer_id = customer.getId();
        parameter.put("customer_id", customer_id);//只显示当前登录用户的


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
        List<News> newsList = this.getNewsList();//加载公告,用于左侧显示
        mav.addObject("newsList", newsList);

        mav.setViewName("web/complain_search");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/webDeleteComplain/{id}")
    public ModelAndView webDeleteComplain(@PathVariable("id") Integer id) {
        complainService.deleteEntity(id);

        return new ModelAndView("redirect:/webSearchComplain.do");//跳转到控制器

    }

}
