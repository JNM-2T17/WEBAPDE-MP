package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.themmt.model.RecommendationLink;
import com.themmt.model.User;
import com.themmt.model.Work;

public class RecommendationLinkDAO {
	public static Iterator get()
			throws IllegalArgumentException {
		
			int z=0;
			String query = "SELECT * FROM tmi.recommendations;";

						ArrayList<RecommendationLink> recommendations = new ArrayList<RecommendationLink>();
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ResultSet rs = ps.executeQuery();
		
				while( rs.next() ) {
					RecommendationLink r = new RecommendationLink(rs.getString(RecommendationLink.TITLE_COLUMN), rs.getString(RecommendationLink.CREATEDBY_COLUMN),
							rs.getString(RecommendationLink.RECOMMENDATIONTO_COLUMN),rs.getString(RecommendationLink.RECOMMENDATIONTOCLASSIFICATION_COLUMN), rs.getString(RecommendationLink.RECOMMENDATIONFROM_COLUMN),rs.getString(RecommendationLink.RECOMMENDATIONFROMCLASSIFICATION_COLUMN),
							rs.getInt(RecommendationLink.ISREC_COLUMN),rs.getString(RecommendationLink.DESCRIPTION_COLUMN), rs.getString(RecommendationLink.CLASSIFICATION_COLUMN),
							rs.getString(RecommendationLink.COVER_COLUMN), rs.getFloat(RecommendationLink.RATING_COLUMN), rs.getInt(RecommendationLink.RELEASEYEAR_COLUMN));
							recommendations.add( r );
				}
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("Error retrieving recommendations from the database");
			}
			
			return recommendations.iterator();
		}
	
	public static Iterator getRecommended( String workName)
		{
		Iterator iterator = RecommendationLinkDAO.get();
		ArrayList<Work> works = new ArrayList<Work>();
		
		while(iterator.hasNext()) {
			RecommendationLink temp = (RecommendationLink)iterator.next();
			if(temp.getRecommendationTo()!=null)
				{
				if(temp.getTitle().equals(workName))
					{
					//System.out.println(temp.getTitle() + "recommends " + temp.getRecommendationTo()+" ("+temp.getRecommendationToClassification()  +")");
					Work tempwork = WorkDAO.get(temp.getRecommendationTo(), temp.getRecommendationToClassification());
					//System.out.println("What tempwork has bestowed: "+ tempwork.getTitle());
					works.add(tempwork);
					}
	
				}
			}
		return works.iterator();
		}

	
	
}
