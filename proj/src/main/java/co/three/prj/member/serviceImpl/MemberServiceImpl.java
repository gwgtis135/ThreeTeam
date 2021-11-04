package co.three.prj.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.three.prj.comm.DataSource;
import co.three.prj.member.service.MemberMapper;
import co.three.prj.member.service.MemberService;
import co.three.prj.member.service.MemberVO;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> selectMemberList() {

		return map.selectMemberList();
	}

	@Override
	public MemberVO selectMember(MemberVO vo) {

		return map.selectMember(vo);
	}

	@Override
	public int insertMember(MemberVO vo) {

		return map.insertMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {

		return map.updateMember(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) {

		return map.deleteMember(vo);
	}

	@Override
	public int ackMember(MemberVO vo) {
		
		return map.ackMember(vo);
	}

	@Override
	public int selectMemberCk(String id) {
		// TODO Auto-generated method stub
		return map.selectMemberCk(id);
	}

}
