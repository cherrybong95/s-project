package model;

public class ProductVO {
private int pno;
private String pname;
private int price;
private int total_amount;
private String simple_info;
private String detail_info;
private String maker_id;
public ProductVO() {
	super();
	// TODO Auto-generated constructor stub
}
public ProductVO(int pno, String pname, int price, int total_amount, String simple_info, String detail_info,
		String maker_id) {
	super();
	this.pno = pno;
	this.pname = pname;
	this.price = price;
	this.total_amount = total_amount;
	this.simple_info = simple_info;
	this.detail_info = detail_info;
	this.maker_id = maker_id;
}

public ProductVO(int pno, String pname, int price) {
	super();
	this.pno = pno;
	this.pname = pname;
	this.price = price;
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
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getTotal_amount() {
	return total_amount;
}
public void setTotal_amount(int total_amount) {
	this.total_amount = total_amount;
}
public String getSimple_info() {
	return simple_info;
}
public void setSimple_info(String simple_info) {
	this.simple_info = simple_info;
}
public String getDetail_info() {
	return detail_info;
}
public void setDetail_info(String detail_info) {
	this.detail_info = detail_info;
}
public String getMaker_id() {
	return maker_id;
}
public void setMaker_id(String maker_id) {
	this.maker_id = maker_id;
}
@Override
public String toString() {
	return "ProductVO [pno=" + pno + ", pname=" + pname + ", price=" + price + ", total_amount=" + total_amount
			+ ", simple_info=" + simple_info + ", detail_info=" + detail_info + ", maker_id=" + maker_id + "]";
}

}

