#reading the dataframe
df <- read.csv('C:/Users/Felipe/Desktop/Projeto Intro a R/Spotify_Youtube.csv')


#checking the details of the data and if everything is allright with it
class(df)

str(df)

View(df)

dim(df)

#There are some columns that are useless to us, let's delete them. The columns are:
# 'X', 'Url_spotify', 'Uri', 'Url_youtube', 'Title', 'Channel' 'Description'
df <- subset(df, select = -c(X, Url_spotify, Uri, Url_youtube, Title, Channel, Description))

View(df)

#importing ggplot2
library(ggplot2)

#importing focarts
library(forcats)

#importing dplyr
library(dplyr)

#making an scatterplot
ggplot(data=df) + geom_point(mapping = aes(x = Danceability, y = Energy),color='red')

#Selecting the top 10 most streamed spotify songs registered
top_10 <- head(df[order(-df$Stream), ], 14)

#Removing the duplicated songs
top_10 <- top_10[-c(5,8,11,14),]

#Shorting the title of the music to fit the graph better
top_10$Track[top_10$Track == 'Sunflower - Spider-Man: Into the Spider-Verse'] <- 'Sunflower' 


#creating a graph about the top 10 songs
ggplot(top_10, aes(y = reorder(Track, Stream), x = Stream, fill=Track)) +
geom_bar(stat = "identity", alpha=5, width=.3,) +
ggtitle("Top 10 Songs by number of streams") +
geom_text(aes(label = Stream), vjust = 0.5, hjust = -0.1) +
xlab("Number of streams (Billions)") +
ylab("") +
scale_x_continuous(limits = c(0,4000000000), expand = c(0.001,0)) +
theme(
  plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5), 
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  legend.position="none",
  axis.ticks.x = element_blank(),
  axis.text.x = element_blank(),
  axis.title.x = element_text(family = 'Courier', face='bold')
     )



