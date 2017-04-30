package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;
import model.MakerDAO;

public class FindMemberId implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  response.setContentType("text/html;charset=utf-8");
	  PrintWriter out = response.getWriter();
	  String name = request.getParameter("name");
      String tel = request.getParameter("tel");
      String mcode = request.getParameter("mcode");
      String id = null;
      System.out.println(name+tel+mcode);
      if (mcode.equals("1")) {//회원찾기 폼에서 받아온 mcode의 value로 판매자/구매자선택.
         id = MakerDAO.getInstance().findIdByTel(name, tel);//찾은 password값 넣기
      } else {
         id = BuyerDAO.getInstance().findIdByTel(name, tel);//찾은 password값 넣기
      }
      if(id==null){ //id가 null일시
    	  out.print("빵");//빵 이라는 임의의 값을 보냄.
      }else{
    	  out.print(id);//있을시에는 id를 보낸다.
      }
      out.close();
      return "Ajax";//ajax로 보낸다.
   }
}