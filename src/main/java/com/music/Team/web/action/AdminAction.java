package com.music.Team.web.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.Team.bean.ControlResult;
import com.music.Team.bean.Music;
import com.music.Team.biz.MusicBiz;

@Controller
public class AdminAction {
	@Resource
	private MusicBiz mbiz;
	@RequestMapping(path="control")
	public String control(){
		
		return "control";
		
	}
	
	@RequestMapping(path="listData")
	@ResponseBody
	public ControlResult<Music> listData(Integer page ,Integer limit){
		ControlResult<Music> result =new ControlResult<Music>();
		List<Music> music= mbiz.select();
		result.setData(music);
		
		 
		
		return result;
		
	}
	//json请求
	@RequestMapping(path="listMusic")
	@ResponseBody
	public ControlResult<Map<String, Object>> listMusic(Integer page ,Integer limit){
		ControlResult<Map<String, Object>> result =new ControlResult<Map<String, Object>>();
		List<Map<String, Object>>music= mbiz.findMusic();
		result.setData(music);
		result.setCount(mbiz.musicCount());
		 
		
		return result;
		
	}
	
	@RequestMapping(path="MusicShow")
	public String MusicShow(HttpServletRequest requset){
		
		requset.setAttribute("MusicShow", "MusicShow");
		
		 
		
		return "control";
		
	}
	
	
	@RequestMapping(path="upload")
	public String upload(HttpServletRequest requset){
		
		requset.setAttribute("upload", "upload");
		
		 
		
		return "control";
		
	}
	
	
	
		//adminDel删除歌曲
		@RequestMapping("/adminDel")
		public void adminDel(String music_name,HttpServletResponse response) throws IOException{
			
			System.out.println("pwd="+music_name);
			Music t = new Music();
			t.setMusic_name(music_name);
			
			try{
			mbiz.delete(t);
			response.getWriter().print("suc");
			}catch(Exception e){
				response.getWriter().print("删除失败请稍后再试");

			}
			
			
	

}
}