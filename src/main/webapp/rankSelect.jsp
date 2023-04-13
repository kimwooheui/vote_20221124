<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="haeder.jsp" %>
	<section>
		<h2>후보자등수</h2>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					try {		
						Class.forName("oracle.jdbc.driver.OracleDriver");	
						 con = DriverManager.getConnection(	
							"jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
						String sql = "SELECT M.M_NO, M.M_NAME, COUNT(V.M_NO) AS COUNTNO "
								+"FROM TBL_MEMBER_202005 M, TBL_VOTE_202005 V "
								+"WHERE M.M_NO= V.M_NO "
								+"AND V.V_CONFIRM='Y' "
								+"group by M.M_NO, M.M_NAME "
								+"ORDER BY COUNTNO DESC";
						 pstmt = con.prepareStatement(sql);
						 rs= pstmt.executeQuery();
						while(rs.next()){
							%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
							</tr>
							<%
						}
					}catch(Exception e) {		
						e.printStackTrace();	
					}finally {		
						try {	
							con.close();
							pstmt.close();
							rs.close();
						}catch(Exception e) {}	
					}		
						
						
			%>
		</table>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>