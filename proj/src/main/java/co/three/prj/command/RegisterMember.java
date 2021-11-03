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
		System.out.println(request.getParameter("author"));
		n=memberDao.insertMember(vo);
		String viewPage = null;
		if(n!=0) {
			viewPage="memberAckMail.do"; //request값이 두번넘어가나?
		}else {
			request.setAttribute("message", "회원가입이 정상적으로 처리되지 못했습니다.");
			viewPage="member/memberError";
		}
		
		return viewPage;
	}

}
