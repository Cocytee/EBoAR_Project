#CMP FILE 
#Every parameters and fonctions about analysed components databases
#---------------------------------------------------------------------
# CMP Structure : Need 3 files x_DB.txt , xxxx_PATTERN.bmp & xxxx_LB.txt
#	----DB---- From x_DB.txt
#	ToAnalyse? ( -(or other) No, + Yes)
# 	Name
#	heightAnalysisZone (xPx)
#	widthAnalysisZone (yPx)
#	AnalysisFile (.txt)
#	Others Parameters -> Height|Temperature|etc..
#  	----ANALYSIS---- From xxxx_PATTERN.bmp & xxxx_LB.txt
#	IdealParam
#	FactorWeight
#	CategorizingLimit
#	----COORD----
#	VFC (array of type FootprintCoord (X,Y,statParam,difference)) (see PROCESSING.jl)
#		(!) the VFC array is first filled with FootprintCoord that had most lowest sifference score (btw other footprints)
#		then the array is filtered again with gaussian analysis so it only remains the "ready to extract" coordinates.

#		Only the DB section is processed at the start to avoid waiting time.

#	x_DB.txt
#	Name1
#	xPx|yPx
#	AnalysisFile1 (.txt)
#	Others Parameters1 -> Height|Temperature|etc..
#	Name2
#	xPx|yPx
#	Etc...

#	xxxx_LB.txt
# 	IdealParam
#	FactorWeight
#	CategorizingLimit
#	statParam (with spaces as separator)
