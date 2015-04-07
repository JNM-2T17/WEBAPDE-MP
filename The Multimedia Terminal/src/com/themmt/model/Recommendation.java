package com.themmt.model;

public class Recommendation {
	public static final String TITLE_COLUMN = "title";
	public static final String CREATEDBY_COLUMN = "createdBy";
	public static final String RECOMMENDATIONTO_COLUMN = "recommendationTo";
	public static final String RECOMMENDATIONTOCLASSIFICATION_COLUMN = "recommendationToClassification";
	public static final String RECOMMENDATIONFROM_COLUMN = "recommendationFrom";
	public static final String RECOMMENDATIONFROMCLASSIFICATION_COLUMN = "recommendationFromClassification";
	public static final String ISREC_COLUMN = "isRec";
	public static final String DESCRIPTION_COLUMN = "description";
	public static final String CLASSIFICATION_COLUMN = "classification";
	public static final String COVER_COLUMN = "cover";
	public static final String RATING_COLUMN = "rating";
	public static final String RELEASEYEAR_COLUMN = "releaseYear";

	

	private String title;
	private String createdBy;
	private String recommendationTo;
	private String recommendationToClassification;
	private String recommendationFrom;
	private String recommendationFromClassification;
	private int isRec;
	private String description;
	private String classification;
	private String cover;
	private float rating;
	private int releaseYear;
	
	public String getRecommendationFromClassification() {
		return recommendationFromClassification;
	}
	public void setRecommendationFromClassification(
			String recommendationFromClassification) {
		this.recommendationFromClassification = recommendationFromClassification;
	}

	public Recommendation(String title, String createdBy,
			String recommendationTo, String recommendationToClassification,
			String recommendationFrom, String recommendationFromClassification,
			int isRec, String description, String classification, String cover,
			float rating, int releaseYear) {
		super();
		this.title = title;
		this.createdBy = createdBy;
		this.recommendationTo = recommendationTo;
		this.recommendationToClassification = recommendationToClassification;
		this.recommendationFrom = recommendationFrom;
		this.recommendationFromClassification = recommendationFromClassification;
		this.isRec = isRec;
		this.description = description;
		this.classification = classification;
		this.cover = cover;
		this.rating = rating;
		this.releaseYear = releaseYear;
	}
	public Recommendation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getRecommendationTo() {
		return recommendationTo;
	}
	public void setRecommendationTo(String recommendationTo) {
		this.recommendationTo = recommendationTo;
	}
	public String getRecommendationFrom() {
		return recommendationFrom;
	}
	public void setRecommendationFrom(String recommendationFrom) {
		this.recommendationFrom = recommendationFrom;
	}
	public int getIsRec() {
		return isRec;
	}
	public void setIsRec(int isRec) {
		this.isRec = isRec;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public int getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}
	public static String getTitleColumn() {
		return TITLE_COLUMN;
	}
	public static String getCreatedbyColumn() {
		return CREATEDBY_COLUMN;
	}
	public static String getRecommendationtoColumn() {
		return RECOMMENDATIONTO_COLUMN;
	}
	public static String getRecommendationfromColumn() {
		return RECOMMENDATIONFROM_COLUMN;
	}
	public static String getIsrecColumn() {
		return ISREC_COLUMN;
	}
	public static String getDescriptionColumn() {
		return DESCRIPTION_COLUMN;
	}
	public static String getClassificationColumn() {
		return CLASSIFICATION_COLUMN;
	}
	public static String getCoverColumn() {
		return COVER_COLUMN;
	}
	public static String getRatingColumn() {
		return RATING_COLUMN;
	}
	public static String getReleaseyearColumn() {
		return RELEASEYEAR_COLUMN;
	}
	public String getRecommendationToClassification() {
		return recommendationToClassification;
	}
	public void setRecommendationToClassification(
			String recommendationToClassification) {
		this.recommendationToClassification = recommendationToClassification;
	}
	public static String getRecommendationtoclassificationColumn() {
		return RECOMMENDATIONTOCLASSIFICATION_COLUMN;
	}
	public static String getRecommendationfromclassificationColumn() {
		return RECOMMENDATIONFROMCLASSIFICATION_COLUMN;
	}
	
	

}
