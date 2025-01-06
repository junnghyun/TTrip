package com.ttrip.auth.service;

import com.ttrip.auth.domain.Admin;
import com.ttrip.auth.dto.AdminUserDetails;
import com.ttrip.auth.repository.AdminRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AdminUserDetailsService implements UserDetailsService {
    private final AdminRepository adminRepository;

    public AdminUserDetailsService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        Admin admin = adminRepository.findByAdminId(id);
        if (admin == null) {
            throw new UsernameNotFoundException("Admin not found with id: " + id);
        }
        return new AdminUserDetails(admin);
    }
}
