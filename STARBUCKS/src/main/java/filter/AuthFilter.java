package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import index.model.IndexModel;

public class AuthFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req1, ServletResponse res1, FilterChain chain)
			throws IOException, ServletException {
		String[] menuArr = {"/starbucks/", "/ediya/"};
		HttpServletRequest req = (HttpServletRequest)req1;
		String uri = req.getRequestURI();
		System.out.println("AuthFilter:" + uri);
		boolean redirectFlag = false;
		for ( int i = 0 ; i < menuArr.length ; i++ ) {
			String authUri = menuArr[i];
			if ( uri.startsWith(authUri) ) {
				boolean hasSession = IndexModel.checkSession(req);
				if ( hasSession ) {
					break;
				} else {
					redirectFlag = true;
					break;
				}
			}
		}
		if ( redirectFlag ) {
			((HttpServletResponse)res1).sendRedirect("/index.star");
		} else {
			chain.doFilter(req1, res1);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
