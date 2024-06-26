package movie.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class MovieInsertController {
	private final String command="/insert.mv";
	private final String getPage="movieInsertForm";
	private final String gotoPage="redirect:/list.mv";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(value=command , method = RequestMethod.GET)
	public ModelAndView insert(@RequestParam String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
	@RequestMapping(value=command, method= RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("movie") @Valid MovieBean movie, BindingResult result) {
				
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		//kim ÆÀ¿øÀÌ ¼öÁ¤
		int cnt = movieDao.insertMovie(movie);
		
		
		mav.setViewName(gotoPage);
		return mav;
	}
}
