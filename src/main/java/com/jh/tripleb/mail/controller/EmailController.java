package com.jh.tripleb.mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.tripleb.mail.model.service.EmailService;
import com.jh.tripleb.mail.model.vo.EmailVO;

@Controller
public class EmailController {
    @Autowired
    private EmailService emailService;
     
    @RequestMapping("sendmail.mtp")    
    @ResponseBody
    public void sendMail(HttpServletRequest request, HttpServletResponse response, 
    		@RequestParam(value="rcv", required=false, defaultValue="nooribooja@naver.com") String receiver,
    		@RequestParam(value="fname", required=false) String fileName) throws Exception {
        EmailVO email = new EmailVO();     
        String subject = "계약관련 안내 메일입니다.";
        String content = "안녕하세요. 트리플B 계약관리 담당자입니다. 계약서를 첨부하오니 검토 부탁드립니다. 감사합니다.";
        email.setReceiver(receiver);
        email.setSubject(subject);
        email.setContent(content);
        email.setAttName(fileName);
        boolean result = emailService.sendMail(email, request);

        // 계약서 리스트 보기로 연결
		response.sendRedirect(request.getContextPath() + "/list.miv");
        
    }
}
