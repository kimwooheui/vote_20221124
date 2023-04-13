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
	<script type="text/javascript">
		function re2() {
			document.getElementById('fcm').readonly=false;
		//	document.getElementById('fm').reset();
		//	document.getElementsByClassName('fdm').reset();
			//document.getElementsByClassName('fcm').reset();
		}
		function reset1() {
			alert("모든 정보를 지우고 처음부터 다시 입력합니다!");
			document.frm.JUMIN.focus();
		}
		function tupyo() {
			if(document.frm.JUMIN.value==""){
				alert("주민번호가 입력되지 않았습니다!");
				document.frm.JUMIN.focus();
				return false;
			}
			else if(document.frm.NAME.value==""){
				alert("성명이 입력되지 않았습니다!");
				document.frm.NAME.focus();
				return false;
			}
			else if(document.frm.NUMBER.value==""){
				alert("후보번호가 입력되지 않았습니다!");
				document.frm.NUMBER.focus();
				return false;
			}
			else if(document.frm.TIME.value==""){
				alert("투표시간이 입력되지 않았습니다!");
				document.frm.TIME.focus();
				return false;
			}
			else if(document.frm.AREA.value==""){
				alert("투표장소가 입력되지 않았습니다!");
				document.frm.AREA.focus();
				return false;
			}
			else if(document.frm.CHECK.value==""){
				alert("유권자 확인이 선택되지 않았습니다!");
				//document.frm.CHECK.focus();
				return false;
			}else{
				return true;				
			}
		}
	</script>
	<section>
		<h2>투표하기</h2>
		<form action="action.jsp" name="frm" method="post"  id="fm" class="fdm" >
			<table>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" name="JUMIN" value="12" readonly id="fcm"/>
					예: 8906154154726
					</td>
				</tr>
				<tr>
					<th>성명</th>
					<td>
						<input type="text" name="NAME"/>
					</td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td>
						<select name="NUMBER">
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td>
						<input type="text" name="TIME"/>
					</td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td>
						<input type="text" name="AREA"/>
					</td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<input type="radio" name="CHECK" value="Y"/>확인 
						<input type="radio" name="CHECK" value="N"/>미확인
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<input type="submit" value="투표하기" onClick="return tupyo();">
						<input type="reset" value="다시하기" onClick="return reset1();">
						<input type="button" value="다시하기2" onClick="return re2();">
					</td>
				</tr>
			</table>
			
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>