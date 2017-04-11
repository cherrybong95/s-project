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
	private MultipartRequest mRequest;
	private MakerVO mvo;
	private int postMaxSize = 10 * 1024 * 1024;   //10MB
	private String encoding = "UTF-8";
	private String newFilePath="C:\\java-kosta\\WAS\\jquery-tomcat\\webapps\\semiproject\\uploaded";
	//private String newFilePath ;
	//private String newFilePath="C:\\Users\\KOSTA\\git\\s-project\\semiproject\\WebContent\\uploaded";
	private String newFileFullName;
	private  String newFileName;
	private String userId;
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
	public FileManager(HttpServletRequest request) throws IOException {
		this.request=request;
		//setNewFilePath(request.getServletContext().getRealPath("/uploaded"));
		mRequest = new MultipartRequest(request, newFilePath, postMaxSize, encoding, new FileAlteration());
		
	}
	
	// file upload method needed inner class
	// 파일의 저장 경로 및 파일이름 새로 생성
	class FileAlteration implements FileRenamePolicy {

 		@Override 

 		public File rename(File file) {

 			String parentDir = file.getParent();

 			String fileName = file.getName();
 			
 			//String newFileFullName=null;
 			

 			//Get the extension if the file has one

 	        String fileExt = "";
 	        	
 	        int i = -1;

 	        if(( i = fileName.indexOf(".")) != -1){

 	            fileExt = fileName.substring(i);

 	            fileName = fileName.substring(0,i);

 	        }
 	       System.out.println("실행");
 	        //Add the timestamp and user ID
 	     //  mvo = (MakerVO) request.getSession().getAttribute("mvo");
 	    //   userId=mvo.getMaker_id();
 	     
 	       // String newFileName=null;
 	      // newFileName = /*fileName + "_"+ */userId +("_"+( new Date( ).getTime( ) / 1000)) + fileExt;
 	       newFileName = /*fileName + "_"+ */("_"+( new Date( ).getTime( ) / 1000)) + fileExt;
 	       

 	        //piece together the filename

 	        newFileFullName = parentDir + 

 	        		System.getProperty("file.separator") + newFileName;

 	        

 	        file = new File(newFileFullName);

 	        String mimeType = new MimetypesFileTypeMap().getContentType(file);

 	        System.out.println("마임타입="+mimeType);

 			return file;

 		}

	

 	}
//****************************db에 상품정보 저장
	
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




