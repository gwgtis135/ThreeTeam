package co.three.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.three.prj.comm.Command;

public class AjaxTest implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
		return "chart/ajaxTest2"; 
	}

}
