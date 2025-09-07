    package com.predator.programs.Spring.JPA.Project.interceptor;

    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
    import jakarta.servlet.http.HttpSession;
    import org.springframework.stereotype.Component;
    import org.springframework.web.servlet.HandlerInterceptor;

    @Component
    public class AdminAuthInterceptor implements HandlerInterceptor {

        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            HttpSession session = request.getSession(false); // Don't create new session if one doesn't exist

            if (session == null || session.getAttribute("loggedInAdmin") == null) {
                response.sendRedirect("/admin/login"); // Redirect to login page if not authenticated
                return false;
            }
            return true; // Continue with the request
        }
    }
    