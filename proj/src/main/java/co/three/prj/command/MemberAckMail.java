package co.three.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.three.prj.comm.Command;
import co.three.prj.member.service.MemberService;
import co.three.prj.member.service.MemberVO;
import co.three.prj.member.serviceImpl.MemberServiceImpl;

public class MemberAckMail implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		MemberVO vo = new MemberVO();
		MemberService memberDao = new MemberServiceImpl();
		vo.setId(request.getParameter("id"));
		vo=memberDao.selectMember(vo);
		request.setAttribute("member", vo);
		return "member/memberAckMail";
	}

}
