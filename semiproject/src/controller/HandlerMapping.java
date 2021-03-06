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
		} else if (command.equals("showInsertItem")) {
			c = new ShowInsertItemListController();
		} else if (command.equals("delete")) {
			c = new DeleteItemController();
		} else if (command.equals("update")) {
			c = new UpdateItemController();
		} else if (command.equals("updateBuyerInfo")) {
			c = new UpdateBuyerInfoController();
		} else if (command.equals("updateMakerInfo")) {
			c = new UpdateMakerInfoController();
		} else if (command.equals("checkPass")) {
			c = new CheckPasswordController();
		} else if (command.equals("deleteMember")) {
			c = new DeleteMemberController();
		} else if (command.equals("productUpdate")){
			c = new ProductUpdateController();
		}else if(command.equals("purchaseList")){
			c=new PurchaseListController();
		}else if(command.equals("TransactionDetailInfo")){
			c=new TransactionDetailInfoController();
		}else if(command.equals("showOrderStateList")){
			c=new ShowOrderStateListController();
		}else if(command.equals("showOrderList")){
			c=new ShowOrderListController();
		}else if(command.equals("orderStateChange")){
			c=new OrderStateChangeController();
		}else if(command.equals("checkDestination")){ 
			c=new checkDestinationController();
		}else if(command.equals("getPurchaseForm")){ 
			c=new getPurchaseFormController();
		}else if(command.equals("purchase")){ 
			c=new PurchaseController();
		}else if(command.equals("purchasedInfo")){ 
			c=new PurchasedInfoController();
		}else if(command.equals("updateAmount")){
			c=new UpdateAmountController();
		}else if (command.equals("findPassword")) {
	         c = new FindMemberPass();
	      }else if(command.equals("findId")){
	    	  c= new FindMemberId();
	      }
		return c;
	}

}
