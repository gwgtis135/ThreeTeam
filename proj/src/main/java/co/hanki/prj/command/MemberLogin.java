package co.hanki.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.hanki.prj.comm.Command;
import co.hanki.prj.member.service.MemberService;
import co.hanki.prj.member.service.MemberVO;
import co.hanki.prj.member.serviceImpl.MemberServiceImpl;

public class MemberLogin implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String page=null;

		MemberService memberDao = new MemberServiceImpl();

		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		
		vo=memberDao.selectMember(vo);
		if(vo!= null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("author", vo.getAuthor());
		page= "home.do"	;
		}else {
			page="memberLoginForm.do";
		}
		
		return page;
	}

}