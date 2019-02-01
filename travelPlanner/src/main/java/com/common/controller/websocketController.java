package com.common.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.common.vo.Greeting;
import com.common.vo.HelloMessage;

@Controller
public class websocketController {

	    @MessageMapping("/hello")
	    @SendTo("/topic/greetings")
	    public Greeting greeting(HelloMessage message) throws Exception {
	        Thread.sleep(500); // simulated delay
	        
	        return new Greeting(HtmlUtils.htmlEscape(message.getName())+ ":" + HtmlUtils.htmlEscape(message.getMsg()));
	    }

	
}
