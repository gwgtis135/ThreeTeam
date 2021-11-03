package co.hanki.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.hanki.prj.comm.Command;
import co.hanki.prj.member.service.MemberService;
import co.hanki.prj.member.serviceImpl.MemberServiceImpl;

public class AjaxMemberList implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
				MemberService memberDao = new MemberServiceImpl();
				ObjectMapper objectMapper = new ObjectMapper(); //jackson lib
				String members=null;
				try {
					members = objectMapper.writeValueAsString(memberDao.selectMemberList()); //json 객체변환
				}catch(JsonProcessingException e) {
					e.printStackTrace();
				}
				//members = "{ \"data\" :"+members+"}"; // ajax에 이름달아주기
				return "ajax:"+members; //ajax:[{"id":"micol","password":"1234" ...}]
			//	return "chart/ajaxTest";

	}

}
