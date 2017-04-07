package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;

public class DuplicateBuyerIdCheckController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String id = request.getParameter("id");
      boolean flag = BuyerDAO.getInstance().checkId(id);
      PrintWriter out = response.getWriter();
      if(flag==true){
         out.print("fail");
      } else {
         out.print("ok");
      }
      return "AjaxView";
   }
}