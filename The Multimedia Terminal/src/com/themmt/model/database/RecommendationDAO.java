package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.themmt.model.Recommendation;
import com.themmt.model.User;
import com.themmt.model.Work;

public class RecommendationDAO {
	public static ArrayList<Recommendation> get(int isRec)
			throws IllegalArgumentException {
		
			int z=0;
			String query = "SELECT * FROM tmi.recommendations Where isRec ="+isRec;
			ArrayList<Recommendation> recommendations = new ArrayList<Recommendation>();
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ResultSet rs = ps.executeQuery();
		
				while( rs.next() ) {
					Recommendation r = new Recommendation(rs.getString(Recommendation.TITLE_COLUMN), rs.getString(Recommendation.CREATEDBY_COLUMN),
							rs.getString(Recommendation.RECOMMENDATIONTO_COLUMN),rs.getString(Recommendation.RECOMMENDATIONTOCLASSIFICATION_COLUMN), rs.getString(Recommendation.RECOMMENDATIONFROM_COLUMN),rs.getString(Recommendation.RECOMMENDATIONFROMCLASSIFICATION_COLUMN),
							rs.getInt(Recommendation.ISREC_COLUMN),rs.getString(Recommendation.DESCRIPTION_COLUMN), rs.getString(Recommendation.CLASSIFICATION_COLUMN),
							rs.getString(Recommendation.COVER_COLUMN), rs.getFloat(Recommendation.RATING_COLUMN), rs.getInt(Recommendation.RELEASEYEAR_COLUMN));
							recommendations.add( r );
				}
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("Error retrieving recommendations from the database");
			}
			
			return recommendations;
		}
	
	public static ArrayList<Work> getRecommended( String workName) {
		ArrayList<Recommendation> recos = RecommendationDAO.get(1);
		ArrayList<Work> works = new ArrayList<Work>();
		
		for( Recommendation temp: recos ) {
			if(temp.getRecommendationTo()!=null) {
				if(temp.getTitle().equals(workName)) {
					//System.out.println(temp.getTitle() + "recommends " + temp.getRecommendationTo()+" ("+temp.getRecommendationToClassification()  +")");
					Work tempwork = WorkDAO.get(temp.getRecommendationTo(), temp.getRecommendationToClassification());
					//System.out.println("What tempwork has bestowed: "+ tempwork.getTitle());
					works.add(tempwork);
				}
			}
		}
		
		return works;
	}
	
	public static ArrayList<Work> getUnrecommended( String workName) {
		ArrayList<Recommendation> recos = RecommendationDAO.get(0);
		ArrayList<Work> works = new ArrayList<Work>();
		
		for( Recommendation temp: recos ) {
			if(temp.getRecommendationTo()!=null) {
				if(temp.getTitle().equals(workName)) {
					//System.out.println(temp.getTitle() + "recommends " + temp.getRecommendationTo()+" ("+temp.getRecommendationToClassification()  +")");
					Work tempwork = WorkDAO.get(temp.getRecommendationTo(), temp.getRecommendationToClassification());
					//System.out.println("What tempwork has bestowed: "+ tempwork.getTitle());
					works.add(tempwork);
				}
			}
		}
		
		return works;
	}

	
	
}
