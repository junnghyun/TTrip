package com.ttrip.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    
    @Autowired
    private MemberDAO memberDAO;
    
    public List<MemberVO> getAllMembers() {
        return memberDAO.selectAllMembers();
    }
    
    public List<MemberVO> searchMembers(String searchTerm) {
        return memberDAO.searchMembersByNick(searchTerm);
    }
    
    public MemberVO getMemberByNick(String nick) {
        try {
            return memberDAO.selectMemberByNick(nick);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void updateMember(MemberVO member) {
        memberDAO.updateMember(member);
    }
    
    public void deleteMember(String nick) {
        memberDAO.deleteMember(nick);
    }
}