package model;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileManager {
private HttpServletRequest request; 
	private MultipartRequest mRequest; // 파일 업로드를 위한 객체, COS.lib가 필요하다
	private MakerVO mvo;
	private int postMaxSize = 10 * 1024 * 1024;   //10MB 업로드파일의 최대크기지정
	private String encoding = "UTF-8"; 
	private String newFilePath="C:\\java-kosta\\WAS\\jquery-tomcat\\webapps\\semiproject\\uploaded";
	//이미지 파일을 저장할 위치를 지정
	private String newFileFullName;
	private  String newFileName;
	//set/get method
	public MakerVO getMvo() {
			return mvo;
		}

		public void setMvo(MakerVO mvo) {
			this.mvo = mvo;
		}

		
	public String getNewFilePath() {
			return newFilePath;
		}
	
		public void setNewFilePath(String newFilePath) {
			this.newFilePath = newFilePath;
		}
 //파일의 경로와 이름을 나타내는 변수
	public String getNewFileFullName() {
			return newFileFullName;
		}

		public void setNewFileFullName(String newFileFullName) {
			this.newFileFullName = newFileFullName;
		}
		
	public MultipartRequest getmRequest() {
			return mRequest;
		}

		public void setmRequest(MultipartRequest mRequest) {
			this.mRequest = mRequest;
		}
		
		
		// file upload method 
		// 기존 request 를 이용하여 mRequest를 만든다
		// 기존 request로 부턴 form에 있는 다양한 인풋값을 얻어올 수 없다
	public FileManager(HttpServletRequest request) throws IOException {
		this.request=request;
		//setNewFilePath(request.getServletContext().getRealPath("/uploaded"));
		//기존 request와 파일저장경로,사이즈,인코딩,업로드파일이름설정을 통해 request로 부터 파일저장한다
		//FileAlteration() : 파일 업로드시 등록하고 싶은 파일 명을 지정
		mRequest = new MultipartRequest(request, newFilePath, postMaxSize, encoding, new FileAlteration());
		
	}
	
	// file upload method needed inner class
	// 파일의 저장 경로 및 파일이름 새로 생성
	class FileAlteration implements FileRenamePolicy {

 		@Override 
 		public File rename(File file) {

 			String parentDir = file.getParent(); //내부적으로 파일을 전달, 파일로부터 상위폴더 정보를 받아온다.
 			String fileName = file.getName(); //파일명을 받아온다.
 			
 	        String fileExt = ""; //확장자
 	        	
 	        int i = -1;
 	        //fileName.indexOf() : .이 있는 곳의 index를 받아와서 확장자와 파일명을 지정한다.
 	        if(( i = fileName.indexOf(".")) != -1){ 
 	            fileExt = fileName.substring(i);
 	            fileName = fileName.substring(0,i);
 	        }
 	     
 	       newFileName = /*fileName + "_"+ 시간 + 확장자*/("_"+( new Date( ).getTime( ) / 1000)) + fileExt;
 	       
 	       //전체 경로
 	        newFileFullName = parentDir + 

 	        		System.getProperty("file.separator") + newFileName;

 	        
 	        //파일경로에 파일을 생성한다
 	        file = new File(newFileFullName);
 	        //파일의 타입을 표현한다
 	        String mimeType = new MimetypesFileTypeMap().getContentType(file);

 			return file;

 		}

	

 	}
//****************************db에 상품정보 저장
	//db에 이미지 파일이 저장된 경로 및 form에 있는 상품정보를 저장한다
	public String addProduct() throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			String pname=(String)mRequest.getParameter("pname");
			int price= Integer.parseInt(mRequest.getParameter("price"));
			int total_amount=Integer.parseInt(mRequest.getParameter("total_amount"));
			String simple_info=(String)mRequest.getParameter("simple_info");
			String path="uploaded/"+newFileName;
			String userId=((MakerVO)request.getSession().getAttribute("mvo")).getMaker_id();
			System.out.println(pname+price+total_amount+simple_info);
			System.out.println(newFilePath);
			int pno=0;
		try{
				con=DataSourceManager.getInstance().getDataSource().getConnection();
				//새로운 상품번호 생성 및 저장
				StringBuilder sql=new StringBuilder();
				sql.append("select product_seq.nextval from dual");
				pstmt=con.prepareStatement(sql.toString());
				rs=pstmt.executeQuery();
				if(rs.next()){
					pno=rs.getInt(1);
				}
				pstmt.close();
				//데이터 등록
				sql= new StringBuilder();
				sql.append("insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id) ");
				sql.append("values(?,?,?,?,?,?,?)");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, pno);
				pstmt.setString(2,pname);
				pstmt.setInt(3,price);
				pstmt.setInt(4, total_amount);
				pstmt.setString(5, simple_info );
				pstmt.setString(6,path);
				pstmt.setString(7, userId);
				pstmt.executeUpdate();
				
				
			
		}finally{
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
			
		}
		return String.valueOf(pno);
		
	}

	
}




