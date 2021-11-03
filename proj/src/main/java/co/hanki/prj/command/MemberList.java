package co.hanki.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.hanki.prj.comm.Command;
import co.hanki.prj.member.service.MemberService;
import co.hanki.prj.member.serviceImpl.MemberServiceImpl;

public class MemberList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		MemberService memberDao = new MemberServiceImpl();

		request.setAttribute("members", memberDao.selectMemberList());
		return "member/memberList";
	}

}
