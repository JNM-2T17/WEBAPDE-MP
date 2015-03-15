CREATE VIEW `Home Page` AS
SELECT W.title, WC2.name AS `Created By`, class, releaseYear, viewCount, network, studio, 
	   publisher, wordcount, datePremiered, GN.illustrator AS `Graphic Novel Illustrator`, 
       CM.illustrator AS `Comic/Manga Illustrator`, URL, org, 
       album, recordingStudio 
FROM work W 
	 LEFT JOIN liveactionanimation LAA ON W.title = LAA.title 
	 LEFT JOIN television T ON W.title = T.title 
     LEFT JOIN animation A ON T.title = A.title 
     LEFT JOIN book B ON W.title = B.title 
     LEFT JOIN graphicnovel GN ON B.title = GN.title 
     LEFT JOIN comicsmanga CM ON B.title = CM.title 
     LEFT JOIN webcontent WC ON W.title = WC.title 
     LEFT JOIN theater TH ON W.title = TH.title 
     LEFT JOIN videogame V ON W.title = V.title 
     LEFT JOIN music M ON W.title = M.title 
     LEFT JOIN album AL ON W.title = AL.title
     LEFT JOIN workCreator WC2 ON W.title = WC2.title AND WC2.isMain = TRUE
ORDER BY viewCount DESC 