package com.ttrip.auth.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Entity
@Getter
@Setter
@ToString
@Table(name = "admin")
public class Admin {

    @Id
    @Column(name = "admin_id", nullable = false, unique = true)
    private String adminId;

    @Column(name = "pass")
    private String password;

    @Column(name = "authority")
    private String role;
}
