package com.ezen.carCamping;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.ezen.carCamping.dto.LoginLogDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.service.LoginLogMapper;
import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.S3FileService;



@Controller
public class MemberController {
   
   @Autowired
   private MemberMapper memberMapper;
   
   @Autowired
   private JavaMailSenderImpl mailSender;
   
   @Autowired  
   private LoginLogMapper LoginLogMapper;

   @Resource(name="uploadPath")
	private String uploadPath;
   
   @Autowired
   private S3FileService S3FileService;
   
   @RequestMapping(value="login.login", method=RequestMethod.GET)
   public String login(HttpServletRequest req) {
	   HttpSession session = req.getSession();
	   String referer = req.getHeader("Referer");
	      if(referer.indexOf("login.login")>0) {//이전 페이지가 로그인 페이지라면
			  session.setAttribute("re_url",session.getAttribute("re_url"));
		   }else {
			   	//로그인 페이지가 아닌 다른 페이지 -> 로그인 페이지 -> 로그인 페이지가 아닌 다른 페이지
		       session.setAttribute("re_url", referer);
		   }
      return "login/login";
   }
   
@RequestMapping(value="findID.login", method=RequestMethod.GET)
   public String searchMemberID() {
      return "login/findID";
   }
   
   @RequestMapping(value="findPW.login", method=RequestMethod.GET)
   public String searchMemberPW() {
      return "login/findPW";
   }
   
   @RequestMapping(value="findID.login", method=RequestMethod.POST)
   public String checkMemberID(HttpServletRequest req, 
                           @RequestParam Map<String, String> params) {
      String msg = memberMapper.searchMemberID(params);
      String url = "login.login";
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);

      return "message";
   }
   
   @RequestMapping(value="findPW.login", method=RequestMethod.POST)
   public String checkMemberPW(HttpServletRequest req, 
                           @RequestParam Map<String, String> params) {
	   String mem_id = params.get("mem_id");
	   String mem_email = params.get("mem_email");
	   MemberDTO dto = memberMapper.getMemberByIdNEmail(mem_id,mem_email);
	   
	   if(dto!=null) {
	    int leftLimit = 48; // numeral '0'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();

	    String generatedString = random.ints(leftLimit,rightLimit + 1)
	      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString();
	    		
	    String from = "ektmf1101@naver.com";//보내는 이 메일주소
	    String to = mem_email;
	    String title = "[임시 비빌번호]를 확인해주세요";
	    String content = "[임시 비밀번호]는 ["+ generatedString +"] 입니다.<br/> 발급받으신 임시 비밀번호로 로그인 하시고, [프로필 ]- [내 정보] 에서 비밀번호를 변경해주세요.";
	   
	    try {
	    	MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       	        
	        mailSender.send(mail);
	        int mem_num = dto.getMem_num();
	        memberMapper.updatePassword(mem_num,generatedString);
	    } catch(Exception e) {
	    	req.setAttribute("msg", "임시비밀번호를 발급하는 중, 오류가 발생했습니다. 다시 시도해주세요");
	    }
	   }
	    req.setAttribute("msg", "임시비밀 번호 발송이 완료되었습니다.\\n입력한 이메일에서 임시 비밀번호를 확인 해주십시오.");
	    req.setAttribute("mode","selfClose");
	    
	    return "message";
   }

   
   
   @RequestMapping(value="login.login", method=RequestMethod.POST)
   public String loginOk(HttpServletRequest req, HttpServletResponse resp,         
         @RequestParam Map<String, String> params) {
	 
	 //관리자 로그인 추가 - 07/06 송재영
     if (params.get("mem_id").equals("0000") && params.get("mem_password").equals("486")) {
        req.setAttribute("msg", "관리자 페이지로 이동합니다");
        req.setAttribute("url", "goAdmin.admin"); 
         return "message";
     }
	   
	   
	  int login_success = 1;
      String msg = null, url = null;
      HttpSession session = req.getSession();
      if ( session.getAttribute("mbdto") != null ){// 기존에 login이란 세션 값이 존재한다면            
    	   session.removeAttribute("mbdto"); // 기존값을 제거함
      }
      MemberDTO dto = memberMapper.getMemberId(params.get("mem_id"));
      
      LoginLogDTO ldto = new LoginLogDTO();
      ldto.setLogin_auto(1);//자동로그인여부 나중에 변경
      ldto.setLogin_ip(req.getRemoteAddr()); //사용자ip
      ldto.setLogin_userId(params.get("mem_id"));//로그인접속id
   
      if (dto == null){ //해당 아이디가 없을 떄 
    	  ////LoginLog에 insert - 0
    	  ldto.setLogin_reason(0);
    	  int res = LoginLogMapper.insertLoginLogFail(ldto);
          msg = "해당하는 아이디가 없습니다. 다시 확인하고 로그인해 주세요!!";
          url = "login.login";
       }else { //해당 아이디가 있을 때

    	   if(dto.getMem_denied()==0) { // 해당 계정의 잠금상태가 1일때 (잠금상태)
    		   ldto.setLogin_reason(2); //LoginLog에 insert - 2
    		   int res = LoginLogMapper.insertLoginLogFail(ldto);
    		   req.setAttribute("msg", "해당 계정은 현재 잠금상태입니다.관리자에게 문의해주세요");
    		   req.setAttribute("url", "login.login");
    		   return "message";
    	    }
    	   else if (params.get("mem_password").equals(dto.getMem_password())){//해당 아이디의 비밃번호와 일치할 때 (로그인 성공)
    		   int res = LoginLogMapper.insertLoginLogSuccess(ldto);
    		   msg = dto.getMem_id()+"님, 환영합니다!!";
    		   url = (String) session.getAttribute("re_url");
    		   login_success = 0;
    		   session.setAttribute("mem_num",  dto.getMem_num());
    		   session.setAttribute("mbdto", dto);
    		   MemberDTO mdto = (MemberDTO)session.getAttribute("mbdto"); 
    		   req.setAttribute("getMember", mdto);
            

				Cookie loginCookie = new Cookie("loginCookie", dto.getMem_id());
				if (params.containsKey("loginCookie")) {
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60 * 60 * 24 * 3); // 유효시간 3일     
					resp.addCookie(loginCookie);
					String value = loginCookie.getValue();
					MemberDTO mbdto = memberMapper.getMemberId(value);
					session.setAttribute("mem_num", mbdto.getMem_num());
					session.setAttribute("mbdto", mbdto);
				} else {
					loginCookie.setMaxAge(0);
				}
				 
    	  	
    		   Cookie ck = new Cookie("saveId", dto.getMem_id());
    		   if (params.containsKey("saveId")){
    			   ck.setMaxAge(60*60*24);
    		   }else {
    			   ck.setMaxAge(0);
    		   }
    		   resp.addCookie(ck);
    	   }else {  //아이디는 맞으나 비밀번호가 틀릴 때
    		   int PasswordErrorCount = 5; //로그인 시도 - 틀린 비밀번호 제한 횟수
    		   String login_userId = dto.getMem_id(); // 로그인 시도 아이디
    		   ldto.setLogin_reason(1);//로그인 시도 - 비밀번호 틀림 - 1
    		   int res = LoginLogMapper.insertLoginLogFail(ldto);//로그인 내역 insert
    		   String latestLoginSuccessDate = LoginLogMapper.latestLoginSuccessDate(dto.getMem_id()); //해당 아이디의 최근 로그인 성공 날짜
    		   if(latestLoginSuccessDate!=null) { // 로그인 성공 내역이 있다면
    			   	int countLoginReason_0 = LoginLogMapper.countLoginReason_0(login_userId, latestLoginSuccessDate); // 로그인 성공 시기 이후부터 횟수를 count
    			   	if(countLoginReason_0==PasswordErrorCount) { //5번 틀렸다면
    			   		LoginLogMapper.DeniedMember(dto.getMem_id());//해당 회원의 이용 제한 상태 변경
    			   		req.setAttribute("msg", "비밀번호를 "+PasswordErrorCount+"번 틀리셨습니다.\\n 회원님의 계정은  이용 제한 상태로 변경됩니다.\\n관리자에게 문의해주세요");
    			   		req.setAttribute("url", "login.login");
    			   		return "message";
    			   	}
    			   	//비밀번호가 틀린 횟수 사용자에게 보여줌
    			    msg = "비밀번호를 " + countLoginReason_0 + "번 틀렸습니다.\\n비밀번호를 "+PasswordErrorCount+"번 틀리시면 계정이 이용제한됩니다.\\n꼭 다시 확인하고 로그인해 주세요!!";
    			    
    		   } else if(latestLoginSuccessDate==null) { // 최근 로그인 성공 내역이 없다면
    			   	int countLoginReason_0 = LoginLogMapper.countLoginReason_0_now(login_userId); // 현재 날짜 이후로 count
    			   	if(countLoginReason_0==PasswordErrorCount) { //이하 동일
    			   		LoginLogMapper.DeniedMember(dto.getMem_id());
    			   		req.setAttribute("msg", "비밀번호를 "+PasswordErrorCount+"번 틀리셨습니다.\\n 회원님의 계정은  이용 제한 상태로 변경됩니다.\\n관리자에게 문의해주세요");
    			   		req.setAttribute("url", "login.login");
    			   		return "message";
   			   		}
    			   	msg = "비밀번호를 " + countLoginReason_0 + "번 틀렸습니다.\\n비밀번호를 "+PasswordErrorCount+"번 틀리시면 계정이 이용제한됩니다.\\n꼭 다시 확인하고 로그인해 주세요!!";
    		   }
    		   url = "login.login";
    	   }
       	}	   
      	req.setAttribute("msg", msg);
      	req.setAttribute("url", url); 
      	return "message";
   }
   
   
   @RequestMapping(value="sign.login", method=RequestMethod.GET)
   public String sign() {
      return "login/sign";
   }
   
   @RequestMapping(value="sign.login", method=RequestMethod.POST)
   public String signOK(HttpServletRequest req,@ModelAttribute MemberDTO dto, BindingResult result) {
	   MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("mem_image");
		RegionDTO rdto = new RegionDTO();
		String filename = mf.getOriginalFilename();
	
		if (filename != null && !(filename.trim().equals(""))) {
			File file = new File(uploadPath, filename);
			try {
				dto.setMem_image(S3FileService.upload(mf));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
	  
      rdto.setRegion_num(Integer.parseInt(req.getParameter("region_num")));
      dto.setRegionDTO(rdto);
      int res = memberMapper.insertMember(dto);
      
       if (res>0) {
          req.setAttribute("msg", "회원가입 성공 ^__^");
          req.setAttribute("url", "index.do");
       }else {
          req.setAttribute("msg", "회원가입 실패ㅠ_ㅠ");
          req.setAttribute("url", "sign.login");
          
       }
      return "message";
   }
   
   @RequestMapping("/logout.login")
   public String logout(HttpServletRequest req, HttpServletResponse resp, @RequestParam Map<String, String> params) {

		HttpSession session = req.getSession();
		Cookie[] cookie = req.getCookies();
		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("loginCookie")) {
					cookie[i].setMaxAge(0);
					cookie[i].setPath("/");
					resp.addCookie(cookie[i]);
					break;
				}
			}
		}
		session.invalidate();
		req.setAttribute("msg", "로그아웃 되었습니다.");
		req.setAttribute("url", "index.do");
		return "message";

   }
	   	
   
	@RequestMapping("/checkId.login")
	public String checkID(HttpServletRequest req, @RequestParam String mem_id) {	
		  MemberDTO dto = memberMapper.getMemberId(mem_id);
	      int result = -1;
		  if (dto == null){   
	    	  result= 1;
	      }else {
	    	  result = 0;
	      }
		  req.setAttribute("result", result);
	      return "login/checkId";
	   }
	
	@RequestMapping("/checkNick.login")
	public String checkNick(HttpServletRequest req, @RequestParam String mem_nickName) {	
		  MemberDTO dto = memberMapper.getMemberNick(mem_nickName);
	      int result = -1;
		  if (dto == null){   
	    	  result= 1;
	      }else {
	    	  result = 0;
	      }
		  req.setAttribute("result", result);
	      return "login/checkNick";
	   }
	
  @RequestMapping("/checkEmail.login")
  public String checkEmail(HttpServletRequest req, @RequestParam String mem_email) {	
	  MemberDTO dto = memberMapper.getMemberEmail(mem_email);
      int result = -1;
	  if (dto == null){   
    	  result= 1;
      }else {
    	  result = 0;
      }
	  req.setAttribute("result", result);
      return "login/checkEmail";
   }
  @RequestMapping(value = "/CertifyEmail.login", method = RequestMethod.GET)
  @ResponseBody
  public String CertifyEmail(@RequestParam("mem_email") String mem_email) throws Exception{
    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
    
    String from = "ektmf1101@naver.com";//보내는 이 메일주소
    String to = mem_email;
    String title = "회원가입시 필요한 인증번호 입니다.";
    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
    String num = "";
    try {
    	MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
        
        mailHelper.setFrom(from);
        mailHelper.setTo(to);
        mailHelper.setSubject(title);
        mailHelper.setText(content, true);       
        
        mailSender.send(mail);
        num = Integer.toString(serti);
        
    } catch(Exception e) {
        num = "error";
    }
    return num;  
  }
 

  @RequestMapping(value = "/sendTempPW.login", method = RequestMethod.GET)
  @ResponseBody
  public String sendTempPW(@RequestParam("mem_id") String mem_id,@RequestParam("mem_email") String mem_email) throws Exception{
   // int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
    //랜덤 문자열 생성
    
    int leftLimit = 48; // numeral '0'
    int rightLimit = 122; // letter 'z'
    int targetStringLength = 10;
    Random random = new Random();

    String generatedString = random.ints(leftLimit,rightLimit + 1)
      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
      .limit(targetStringLength)
      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
      .toString();
    		
    String from = "qkzptjd5440@naver.com";//보내는 이 메일주소
    String to = mem_email;
    String title = "[임시 비빌번호]를 확인해주세요";
    String content = "[임시 비밀번호]는 "+ generatedString +" 입니다. <br/> 발급받으신 임시 비밀번호로 로그인 하시고, 프로필 - 내 정보 에서 비밀번호를 변경해주세요.";
   
    try {
    	MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
        
        mailHelper.setFrom(from);
        mailHelper.setTo(to);
        mailHelper.setSubject(title);
        mailHelper.setText(content, true);       
        
        mailSender.send(mail);
     
        
    } catch(Exception e) {
        return "errror";
    }
    return "임시비밀 번호 발송이 완료되었습니다.\n입력한 이메일에서 임시 비밀번호를 확인 해주십시오.";  
  }
  
  //임시비밀번호 제한 쿠키 만들기
  /*
  public void set_findPwCookie(HttpServletResponse response,String ip) {
		String findPw_count = String.valueOf(mem_num)+"/fpc";
	  	Cookie cookie = new Cookie(findPw_count,"1");
		cookie.setMaxAge(1*60*60*24);
		cookie.setSecure(true);
		response.addCookie(cookie);
	}
 }
 //임시비밀번호 제한 쿠키 가져오기
public String get_findPwCookie(HttpServletRequest request,int mem_num) {
	Cookie[] list = request.getCookies();
	for(Cookie cookie:list) {
		if(cookie.getName().equals("useremail")) {
			logger.info(cookie.getValue());
		}
	}
	return "redirect:/ch05/content";*/
  
}

   
