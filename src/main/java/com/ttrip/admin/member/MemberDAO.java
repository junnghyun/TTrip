package com.ttrip.admin.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.ttrip.admin.member.memberMapper";
    
    public List<MemberVO> selectAllMembers() {
        return sqlSession.selectList(NAMESPACE + ".selectAllMembers");
    }
    
    public List<MemberVO> searchMembersByNick(String searchTerm) {
        return sqlSession.selectList(NAMESPACE + ".searchMembersByNick", searchTerm);
    }
    
    public MemberVO selectMemberByNick(String nick) {
        return sqlSession.selectOne(NAMESPACE + ".selectMemberByNick", nick);
    }

    public void updateMember(MemberVO member) {
        sqlSession.update(NAMESPACE + ".updateMember", member);
    }
    
    
    
}