package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class MovieDetailController {

	private final String command = "/detail.mv";
	private final String getPage = "movieDetailView";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView detailForm(@RequestParam int num , @RequestParam String pageNumber,@RequestParam String whatColumn,@RequestParam String keyword) {
		ModelAndView mav = new ModelAndView();
		
		MovieBean mb = movieDao.getMovieByNum(num);
		mav.addObject("movie",mb);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("whatColumn",whatColumn);
		mav.addObject("keyword",keyword);
		mav.setViewName(getPage);
		
		return mav;
	}
}
