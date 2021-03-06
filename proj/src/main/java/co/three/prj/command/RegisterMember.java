package co.three.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.three.prj.comm.Command;
import co.three.prj.member.service.MemberService;
import co.three.prj.member.service.MemberVO;
import co.three.prj.member.serviceImpl.MemberServiceImpl;

public class RegisterMember implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//멤버 가입처리
		int n =0;
		MemberVO vo = new MemberVO();
		MemberService memberDao = new MemberServiceImpl();
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setAddress(request.getParameter("address")+" "+request.getParameter("detailAddress"));
		vo.setAuthor(request.getParameter("author"));		
		vo.setTel(request.getParameter("tel"));
		n=memberDao.insertMember(vo);
		request.setAttribute("member", vo);
		String viewPage = null;
		if(n!=0) {
			viewPage="member/memberAccept"; 
		}else {
			request.setAttribute("message", "회원가입이 정상적으로 처리되지 못했습니다.");
			viewPage="member/memberError";
		}
		
		return viewPage;
	}

}
