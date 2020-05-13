package com.jh.tripleb.mail.model.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.Part;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.jh.tripleb.mail.model.vo.EmailVO;

@Service("emailService")
public class EmailService {
    @Autowired
    protected JavaMailSender  mailSender;
    
    public boolean sendMail(EmailVO email, HttpServletRequest request) throws Exception {
        try{
      	        
	        String attachFile = email.getAttName();	  
	        String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\upload_files\\invoice\\";
	        
	      	File getFile = new File(savePath + attachFile);
	        mailSender.send(new MimeMessagePreparator() {
     		   public void prepare(MimeMessage mimeMessage) throws MessagingException {
     		     MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
     		     message.setFrom("jmkrose0704@gmail.com");
     		     message.setTo(email.getReceiver());
     		     message.setSubject(email.getSubject());
     		     message.setText(email.getContent());
     		     message.addAttachment(attachFile, getFile);
     		   }
     		 });      
	    
	        return true;

        }catch(Exception ex) {
        	ex.printStackTrace();
        }
        
        return false;

    }
}
