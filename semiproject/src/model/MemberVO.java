package model;

public class MemberVO {
		private String id;
		private String password;
		private String mname;
		private String address;
		private String tel;
		private String account;
		private int mcode;
		private CartBean cart;
		public MemberVO() {
			super();
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getMname() {
			return mname;
		}
		public void setMname(String mname) {
			this.mname = mname;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getAccount() {
			return account;
		}
		public void setAccount(String account) {
			this.account = account;
		}
		public int getMcode() {
			return mcode;
		}
		public void setMcode(int mcode) {
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
		
	
		
		
}

