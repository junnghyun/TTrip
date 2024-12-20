package com.ttrip.auth.repository;

import com.ttrip.auth.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    // Oracle compatible email check query
    @Query(value = "SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END FROM member WHERE email = :email", nativeQuery = true)
    Integer checkEmailExists(@Param("email") String email);

    // Oracle compatible nickname check query
    @Query(value = "SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END FROM member WHERE nick = :nick", nativeQuery = true)
    Integer checkNickExists(@Param("nick") String nick);

    // Helper methods to convert Integer to Boolean
    default Boolean existsByEmail(String email) {
        return checkEmailExists(email) == 1;
    }

    default Boolean existsByNick(String nick) {
        return checkNickExists(nick) == 1;
    }
}