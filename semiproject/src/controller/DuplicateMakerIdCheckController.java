package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MakerDAO;

// 판매자 아이디를 중복체크하는 컨트롤러
public class DuplicateMakerIdCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		boolean flag = MakerDAO.getInstance().checkId(id);// id를 체크하는 메서드를 이용
		PrintWriter out = response.getWriter();
		if (flag == true) {
			out.print("fail");
		} else {
			out.print("ok");
		}
		return "Ajax";
	}

}