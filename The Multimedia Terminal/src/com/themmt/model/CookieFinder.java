package com.themmt.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * This class provides a static method for finding cookies.
 * @author Austin Fernandez
 *
 */
public class CookieFinder {
	/**
	 * Finds a cookie given a request and a cookie name
	 * @param request request to search cookie from
	 * @param name name of cookie
	 * @return the cookie if found or null if not found
	 */
	public static Cookie findCookie( HttpServletRequest request, String name ) {
		Cookie[] cookies = request.getCookies();
		
		if( cookies != null ) {
			for( Cookie c: cookies ) {
				if( c.getName().equals(name) ) {
					return c;
				}
			}
		}
		
		return null;
	}
}

