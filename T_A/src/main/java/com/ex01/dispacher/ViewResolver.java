package com.ex01.dispacher;

import lombok.Setter;
@Setter
public class ViewResolver {

	
	public String prefix;
	public String suffix;
	
	public String getView (String viewName) {
		
		// index => prefix + 뷰파일이름 + suffix
		
		return prefix+viewName+suffix;
	}
	
	
	
}
