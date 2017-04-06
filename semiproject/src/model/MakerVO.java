package model;

public class MakerVO {
   private String maker_id;
   private String password;
   private String maker_name;
   private String maker_bname;
   private String maker_add;
   private String maker_tel;
   private String maker_account;
   private String mcode;

   public MakerVO() {
      super();
   }

   public MakerVO(String maker_id, String maker_name, String maker_bname, String maker_add,
         String maker_tel, String maker_account, String mcode) {
      super();
      this.maker_id = maker_id;
      this.maker_name = maker_name;
      this.maker_bname = maker_bname;
      this.maker_add = maker_add;
      this.maker_tel = maker_tel;
      this.maker_account = maker_account;
      this.mcode = mcode;
   }
   

   public MakerVO(String maker_id, String password, String maker_name, String maker_bname, String maker_add,
		String maker_tel, String maker_account, String mcode) {
	super();
	this.maker_id = maker_id;
	this.password = password;
	this.maker_name = maker_name;
	this.maker_bname = maker_bname;
	this.maker_add = maker_add;
	this.maker_tel = maker_tel;
	this.maker_account = maker_account;
	this.mcode = mcode;
}

public String getMaker_id() {
      return maker_id;
   }

   public void setMaker_id(String maker_id) {
      this.maker_id = maker_id;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getMaker_name() {
      return maker_name;
   }

   public void setMaker_name(String maker_name) {
      this.maker_name = maker_name;
   }

   public String getMaker_bname() {
      return maker_bname;
   }

   public void setMaker_bname(String maker_bname) {
      this.maker_bname = maker_bname;
   }

   public String getMaker_add() {
      return maker_add;
   }

   public void setMaker_add(String maker_add) {
      this.maker_add = maker_add;
   }

   public String getMaker_tel() {
      return maker_tel;
   }

   public void setMaker_tel(String maker_tel) {
      this.maker_tel = maker_tel;
   }

   public String getMaker_account() {
      return maker_account;
   }

   public void setMaker_account(String maker_account) {
      this.maker_account = maker_account;
   }

   public String getMcode() {
      return mcode;
   }

   public void setMcode(String mcode) {
      this.mcode = mcode;
   }

   @Override
   public String toString() {
      return "MakerVO [maker_id=" + maker_id + ", password=" + password + ", maker_name=" + maker_name
            + ", maker_bname=" + maker_bname + ", maker_add=" + maker_add + ", maker_tel=" + maker_tel
            + ", maker_account=" + maker_account + ", mcode=" + mcode + "]";
   }

}