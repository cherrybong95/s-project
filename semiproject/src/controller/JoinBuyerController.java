package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.BuyerVO;

public class JoinBuyerController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String id = request.getParameter("id");
      System.out.println(id);
      String password = request.getParameter("password");
      String name = request.getParameter("bname");
      String address = request.getParameter("add");
      String tel = request.getParameter("tel");
      BuyerVO bvo = new BuyerVO(id, password, name, address, tel, "2", null );
      BuyerDAO.getInstance().joinBuyer(bvo);
      HttpSession session = request.getSession();
      session.setAttribute("joinVO", bvo);
      return "redirect:page/join_ok.jsp";
   }

}