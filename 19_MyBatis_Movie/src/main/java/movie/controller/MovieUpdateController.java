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
public class MovieUpdateController {
	
	private final String command = "/update.mv";
	private final String getPage = "movieUpdateForm";
	private final String gotoPage = "redirect:/list.mv";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int num , @RequestParam String pageNumber,@RequestParam String whatColumn,@RequestParam String keyword) {
		ModelAndView mav = new ModelAndView();
		
		MovieBean mb = movieDao.getMovieByNum(num);
		mav.addObject("movie",mb);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("whatColumn",whatColumn);
		mav.addObject("keyword",keyword);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("movie") @Valid MovieBean movie, BindingResult result,
								@RequestParam String whatColumn,
								@RequestParam String keyword,
								@RequestParam String pageNumber) {
		
		//System.out.println("컨트롤러");
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("whatColumn",whatColumn);
			mav.addObject("keyword",keyword);
			mav.setViewName(getPage);
			return mav;
		}
		
		int cnt = -1;
		cnt = movieDao.updateMovie(movie);
		System.out.println(cnt);
		
		if(cnt != -1) {
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("whatColumn",whatColumn);
			mav.addObject("keyword",keyword);
			mav.setViewName(gotoPage);
		}else {
			mav.addObject("num",movie.getNum());
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("whatColumn",whatColumn);
			mav.addObject("keyword",keyword);
			mav.setViewName("redirect:"+command);
		}
		
		return mav;
	}

}
