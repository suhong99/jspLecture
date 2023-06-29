package user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dto.UserDto;
import net.sf.json.JSONObject;

public class UserServlet extends HttpServlet{

	@Override				//    request				response
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 받은 데이터
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		System.out.println("id:" + id + " pw:" + pw);
		
		// 보낼 데이터
		JSONObject jsonObj = new JSONObject();
		
		// String 전송
		// jsonObj.put("str", "안녕하세요");
		
		
		// list 전송
		
		List<UserDto> list = new ArrayList<UserDto>();
		list.add(new UserDto("aaa", "홍길동", "부산시"));
		list.add(new UserDto("bbb", "성춘향", "서울시"));
		list.add(new UserDto("ccc", "일지매", "광주시"));		
	//	jsonObj.put("list", list);
				
		
		// map 전송
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", "제목입니다");
		map.put("list", list);
		
		jsonObj.put("map", map);
		
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(jsonObj);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	

}



