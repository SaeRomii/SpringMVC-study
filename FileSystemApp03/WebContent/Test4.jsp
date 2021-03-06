<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// Test4.jsp

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* String root = request.getRealPath("/"); */			// 예전 방식
	String root = pageContext.getServletContext().getRealPath("/");
	
	// 실제 물리적 주소
	System.out.println(root);		// web 에서 실행하고 console 창에서 확인
	//--==>> C:\SpringMVC_run\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
	//		 워크스페이스\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
	
	// 저장되는 위치와 폴더
	String path = root + "pds" + File.separator + "saveData";
	
	// 확인
	//System.out.println(path);
	//--==>> C:\SpringMVC_run\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\pds\saveData
			
	// 저장 대상(디렉터리 경로)이 존재하지 않으면 생성
	File dir = new File(path);
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;	// 전송 최대 사이즈 5M
	
	try
	{
		MultipartRequest req = null;
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		//out.println("이름 : " + request.getParameter("name") + "<br>");   --==>> 바이너리 형식으로 바인딩해서 꺼내면 null값 나와서 못씀
		out.println("이름 : " + req.getParameter("name") + "<br>");
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("upload") + "<br>");
		out.println("업로드한 파일명 : " + req.getOriginalFileName("upload") + "<br>");
		out.println("파일 타입 : " + req.getContentType("upload") + "<br>");
		
		File file = req.getFile("upload");
		if(file != null)
			out.println("파일 길이 : " + file.length() + "<br>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
