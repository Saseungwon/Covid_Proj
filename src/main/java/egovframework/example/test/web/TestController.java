package egovframework.example.test.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
	public class TestController {

		@RequestMapping(value = "/testList.do")
		public String testListDo() {

			return "test/testList";
		}

}
