package model;

public class OrderVO {
	private int ono; //rnum
	private int pno;
	private String pname;
	private String total_price;
	private int tno;
	private String tdate;
	private String buyer_id;
	private String buyer_tel;
	private String pro_state;
	public OrderVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderVO(int ono, int pno, String pname, String total_price,int tno,String tdate, String buyer_id, String buyer_tel, String pro_state) {
		super();
		this.ono = ono;
		this.pno = pno;
		this.pname = pname;
		this.total_price = total_price;
		this.tno=tno;
		this.tdate = tdate;
		this.buyer_id = buyer_id;
		this.buyer_tel = buyer_tel;
		this.pro_state = pro_state;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	public String getPro_state() {
		return pro_state;
	}
	public void setPro_state(String pro_state) {
		this.pro_state = pro_state;
	}
	
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", pno=" + pno + ", pname=" + pname + ", total_price=" + total_price + ", tno="
				+ tno + ", tdate=" + tdate + ", buyer_id=" + buyer_id + ", buyer_tel=" + buyer_tel + ", pro_state="
				+ pro_state + "]";
	}

}
