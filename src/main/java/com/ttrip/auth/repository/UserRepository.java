package com.ttrip.auth.repository;

import com.ttrip.auth.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    // Email 존재 여부 확인
    @Query(value = "SELECT CASE WHEN EXISTS (SELECT 1 FROM member WHERE email = :email) THEN 1 ELSE 0 END", nativeQuery = true)
    Integer checkEmailExists(@Param("email") String email);

    // Nickname 존재 여부 확인
    @Query(value = "SELECT CASE WHEN EXISTS (SELECT 1 FROM member WHERE nick = :nick) THEN 1 ELSE 0 END", nativeQuery = true)
    Integer checkNickExists(@Param("nick") String nick);


    // Helper methods to convert Integer to Boolean
    default Boolean existsByEmail(String email) {
        return checkEmailExists(email) == 1;
    }

    default Boolean existsByNick(String nick) {
        return checkNickExists(nick) == 1;
    }

    User findByEmail(String email);

    User findByNick(String nick);

    Optional<User> findByEmailAndBirthAndPhone(String email, String birth, String phone);

}