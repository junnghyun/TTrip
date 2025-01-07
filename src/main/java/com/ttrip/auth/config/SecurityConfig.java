package com.ttrip.auth.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
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
import com.ttrip.auth.service.AdminUserDetailsService;
import com.ttrip.auth.service.CustomOAuth2UserService;
import com.ttrip.auth.service.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final JwtUtil jwtUtil;
    private final CustomUserDetailsService customUserDetailsService;
    private AdminUserDetailsService adminUserDetailsService;
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

    //AuthenticationManager Bean 등록
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf((auth) -> auth.disable())
                .oauth2Login((oauth2) -> oauth2
                        .loginPage("/login")
                        .userInfoEndpoint((userInfoEndpointConfig) -> userInfoEndpointConfig
                                .userService(customOAuth2UserService))
                        .failureHandler(customOAuth2AuthenticationFailureHandler)
                        .successHandler(customOAuth2LoginSuccessHandler))
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/login", "/", "/signup","/ttrip/**", "/signup/**","/auth/**", "/api/**").permitAll()
                        .requestMatchers("/WEB-INF/**").permitAll()
                        .requestMatchers("/common/**").permitAll()
                        .requestMatchers("/user/**").hasAnyAuthority("USER", "ADMIN")
                        .requestMatchers("/admin/login").permitAll()
                        //.requestMatchers("/admin/**").hasAuthority("ADMIN")
                        .anyRequest().permitAll())
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS));

        // JwtFilter에 CustomUserDetailsService를 주입하여 필터를 추가합니다.
        http.addFilterBefore(new JwtFilter(jwtUtil, customUserDetailsService, adminUserDetailsService), UsernamePasswordAuthenticationFilter.class);

        // 인증, 인가 실패 핸들러 설정
        http.exceptionHandling(
                exceptionHandling -> {
                    exceptionHandling.accessDeniedHandler(new CustomAccessDeniedHandler());
                    //exceptionHandling.authenticationEntryPoint(new CustomAuthenticationEntryPoint());
                }
        );

        // CORS 설정
        http.cors(cors -> cors.configurationSource(corsConfigurationSource()));

        return http.build();
    }

    @Bean
    public DaoAuthenticationProvider adminAuthenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(adminUserDetailsService);
        // BCryptPasswordEncoder 대신 NoOpPasswordEncoder 사용
        provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
        return provider;
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOrigin("*");
        config.addAllowedHeader("*"); // 모든 헤더 허용
        config.addAllowedMethod("*"); // 모든 HTTP 메소드 허용
        config.addAllowedHeader("Authorization");
        config.addExposedHeader("token"); // 서버 측에서 보내는 헤더에 대한 허용 설정

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}
