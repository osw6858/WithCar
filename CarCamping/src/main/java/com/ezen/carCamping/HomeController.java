package com.ezen.carCamping;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.service.MemberMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
      @Autowired
      private MemberMapper memberMapper;
      
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model,HttpServletRequest req) {
      HttpSession session = req.getSession();
      Cookie[] cookie = req.getCookies();
       if(cookie !=null) {
    	   for(int i=0; i < cookie.length; i++){
       
            if(cookie[i].getName().equals("loginCookie")){
               String value = cookie[i].getValue();
               try {
                   MemberDTO dto = memberMapper.getMemberId(value);
                  session.setAttribute("mem_num",  dto.getMem_num());
                   session.setAttribute("mbdto", dto);
               }catch(Exception e) {}
            }
    	   } 
       }
   
      return "index";
   }
   
   @RequestMapping("/index.do")
   public String goIndex(HttpServletRequest req, HttpServletResponse resp) {

         return "index";

   }
   
}