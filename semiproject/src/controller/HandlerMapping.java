package controller;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	protected static HandlerMapping getInstance() {
		return instance;
	}

	public Controller create(String command) {
		
		Controller c = null;
		if(command.equals("list")){
			c= new ListController();
			System.out.println(command);
		}else if(command.equals("showProductDetail")){
			c= new ShowProductDetailController();
			System.out.println(command);
		}else if(command.equals("showCartList")){
			c= new ShowCartListController();
		}else if(command.equals("addCart")){
			c=new AddCartController();
		}else if(command.equals("deleteCart")){
			c=new DeleteCartController();
		}else if(command.equals("checkCart")){
			c=new CheckCartController();
		}
		return c;
	}

}
