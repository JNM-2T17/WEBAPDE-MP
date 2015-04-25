package com.themmt.model;

import java.util.ArrayList;

public class Work {
	public static final String TITLE_COLUMN = "title";
	public static final String CLASS_COLUMN = "class";
	public static final String YEAR_COLUMN = "releaseYear";
	public static final String COVER_COLUMN = "cover";
	public static final String DESC_COLUMN = "description";
	public static final String RATING_COLUMN = "rating";
	public static final String VIEW_COLUMN = "viewCount";
	public static final String VERIFY_COLUMN = "isVerified";
	
	private String title;
	private String releaseYear;
	private String cover;
	private String classification;
	private String description;
	private double rating;
	private int viewCount;
	private boolean isVerified;
	private ArrayList<String> genres;
	private ArrayList<String> keywords;
	private boolean favorited;
	
	public static class WorkBuilder {
		private String title;
		private String releaseYear;
		private String cover;
		private String classification;
		private String description;
		private double rating;
		private int viewCount = 0;
		private boolean isVerified = false;
		
		public WorkBuilder(String title, String classification) {
			this.title = title;
			this.classification = classification;
		}
		
		public WorkBuilder releaseYear(String releaseYear) {
			this.releaseYear = releaseYear;
			
			return this;
		}
		
		public WorkBuilder cover( String cover ) {
			this.cover = cover;
			
			return this;
		}
		
		public WorkBuilder description( String description ) {
			this.description = description;
			
			return this;
		}
		
		public WorkBuilder rating( double rating ) {
			this.rating = rating;
			
			return this;
		}
		
		public WorkBuilder viewCount( int viewCount ) {
			this.viewCount = viewCount;
			
			return this;
		}
		
		public WorkBuilder isVerified( boolean isVerified ) {
			this.isVerified = isVerified;
			
			return this;
		}
		
		public Work build() {
			return new Work(this);
		}
	}
	
	public Work() {
		super();
	}

	private Work(WorkBuilder wb) {
		title = wb.title;
		releaseYear = wb.releaseYear;
		cover = wb.cover;
		classification = wb.classification;
		description = wb.description;
		rating = wb.rating;
		viewCount = wb.viewCount;
		isVerified = wb.isVerified;
		genres = new ArrayList<String>();
		keywords = new ArrayList<String>();
	}

	public double getRating() {
		return rating;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public boolean isVerified() {
		return isVerified;
	}

	public void setVerified(boolean isVerified) {
		this.isVerified = isVerified;
	}

	public String getTitle() {
		return title;
	}

	public String getReleaseYear() {
		return releaseYear;
	}

	public String getClassification() {
		return classification;
	}

	public int getViewCount() {
		return viewCount;
	}

	public ArrayList<String> getGenres() {
		return genres;
	}

	public ArrayList<String> getKeywords() {
		return keywords;
	}
	
	public void addGenre( String genre ) {
		genres.add( genre );
	}
	
	public void addKeyword( String keyword ) {
		keywords.add( keyword ); 
	}

	public boolean isFavorited() {
		return favorited;
	}

	public void setFavorited(boolean favorited) {
		this.favorited = favorited;
	}
}
