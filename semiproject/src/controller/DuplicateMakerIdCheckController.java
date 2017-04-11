package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MakerDAO;

public class DuplicateMakerIdCheckController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String id = request.getParameter("id");
      boolean flag = MakerDAO.getInstance().checkId(id);
      PrintWriter out = response.getWriter();
      System.out.println("연결됐나");
      if(flag==true){
         out.print("fail");
      } else {
         out.print("ok");
      }
      return "Ajax";
   }

}