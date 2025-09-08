package com.example.inquiry;

public class Inquiry {
	private String name;
	private String email;
	private String content;
	private String attachmentFileName;
	private String status;
	private String category;
	private String otherCategory;

	public Inquiry() {
		this.status = "新規";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
	    return category;
	}
	public void setCategory(String category) {
	    this.category = category;
	}

	public String getOtherCategory() {
	    return otherCategory;
	}
	public void setOtherCategory(String otherCategory) {
	    this.otherCategory = otherCategory;
	}
	public String getAttachmentFileName() {
		return attachmentFileName;
	}
	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}
	public String getStatus() {
		return status;
	}
		public void setStatus(String status) {
		this.status = status;
	}
}