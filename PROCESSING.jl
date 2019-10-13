#PROCESSING FILE 
#All the mathematic and processing fonctions
#---------------------------------------------------------------------
# Analysis Parameters :
#	statParam -> Horizontal_sum_of_pixels(Array)|Vertical_sum_of_pixels(Array)
#	IdealParam -> mean of all statparams
#	FactorWeight -> weighting(std(statParam)) -> array 1-D of floats , closer to 1 == highly representative.
#	Similarity -> sum(abs(IdealParam-statParam).*FactorWeight) , closer to 0 is closer to the ideal pattern. 
#	CategorizingLimit -> [mean(Similarity)+X*std(Similarity),mean(Similarity)-X*std(Similarity)]
# 		Using the "average" allow to avoid the offset due to the difference induced by the irrealistic shape of the ideal pattern.
#		the X is the amout of learning data included into the accepting range. Working like 1/2/3 sigma in gaussian repartition.

#Validated Footprint Coordinate -> Coordiante that locate a pattern that passed the partial comparaison, the comparaison , the filtering , and the Similarity check.
#Every Validated Footprint Coordinate is compared to other footprint to avoid redundancy
#Consequently, every Validated Footprint Coordinate is linked to the coressponding Similarity value
#When comparing to array of VFC to an another (of an another footprint), if double are noticed, the one with the smaller Similary value will be choosed.