# Species observations in different locations
species_data <- data.frame(
  Species = c("Homo sapiens", "Mus musculus"),
  Location = c("Lab1", "Lab2"),
  Count = c(15, 25)
)

print(species_data)

print(species_data[, 'Count']) #print column



#practice

species.obvs <- data.frame( #includes made up species & fake observations
  Species = c( "felis cattus", "canis familiaris", "mus musculus", "obaybus fonulus", "bensuculi mescop", "fairii lorsos", "Delskio fok", "Flomming shiikon", "Pakksel borsh", "Ghexx covop"),
  Habitat = c( "grasslands", "forest", "grasslands", "rainforest", "freshwater river", "forest", "wetlands/swamp", "Urban alleyways", "Underground caves", "Cumulus cloudscapes"),
  Count = c( 12, 8, 32, 3, 7, 1, 2, 5, 9, 1)
)

print (species.obvs)

subset(species.obvs, Count>5)

summary(species.obvs)
