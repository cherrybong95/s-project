package model;

import java.util.ArrayList;

public class ListVO {
ArrayList<ProductVO> list=new ArrayList<ProductVO>();
PagingBean pagingBean=new PagingBean();
public ListVO(ArrayList<ProductVO> list, PagingBean pagingBean) {
	super();
	this.list = list;
	this.pagingBean = pagingBean;
}
public ListVO() {
	super();
	// TODO Auto-generated constructor stub
}
public ArrayList<ProductVO> getList() {
	return list;
}
public void setList(ArrayList<ProductVO> list) {
	this.list = list;
}
public PagingBean getPagingBean() {
	return pagingBean;
}
public void setPagingBean(PagingBean pagingBean) {
	this.pagingBean = pagingBean;
}

}
