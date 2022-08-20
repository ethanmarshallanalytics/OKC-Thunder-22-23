## OKC Project 2022-2023

shots = read.csv(choose.files(), header = T) # File Name 'shots_data'
attach(shots)
shots$z =  sqrt(x^2 + y^2) # Created a new variable for pythagrean theorem z = sqrt(x^2 + y^2)
teamAshots = subset(shots, team == 'Team A')
teamBshots = subset(shots, team == 'Team B')

## Corner 3s
corner3 = subset(shots, abs(shots$x)>22 & shots$y<=7.8) # Corner 3 Subset.
corner3MADEa = subset(corner3, fgmade == 1 & team == 'Team A')
corner3MISSa = subset(corner3, fgmade == 0 & team == 'Team A')
corner3MADEb = subset(corner3, fgmade == 1 & team == 'Team B')
corner3MISSb = subset(corner3, fgmade == 0 & team == 'Team B')
nrow(corner3MADEa)/(nrow(corner3MADEa)+nrow(corner3MISSa)) # Team A made 50% of Corner 3s
(nrow(corner3MADEa)+(nrow(corner3MISSa)))/nrow(teamAshots) # 6.4% of Team A shots were Corner 3s
nrow(corner3MADEb)/(nrow(corner3MADEb)+nrow(corner3MISSb)) # Team B made 36% of Corner 3s
(nrow(corner3MADEb)+(nrow(corner3MISSb)))/nrow(teamBshots) # 4.911% of Team B shots were Corner 3s

# Non-Corner 3s
nc3 = subset(shots, y>7.8 & z>23.75) # Non-Corner 3 Subset
nc3MADEa = subset(nc3, fgmade == 1 & team == 'Team A')
nc3MISSa = subset(nc3, fgmade == 0 & team == 'Team A')
nc3MADEb = subset(nc3, fgmade == 1 & team == 'Team B')
nc3MISSb = subset(nc3, fgmade == 0 & team == 'Team B')
nrow(nc3MADEa)/(nrow(nc3MADEa)+nrow(nc3MISSa)) # Team A made 30.88% of Non-Corner 3s
(nrow(nc3MADEa)+(nrow(nc3MISSa)))/nrow(teamAshots) # 24.29% of Team A shots were Non-Corner 3s
nrow(nc3MADEb)/(nrow(nc3MADEb)+nrow(nc3MISSb)) # Team B made 33.87% of Non-Corner 3s
(nrow(nc3MADEb)+(nrow(nc3MISSb)))/nrow(teamBshots) # 27.679% of Team B shots were Non-Corner 3s

# 2 Point Shots
twoPoint = subset(shots, z<23.75&abs(x)<22) # Two Point Subset
twoPointMADEa = subset(twoPoint, fgmade == 1 & team == 'Team A')
twoPointMISSa = subset(twoPoint, fgmade == 0 & team == 'Team A')
twoPointMADEb = subset(twoPoint, fgmade == 1 & team == 'Team B')
twoPointMISSb = subset(twoPoint, fgmade == 0 & team == 'Team B')
nrow(twoPointMADEa)/(nrow(twoPointMADEa)+nrow(twoPointMISSa)) # Team A made 48.97% of 2s
(nrow(twoPointMADEa)+(nrow(twoPointMISSa)))/nrow(teamAshots) # 69.29% of Team A shots were 2s
nrow(twoPointMADEb)/(nrow(twoPointMADEb)+nrow(twoPointMISSb)) # Team B made 44.67% of 2s
(nrow(twoPointMADEb)+(nrow(twoPointMISSb)))/nrow(teamBshots) # 66.964% of Team B shots were 2s

########### Effective Field Goal %############
(nrow(subset(shots, fgmade == 1 & team == 'Team A'))+(.5*(nrow(corner3MADEa)+nrow(nc3MADEa))))/nrow(teamAshots) #TEAM A OVERALL HAS A 50% EFG%
(nrow(subset(shots, fgmade == 1 & team == 'Team B'))+(.5*(nrow(corner3MADEb)+nrow(nc3MADEb))))/nrow(teamBshots) #TEAM B OVERALL HAS A 44.65% EFG%

(nrow(subset(corner3, fgmade == 1 & team == 'Team A'))+(.5*(nrow(corner3MADEa))))/(nrow(subset(corner3, team == 'Team A'))) #Team A has a 75% EFG% in Corner 3s
(nrow(subset(corner3, fgmade == 1 & team == 'Team B'))+(.5*(nrow(corner3MADEb))))/(nrow(subset(corner3, team == 'Team B'))) #Team B has a 54.54% EFG% in Corner 3s
(nrow(subset(nc3, fgmade == 1 & team == 'Team A'))+(.5*(nrow(nc3MADEa))))/(nrow(subset(nc3, team == 'Team A'))) #Team A has a 46.32% EFG% in Non-Corner 3s
(nrow(subset(nc3, fgmade == 1 & team == 'Team B'))+(.5*(nrow(nc3MADEb))))/(nrow(subset(nc3, team == 'Team B'))) #Team B has a 50.8% EFG% in Non-Corner 3s
nrow(subset(twoPoint, fgmade == 1 & team == 'Team A'))/(nrow(subset(twoPoint, team == 'Team A'))) #Team A has a 48.96% EFG% in 2s
nrow(subset(twoPoint, fgmade == 1 & team == 'Team B'))/(nrow(subset(twoPoint, team == 'Team B'))) #Team B has a 44.67% EFG% in 2s



