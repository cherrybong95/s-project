package model;

public class BuyerVO {
   private String buyer_id;
   private String password;
   private String buyer_name;
   private String buyer_add;
   private String buyer_tel;
   private String mcode;
   private CartBean cart;

   public BuyerVO() {
      super();
   }
   
   public BuyerVO(String buyer_id, String buyer_name, String buyer_add, String buyer_tel, String mcode) {
	super();
	this.buyer_id = buyer_id;
	this.buyer_name = buyer_name;
	this.buyer_add = buyer_add;
	this.buyer_tel = buyer_tel;
	this.mcode = mcode;
}
public BuyerVO(String buyer_id, String password, String buyer_name, String buyer_add, String buyer_tel,
         String mcode, CartBean cart) {
      super();
      this.buyer_id = buyer_id;
      this.password = password;
      this.buyer_name = buyer_name;
      this.buyer_add = buyer_add;
      this.buyer_tel = buyer_tel;
      this.mcode = mcode;
      this.cart = cart;
   }

   public String getBuyer_id() {
      return buyer_id;
   }

   public void setBuyer_id(String buyer_id) {
      this.buyer_id = buyer_id;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getBuyer_name() {
      return buyer_name;
   }

   public void setBuyer_name(String buyer_name) {
      this.buyer_name = buyer_name;
   }

   public String getBuyer_add() {
      return buyer_add;
   }

   public void setBuyer_add(String buyer_add) {
      this.buyer_add = buyer_add;
   }

   public String getBuyer_tel() {
      return buyer_tel;
   }

   public void setBuyer_tel(String buyer_tel) {
      this.buyer_tel = buyer_tel;
   }

   public String getMcode() {
      return mcode;
   }

   public void setMcode(String mcode) {
      this.mcode = mcode;
   }

   public CartBean getCart() {
	   if(cart==null)
		   cart=new CartBean();
      return cart;
   }

   public void setCart(CartBean cart) {
      this.cart = cart;
   }

   @Override
   public String toString() {
      return "BuyerVO [buyer_id=" + buyer_id + ", password=" + password + ", buyer_name=" + buyer_name
            + ", buyer_add=" + buyer_add + ", buyer_tel=" + buyer_tel + ", mcode=" + mcode + ", cart=" + cart + "]";
   }

}