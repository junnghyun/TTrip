package com.ttrip.auth.repository;

import com.ttrip.auth.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByEmail(String email);
    Optional<User> findByOauthUserIdAndOauthProvider(String oauthUserId, String oauthProvider);
}
