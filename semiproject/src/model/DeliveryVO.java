package model;

public class DeliveryVO {
	private int tno;
	private String receiver;
	private String destination;
	private String contact;

	public DeliveryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeliveryVO(int tno, String receiver, String destination, String contact) {
		super();
		this.tno = tno;
		this.receiver = receiver;
		this.destination = destination;
		this.contact = contact;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	@Override
	public String toString() {
		return "DeliveryVO [tno=" + tno + ", receiver=" + receiver + ", destination=" + destination + ", contact="
				+ contact + "]";
	}
	
	
}
