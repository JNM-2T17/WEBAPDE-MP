package com.themmt.model;

public class Creator {
	public static final String NAME_COLUMN = "name";
	public static final String BIO_COLUMN = "bio";
	public static final String TRIVIA_COLUMN = "trivia";
	public static final String VERIFIED_COLUMN = "verified";

	private String name;
	private String bio;
	private String trivia;
	private boolean verified;
	
	public Creator(String name, String bio, String trivia, boolean verified) {
		this.name = name;
		this.bio = bio;
		this.trivia = trivia;
		this.verified = verified;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getTrivia() {
		return trivia;
	}

	public void setTrivia(String trivia) {
		this.trivia = trivia;
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}
}
