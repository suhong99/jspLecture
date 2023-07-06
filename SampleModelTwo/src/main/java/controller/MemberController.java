package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import db.DBConnection;
import dto.MemberDto;
import net.sf.json.JSONObject;

public class MemberController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProc(req, resp);
	}
	
	public void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBConnection.initConnection();
		request.setCharacterEncoding("utf-8");
		// DB접근
		MemberDao dao = MemberDao.getInstance();
					
		String param = request.getParameter("param");
		
		if(param.equals("login")) {
			response.sendRedirect("login.jsp");
		}
		else if(param.equals("regi")) {
			response.sendRedirect("regi.jsp");
		}
		else if(param.equals("idcheck")) {
			String id= request.getParameter("id");
			
			
			boolean b = dao.getId(id);
			
			String str= "NO";
			if(b == false) {
				str = "YES";
			}
			
			JSONObject obj = new JSONObject();
			obj.put("str", str);
			
			response.setContentType("application/x-json;charset=utf-8");
			response.getWriter().print(obj);
			
		}
		else if(param.equals("regiAf")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			//DB에 저장
			boolean isS= dao.addMember(new MemberDto(id, pwd, name, email, 0));
			String message ="";
			if(isS) {
				message="MEMBER_YES";
			}else {
				message="MEMBER_NO";
			}
			
			request.setAttribute("message", message);
			
//			request.getRequestDispatcher("message").forward(request, response);
			forward("message.jsp",request,response);
		}
	}
	public void forward(String path,HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException| IOException e) {
			e.printStackTrace();
		}
	}

}




