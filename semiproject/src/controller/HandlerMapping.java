package controller;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	protected static HandlerMapping getInstance() {
		return instance;
	}

	public Controller create(String command) {

		Controller c = null;
		if (command.equals("list")) {
			c = new ListController();
			System.out.println(command);
		} else if (command.equals("showProductDetail")) {
			c = new ShowProductDetailController();
			System.out.println(command);
		} else if (command.equals("showCartList")) {
			c = new ShowCartListController();
		} else if (command.equals("addCart")) {
			c = new AddCartController();
		} else if (command.equals("deleteCart")) {
			c = new DeleteCartController();
		} else if (command.equals("checkCart")) {
			c = new CheckCartController();
		} else if (command.equals("buyerLogin")) {
			c = new BuyerLoginController();
		} else if (command.equals("logout")) {
			c = new LogoutController();
		} else if (command.equals("makerLogin")) {
			c = new MakerLoginController();
		} else if (command.equals("joinBuyer")) {
			c = new JoinBuyerController();
		} else if (command.equals("joinMaker")) {
			c = new JoinMakerController();
		} else if (command.equals("checkIdBuyer")) {
			c = new DuplicateBuyerIdCheckController();
		} else if (command.equals("checkIdMaker")) {
			c = new DuplicateMakerIdCheckController();
		} else if (command.equals("addProduct")) {
			c = new FileUploadController();
		}
		return c;
	}

}
