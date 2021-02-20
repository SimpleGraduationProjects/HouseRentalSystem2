package com.controller;

import com.model.Customer;
import com.model.News;
import com.service.NewsService;
import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.IntegerEditor;
import com.sun.beans.editors.LongEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.annotation.Resource;
import javax.servlet.jsp.JspContext;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*前台页面的基础类*/
@Controller
public class WebBaseController<customer> {

    @Resource
    private NewsService newsService;
    private JspContext session;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());
        binder.registerCustomEditor(double.class, new DoubleEditor());
        binder.registerCustomEditor(float.class, new FloatEditor());
    }


    // 公共方法 提供公共查询数据
    //不用再到每个方法里提取
    public List getNewsList() {

        if (session != null) {
            Customer customer = (Customer) session.getAttribute("customer_session");
            if (customer != null) session.setAttribute("customer_session", customer);
        }

        Map<String, Object> parameter1 = new HashMap<String, Object>();
        parameter1.put("limit", 6);//搜索参数
        parameter1.put("start", 0);//搜索参数
        List<News> newsList = newsService.getList(parameter1);
        return newsList;
    }


}
