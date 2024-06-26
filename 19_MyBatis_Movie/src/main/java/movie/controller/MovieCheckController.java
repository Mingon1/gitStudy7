package movie.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import movie.model.MovieDao;

@Controller
public class MovieCheckController {
	
	private final String command = "/title_check_proc.mv";
	
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	@ResponseBody // 단지 문자열만 리턴한다
	public String check(@RequestParam(value="title") String title) {
		
		int count = movieDao.searchTitle(title);
		//System.out.println("count:"+count);
		
			if(count ==0) {
				return "YES";
			}else {
				return "NO";
			}
			
	}
	

}
