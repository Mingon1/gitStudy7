package movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;
import utility.Paging;

@Controller
public class MovieListController {
	private final String command="/list.mv";
	private final String getPage="movieList";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	public ModelAndView list(@RequestParam(value = "whatColumn", required = false) String whatColumn,
							@RequestParam(value = "keyword", required = false) String keyword,
							@RequestParam(value = "pageNumber", required = false) String pageNumber,
							HttpServletRequest request
								) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = movieDao.getTotalCount(map);
		int AlltotalCount = movieDao.getAllTotalCount();
		
		String url = request.getContextPath()+this.command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);

		
		
		ModelAndView mav = new ModelAndView();
		
		List<MovieBean> movieList = movieDao.getMovie(pageInfo,map);
		
		mav.addObject("pageInfo",pageInfo);
		
		mav.addObject("movieList",movieList);
		
		mav.addObject("totalCount",totalCount);
		
		mav.addObject("AlltotalCount",AlltotalCount);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
