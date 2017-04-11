package model;

public class TransactionDTO {
	private int tno;
	// private int pno;
	// private String pname;
	private ProductVO pvo;
	private int amount;
	private String tdate;
	private String pro_state;
	private DeliveryVO delivery;

	public TransactionDTO() {
		super();
	}

	public TransactionDTO(int tno, ProductVO pvo, int amount, String tdate, String pro_state, DeliveryVO delivery) {
		super();
		this.tno = tno;
		this.pvo = pvo;
		this.amount = amount;
		this.tdate = tdate;
		this.pro_state = pro_state;
		this.delivery = delivery;
	}

	public TransactionDTO(ProductVO pvo, int amount) {
		super();
		this.pvo = pvo;
		this.amount = amount;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public ProductVO getPvo() {
		return pvo;
	}

	public void setPvo(ProductVO pvo) {
		this.pvo = pvo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getPro_state() {
		return pro_state;
	}

	public void setPro_state(String pro_state) {
		this.pro_state = pro_state;
	}

	public DeliveryVO getDelivery() {
		return delivery;
	}

	public void setDelivery(DeliveryVO delivery) {
		this.delivery = delivery;
	}

	@Override
	public String toString() {
		return "TransactionDTO [tno=" + tno + ", pvo=" + pvo + ", amount=" + amount + ", tdate=" + tdate
				+ ", pro_state=" + pro_state + ", delivery=" + delivery + "]";
	}

}
