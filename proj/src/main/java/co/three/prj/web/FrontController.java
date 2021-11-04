package co.three.prj.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.three.prj.comm.Command;
import co.three.prj.command.AjaxMemberList;
import co.three.prj.command.AjaxTest;
import co.three.prj.command.Charts;
import co.three.prj.command.HomeCommand;
import co.three.prj.command.Logout;
import co.three.prj.command.MemberList;
import co.three.prj.command.MemberLogin;
import co.three.prj.command.MemberLoginForm;
import co.three.prj.command.RegisterForm;
import co.three.prj.command.RegisterMember;
import co.three.prj.command.Test;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
	
       

    public FrontController() {
        super();

    }


	public void init(ServletConfig config) throws ServletException {
		//실제 수행할 명령들 넣어두는 곳
		map.put("/home.do", new HomeCommand()); //첫 페이지 호출
		map.put("/test.do", new Test()); // .do 호출 테스트
		map.put("/logout.do", new Logout()); //로그아ㅜㅇㅅ
		map.put("/memberLoginForm.do", new MemberLoginForm()); //로그인 폼 호출
		map.put("/memberLogin.do", new MemberLogin()); //로그인 처리
		map.put("/memberList.do", new MemberList()); //멤버 목록
		map.put("/registerForm.do", new RegisterForm()); //회원 가입 폼 호출
		map.put("/registerMember.do", new RegisterMember()); // 회원 가입
		map.put("/charts.do", new Charts()); //차트 보여주기
		map.put("/ajaxTest.do", new AjaxTest()); //ajax test form
		map.put("/ajaxMemberList.do", new AjaxMemberList()); // 실제 처리
		
	
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri= request.getRequestURI();
		String contextPath= request.getContextPath();
		String page=uri.substring(contextPath.length());
		
		Command command = map.get(page);
		String viewPage = command.run(request, response);
		if(viewPage != null && !viewPage.endsWith(".do")) {
			if(viewPage.startsWith("ajax:")) { //ajax 리턴
				 response.setContentType("text/plain; charset=utf-8"); 
				 response.getWriter().append(viewPage.substring(5));

				return;
			}
			if(viewPage.endsWith(".jsp")) { //타일즈 적용 안할때
				viewPage="WEB-INF/views/"+viewPage;
			}else {
				viewPage= viewPage+".tiles"; //타일즈 적용
			}
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}











