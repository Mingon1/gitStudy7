package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieDao;

@Controller
public class MovieDeleteController {
	private final String command="/delete.mv";
	private final String gotoPage="redirect:/list.mv";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	public ModelAndView delete(@RequestParam int num, @RequestParam(value = "pageNumber", required = false) String pageNumber,@RequestParam String whatColumn,@RequestParam String keyword) {
		
		ModelAndView mav = new ModelAndView();
		movieDao.deleteMovie(num);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("whatColumn",whatColumn);
		mav.addObject("keyword",keyword);
		mav.setViewName(gotoPage);
		
		return mav;
	}
}
