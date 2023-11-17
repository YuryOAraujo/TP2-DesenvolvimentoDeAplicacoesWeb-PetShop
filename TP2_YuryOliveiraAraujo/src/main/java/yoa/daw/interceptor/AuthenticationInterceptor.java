package yoa.daw.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthenticationInterceptor implements HandlerInterceptor{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		String uri = request.getRequestURI();
		
		if(uri.endsWith("loginForm") || uri.endsWith("register") || uri.endsWith("login") || uri.contains("resources"))
			return true;
		
		if(request.getSession().getAttribute("logged") != null)
			return true;
		
		response.sendRedirect("loginForm");
		return false;
	}

}
