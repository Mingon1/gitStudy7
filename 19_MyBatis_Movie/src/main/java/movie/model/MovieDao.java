package movie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utility.Paging;

@Service("myMovieDao")
public class MovieDao {
	private String namespace = "movie.MovieBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MovieDao() {
		System.out.println("MovieDao»ý¼ºÀÚ");
	}
	
	public List<MovieBean> getMovie(Paging pageInfo, Map<String , String> map){
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<MovieBean> lists = new ArrayList<MovieBean>();
		
		lists = sqlSessionTemplate.selectList(namespace+".getMovieList",map,rowBounds);
		
		return lists;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount",map);
		
		return cnt;
	}
	
	public int getAllTotalCount() {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.selectOne(namespace+".getAllTotalCount");
		
		return cnt;
	}
	
	public int insertMovie(MovieBean movie) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".insertMovie",movie);
		
		return cnt;
	}
	public int deleteMovie(int num) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.delete(namespace+".deleteMovie",num);
	
		return cnt;
	}
	
	public int searchTitle(String title) {
		
		int count = -1; 
		
		count = sqlSessionTemplate.selectOne(namespace+".searchTitle",title);
		
		return count;
		
		
	}

	public MovieBean getMovieByNum(int num) {
		MovieBean mb = null;
		
		mb = sqlSessionTemplate.selectOne(namespace+".getMovieByNum",num);
		
		return mb;
	}
	
	public int updateMovie(MovieBean mb) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace+".updateMovie",mb);
		
		return cnt;
	}

}
