package com.sp.qna;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("qna.qnaController")
public class QnaController {

	@RequestMapping(value="/travel/contactUs")
	public String contactMain() {
		return ".travel.qna.contactUs";
	}
}
