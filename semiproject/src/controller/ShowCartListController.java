package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.ProductVO;

public class ShowCartListController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
     String path="index.jsp";
      HttpSession session=request.getSession(false);
      BuyerVO mvo = (BuyerVO) session.getAttribute("mvo");
      if(session !=null && mvo!=null){
         ArrayList<ProductVO> list=mvo.getCart().getProductList();
         System.out.println(list);
         session.setAttribute("mvo", mvo);
         request.setAttribute("list",list);
         path="/cart/showCartList.jsp";
      }
      return path;
   }

}