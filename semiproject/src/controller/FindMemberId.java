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
      if (mcode.equals("1")) {
         id = MakerDAO.getInstance().findIdByTel(name, tel);
      } else {
         id = BuyerDAO.getInstance().findIdByTel(name, tel);
      }
      if(id==null){ 
    	  out.print("빵");
      }else{
    	  out.print(id);
      }
      out.close();
      return "Ajax";
   }
}