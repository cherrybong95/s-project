package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;
import model.MakerDAO;

public class FindMemberPass implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  response.setContentType("text/html;charset=utf-8");
	  PrintWriter out = response.getWriter();
	  String id = request.getParameter("id");
      String tel = request.getParameter("tel");
      String mcode = request.getParameter("mcode");
      System.out.println(id+tel+mcode);
      String password = null;
      if(mcode.equals("1")){
         password = MakerDAO.getInstance().findPassById(id, tel);
      } else if(mcode.equals("2")) {
         password = BuyerDAO.getInstance().findPassById(id, tel);
      }
      if(password==null){ 
    	  out.print("빵");
      }else{
    	  out.print(password);
      }
      out.close();
      return "Ajax";
   }
}