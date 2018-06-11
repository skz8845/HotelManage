package cn.hncj.hotel.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected File img;
	protected String imgFileName;
	protected String imgContentType;
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public String getImgContentType() {
		return imgContentType;
	}
	public void setImgContentType(String imgContentType) {
		this.imgContentType = imgContentType;
	}
	public File getImg() {
		return img;
	}
	public void setImg(File img) {
		this.img = img;
	}
	public void upload(String path, int id) throws IOException {
		InputStream fileInputStream = new FileInputStream(img);
		String filename = ServletActionContext.getServletContext().getRealPath(path) + id + imgFileName.substring(imgFileName.lastIndexOf("." ));
		OutputStream outputStream = new FileOutputStream(filename);
		byte buffer[] = new byte[1024];
		while ((fileInputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, buffer.length);
		}
		outputStream.flush();
		fileInputStream.close();
		outputStream.close();
	}
}
