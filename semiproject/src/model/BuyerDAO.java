package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class BuyerDAO {
	private static BuyerDAO dao = new BuyerDAO();
	private DataSource dataSource;

	private BuyerDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BuyerDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection(); // 컨넥션을 빌려온다
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		closeAll(null, pstmt, con);
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public BuyerVO BuyerLogin(String id, String password) throws SQLException {
		// 로그인을 하는 메서드. return type을 VO로 주어, 모든 정보를 받아오게했다.
		BuyerVO vo = new BuyerVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select b.buyer_id,b.buyer_name,b.buyer_add,b.buyer_tel,m.mcode "
					+ "from buyer b,member_code m where b.mcode=m.mcode and "
					// member_code 테이블과 조인을 하고,
					+ "b.buyer_id=? and b.password=? ";
			// id와 password가 맞는지 확인한다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new BuyerVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				// 만약 아이디와 비밀번호가 맞는 값이 테이블에 있다면 vo에 값을 넣어주고,
			} else {
				vo = null; // 없다면 null을 반환한다.
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	public void joinBuyer(BuyerVO bvo) throws SQLException {
		// 구매자 회원가입 메서드
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into buyer(buyer_id, password, buyer_name, buyer_add, buyer_tel, mcode) values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bvo.getBuyer_id());
			pstmt.setString(2, bvo.getPassword());
			pstmt.setString(3, bvo.getBuyer_name());
			pstmt.setString(4, bvo.getBuyer_add());
			pstmt.setString(5, bvo.getBuyer_tel());
			pstmt.setString(6, bvo.getMcode());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public boolean checkId(String id) throws SQLException {
		//id가 있는 아이디인지 아닌지를 판단하는 메서드
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select count(*) from buyer where buyer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) { //id정보가 이미 있으면 
				flag = true; // flag를 true로 바꿔서 반환한다
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}

	public void updateBuyerInfo(BuyerVO bvo) throws SQLException {
		// 구매자의 정보를 수정하는 메서드
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update buyer set password=?, buyer_name=?, buyer_add=?, buyer_tel=? where buyer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bvo.getPassword());
			pstmt.setString(2, bvo.getBuyer_name());
			pstmt.setString(3, bvo.getBuyer_add());
			pstmt.setString(4, bvo.getBuyer_tel());
			pstmt.setString(5, bvo.getBuyer_id());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public boolean checkPassword(String id, String password) throws SQLException {
		// 비밀번호를 확인하는 메서드 
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select count(*) from buyer where buyer_id=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) { // 아이디에 따른 비밀번호가 맞으면
				flag = true;// flag를 true로 바꿔서 반환한다
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}

	public boolean checkProduct(String id) throws SQLException {
		boolean flag = true;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select t.tno from TRANSACTION t,buyer b where t.buyer_id=b.buyer_id and b.buyer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = false;
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}

	public void deleteMember(String id) throws SQLException {
		// 회원탈퇴 메서드
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from buyer where buyer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public int countBuyerMember() throws SQLException {
		int i = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select count(*) from Buyer";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return i;
	}

	public String findPassById(String id, String tel) throws SQLException {
		// ID로 비밀번호를 찾는 메서드
		String password = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select password from Buyer where buyer_id=? and buyer_tel=?";
			// 회원에게 전화번호와 아이디를 받아오고 그 값에 맞는 비밀번호를 테이블에서 가져온다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				password = rs.getString(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return password; // 비밀번호 반환.
	}

	public String findIdByTel(String name, String tel) throws SQLException {
		// 전화번호로 ID를 찾는 메서드
		String id = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select buyer_id from Buyer where buyer_name=? and buyer_tel=?";
			// 회원에게 이름과 전화번호를 받아오고, 그값에 맞는 아이디를 테이블에서 가져온다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return id; // 아이디 반환
	}
}