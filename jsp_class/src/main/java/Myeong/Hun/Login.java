package Myeong.Hun;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDao;
import member.MemberDto;

@WebServlet("/loginCheck")
public class Login extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.loginDao(email, pwd);
		
		HttpSession session = request.getSession();
		
		RequestDispatcher ds = null;
		
		if(email.equals(dto.getEmail()) && pwd.equals(dto.getPassword())) {
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("password", dto.getPassword());
			session.setAttribute("name", dto.getName());
			session.setAttribute("phone", dto.getPhone());
			
			ds = request.getRequestDispatcher("index.jsp");
			
		} else {
			// script로 alert를 띄어주는 페이지로 이동
			ds = request.getRequestDispatcher("loginFaild.jsp");
		}
		ds.forward(request, resp);
	}
}
