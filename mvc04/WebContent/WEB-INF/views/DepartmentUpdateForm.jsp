<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">

	$(function()
	{
		// 부서 수정 버튼이 클릭되었을 때 수행해야 할 코드 처리
		$("#submitBtn").click(function()
		{
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			if( $("#departmentName").val()=="" )
			{
				$("#err").html("필수 입력 값이 입력되지 않았습니다.");
				$("#err").css("display", "inline");
				return;		//-- submit 액션 처리 중단~!!!
			}
			
			 // 데이터 검사(중복값 존재 여부 확인)
	         if ( $("#count").val() == "0" || $("#count").val() == "" )
	         {
	             // 폼 submit 액션 처리 수행
	             $("#departmentForm").submit();
	         }
	         else
	         {
	        	 $("#err").html("중복된 지역명입니다.");
	             $("#err").css("display", "inline");
	             $("#count").val("0");
	             
	             return;
	         }
		});
	});

</script>

</head>
<body>

<!---------------------------------------------------
  #47. DepartmentUpdateForm.jsp
  - 부서 데이터 수정 폼 페이지.
----------------------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
	
		<h1>[ 부서 변경 ]</h1>
		<hr>
		
		<form action="departmentupdate.action" method="post" id="departmentForm">
			<table>
				<tr>
					<th>부서번호</th>
					<td>
						<input type="text" id="departmentId" name="departmentId" value="${department.departmentId }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>
						<input type="text" id="departmentName" name="departmentName" placeholder="${department.departmentName }">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%;, height: 50%;">부서 수정</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 50%;, height: 50%;"
						onclick="location.href='departmentlist.action'">부서 리스트</button>
						<br><br>
						
						<span id="err"
						style="color: red; font-weight: bold; display: none;"></span>
						<input type="hidden" id="count" value="${count }">
					</td>
				</tr>
			</table>
		
		</form>
	</div>
</div>

</body>
</html>