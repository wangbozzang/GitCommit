package file.model;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/*
 * http://servlets.com/cos/
 */
public class FileModel {
	
	public static void upload(HttpServletRequest req) throws IOException {
		// 여기를 바꿔주면 다운받는 경로가 바뀜
		String savePath = "upload";
		// 최대 업로드 파일 크기 5MB로 제한
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		ServletContext context = req.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리 :");
		System.out.println(uploadFilePath);
		
		MultipartRequest multi = new MultipartRequest(
				req, // request 객체
				uploadFilePath, // 서버상의 실제 디렉토리
				uploadFileSizeLimit, // 최대 업로드 파일 크기
				encType, // 인코딩 방법
				// 동일한 이름이 존재하면 새로운 이름이 부여됨
				new DefaultFileRenamePolicy());
		
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String downloadFileName = req.getParameter("downloadFileName");
		res.setContentType("application/octet-stream");
//		String fileName = new String("톰캣.zip".getBytes("UTF-8"), "ISO-8859-1"); 
        res.setHeader("Content-disposition", "attachment; filename=" + downloadFileName);
        try(InputStream in = req.getServletContext().getResourceAsStream("/download/" + downloadFileName);
        	ServletOutputStream out = res.getOutputStream()) {
            byte[] buffer = new byte[1048];
            int numBytesRead;
            while ((numBytesRead = in.read(buffer)) > 0) {
                out.write(buffer, 0, numBytesRead);
            }
        }
	}
	
	

}
