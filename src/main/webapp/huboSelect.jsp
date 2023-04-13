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
		<h2>후보조회</h2>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					try {		
						Class.forName("oracle.jdbc.driver.OracleDriver");	
						 con = DriverManager.getConnection(	
							"jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
						String sql = "select "
									+"M.M_NO, "
									+"M.M_NAME, "
									+"P.P_NAME, "
									+"DECODE(M.P_SCHOOL,'1','고졸','2','학사','3','석사','4','박사') AS SCHOOL, "
									+"SUBSTR(M.M_JUMIN,1,6)||'-'||SUBSTR(M.M_JUMIN,7) AS JUMIN, "
									+"M.M_CITY, "
									+"P.P_TEL1||'-'||P.P_TEL2||'-'||P.P_TEL3 TEL "
									+"FROM TBL_MEMBER_202005 M, TBL_PARTY_202005 P "
									+"WHERE M.P_CODE = P.P_CODE";
						 pstmt = con.prepareStatement(sql);
						 rs= pstmt.executeQuery();
						while(rs.next()){
							%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(4) %></td>
								<td><%=rs.getString(5) %></td>
								<td><%=rs.getString(6) %></td>
								<td><%=rs.getString(7) %></td>
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