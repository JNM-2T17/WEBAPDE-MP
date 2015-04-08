CREATE VIEW `recommendations` AS 
	SELECT W.title AS title, WC2.name AS createdBy, RE.workFrom AS recommendationFrom, 
		   W.description AS description, W.class AS classification, 
           W.cover AS cover, IFNULL(AVG(R.rating), 0) AS rating, 
           W.releaseYear AS releaseYear, COUNT(RE.workFrom) AS `RecCtr` 
	FROM ( ( work W 
			LEFT JOIN workcreator WC2 ON (((W.title = WC2.title) and (WC2.isMain = 1)))) 
            LEFT JOIN rating R ON ((W.title = R.title))),
            recommendation RE
	WHERE W.title = RE.workTo AND isRec = TRUE
	GROUP BY W.title, RE.workFrom
    ORDER BY W.viewCount DESC