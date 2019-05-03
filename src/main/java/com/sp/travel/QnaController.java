package com.sp.travel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("travel.qnaController")
public class QnaController {

	@RequestMapping(value="/travel/contact")
	public String contactMain() {
		return ".travel.qna.contact";
	}
	@GetMapping("/travel/contact/created")
	public String createForm() {
		return ".travel.qna.created";
	}
}
