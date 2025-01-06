package com.ttrip.auth.config;

import com.ttrip.auth.service.AdminUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.ttrip.auth.exception.CustomAccessDeniedHandler;
import com.ttrip.auth.jwt.JwtFilter;
import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.auth.oauth2.CustomOAuth2AuthenticationFailureHandler;
import com.ttrip.auth.oauth2.CustomOAuth2LoginSuccessHandler;
import com.ttrip.auth.service.CustomOAuth2UserService;
import com.ttrip.auth.service.CustomUserDetailsService;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final JwtUtil jwtUtil;
    private final CustomUserDetailsService customUserDetailsService;
    private final AdminUserDetailsService adminUserDetailsService;
    private final CustomOAuth2UserService customOAuth2UserService;
    private final CustomOAuth2LoginSuccessHandler customOAuth2LoginSuccessHandler;
    private final CustomOAuth2AuthenticationFailureHandler customOAuth2AuthenticationFailureHandler;

    public SecurityConfig(JwtUtil jwtUtil,
                          CustomUserDetailsService customUserDetailsService,
                          AdminUserDetailsService adminUserDetailsService,
                          CustomOAuth2UserService customOAuth2UserService,
                          CustomOAuth2AuthenticationFailureHandler customOAuth2AuthenticationFailureHandler,
                          CustomOAuth2LoginSuccessHandler customOAuth2LoginSuccessHandler) {
        this.jwtUtil = jwtUtil;
        this.customUserDetailsService = customUserDetailsService;
        this.adminUserDetailsService = adminUserDetailsService;
        this.customOAuth2UserService = customOAuth2UserService;
        this.customOAuth2AuthenticationFailureHandler = customOAuth2AuthenticationFailureHandler;
        this.customOAuth2LoginSuccessHandler = customOAuth2LoginSuccessHandler;
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider userAuthenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(customUserDetailsService);
        provider.setPasswordEncoder(bCryptPasswordEncoder());
        return provider;
    }

    @Bean
    public DaoAuthenticationProvider adminAuthenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(adminUserDetailsService);
        provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager() {
        return new ProviderManager(Arrays.asList(userAuthenticationProvider(), adminAuthenticationProvider()));
    }

    @Bean
    @Order(1)
    public SecurityFilterChain adminFilterChain(HttpSecurity http) throws Exception {
        http
                .securityMatcher("/api/admin/**")
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/admin/login").permitAll()
                        .anyRequest().hasAuthority("ADMIN"))
                .authenticationProvider(adminAuthenticationProvider());

        return http.build();
    }

    @Bean
    @Order(2)
    public SecurityFilterChain userFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf((auth) -> auth.disable())
                .oauth2Login((oauth2) -> oauth2
                        .loginPage("/login") // 일반 사용자는 /login 경로로 로그인
                        .userInfoEndpoint((userInfoEndpointConfig) -> userInfoEndpointConfig
                                .userService(customOAuth2UserService))
                        .failureHandler(customOAuth2AuthenticationFailureHandler)
                        .successHandler(customOAuth2LoginSuccessHandler))
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/login", "/", "/signup", "/ttrip/**", "/signup/**", "/auth/**", "/api/**").permitAll()
                        .requestMatchers("/WEB-INF/**").permitAll()
                        .requestMatchers("/common/**").permitAll()
                        .requestMatchers("/user/**").hasAnyAuthority("USER", "ADMIN")
                        .anyRequest().permitAll())
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS))
                .authenticationProvider(userAuthenticationProvider()); // 일반 사용자 인증 제공자 사용

        // JwtFilter 설정
        http.addFilterBefore(new JwtFilter(jwtUtil, customUserDetailsService, adminUserDetailsService),
                UsernamePasswordAuthenticationFilter.class);

        // 인증, 인가 실패 핸들러 설정
        http.exceptionHandling(
                exceptionHandling -> {
                    exceptionHandling.accessDeniedHandler(new CustomAccessDeniedHandler());
                }
        );

        // CORS 설정
        http.cors(cors -> cors.configurationSource(corsConfigurationSource()));

        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOrigin("*");
        config.addAllowedHeader("*");
        config.addAllowedMethod("*");
        config.addAllowedHeader("Authorization");
        config.addExposedHeader("token");

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}
