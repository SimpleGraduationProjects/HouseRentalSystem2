package com.controller;

import com.model.*;
import com.service.*;
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
public class NewsController {
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


    //显示添加页面
    @RequestMapping("/createNews")
    public ModelAndView createNews() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("news/createNews");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍

        return mav;
    }

    //保存添加的内容
    @RequestMapping("/saveNews")
    public ModelAndView saveNews(News news) {
        news.setUserId(1);
        news.setCreateTime(new Date());
        newsService.saveEntity(news);

        return new ModelAndView("redirect:/searchNews.do");//跳转到控制器
    }

    //显示更新编辑页面
    @RequestMapping("/updateNews/{id}")
    public ModelAndView updateNews(@PathVariable("id") Integer id) {
        News news = newsService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("news", news);

        mav.setViewName("news/updateNews");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //保存编辑后的数据
    @RequestMapping("/editNews/{id}")
    public ModelAndView editNews(@PathVariable("id") Integer id, News news) {
        news.setId(id);
        newsService.updateEntity(news);

        return new ModelAndView("redirect:/searchNews.do");//跳转到控制器

    }

    //列表显示数据
    @RequestMapping("/searchNews")
    public ModelAndView searchNews(HttpServletRequest request,
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
        mav.setViewName("news/searchNews");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }


    //在页面显示单条数据详情
    @RequestMapping("/searchNewsInfo/{id}")
    public ModelAndView searchNewsInfo(@PathVariable("id") Integer id) {
        News news = newsService.getEntityById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("news", news);

         mav.setViewName("news/searchNewsInfo");//设定页面显示的名称 ,对应WebContent目录下相应的jsp文件,  applicationContext.xml-viewResolver中定义文件前后辍
        return mav;
    }

    //删除数据
    @RequestMapping("/deleteNews/{id}")
    public ModelAndView deleteNews(@PathVariable("id") Integer id) {
        newsService.deleteEntity(id);

        return new ModelAndView("redirect:/searchNews.do");//跳转到控制器

    }


}
