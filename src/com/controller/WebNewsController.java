package com.controller;

import com.model.News;
import com.service.NewsService;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*新闻公告*/
@Controller
public class WebNewsController  extends WebBaseController {
    @Resource
    private NewsService newsService;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());
        binder.registerCustomEditor(double.class, new DoubleEditor());
        binder.registerCustomEditor(float.class, new FloatEditor());
    }



    //列表显示数据
    @RequestMapping("/webSearchNews")
    public ModelAndView webSearchNews(HttpServletRequest request,
                                   ModelMap params) {
        Map<String, Object> parameter = new HashMap<String, Object>();


        String keyword = request.getParameter("keyword");//搜索关键词

        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数

        int rowCountTotal = newsService.getCount(parameter);//获取总数


        int pageSize = 10;// 分页大小
        int pageNumber =1;
        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber =Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<News> newss = newsService.getList(parameter);




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
        mav.addObject("listData", newss);
        mav.addObject("keyword", keyword);
        mav.addObject("pager", pager);

        List<News> newsList = this.getNewsList();
        mav.addObject("newsList", newsList);

        mav.setViewName("web/news_search");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //在页面显示单条数据详情
    @RequestMapping("/webSearchNewsInfo/{id}")
    public ModelAndView webSearchNewsInfo(@PathVariable("id") Integer id) {
        News news = newsService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("news", news);
        List<News> newsList = this.getNewsList();
        mav.addObject("newsList", newsList);

         mav.setViewName("web/news_info");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }




}
