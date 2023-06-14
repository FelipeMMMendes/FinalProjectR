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

#Selecting the top 10 most streamed spotify songs registered (14 because of the dupplications)
top_10_spotify <- head(df[order(-df$Stream), ], 14)

#Removing the duplicated songs
top_10_spotify <- top_10_spotify[-c(5,8,11,14),]

#Shorting the title of the music to fit the graph better
top_10_spotify$Track[top_10_spotify$Track == 'Sunflower - Spider-Man: Into the Spider-Verse'] <- 'Sunflower' 

#creating a graph about the top 10 songs on spotify
ggplot(top_10_spotify, aes(y = reorder(Track, Stream), x = Stream, fill=Track)) +
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
  axis.title.x = element_text(family = 'Courier', face='bold'),
     )

#Selecting the top 10 most viewed youtube songs registered (12 because of the dupplications)
top_10_youtube <- head(df[order(-df$Views), ], 12)

#Removing the duplicated songs
top_10_youtube <- top_10_youtube[-c(2,4),]

#Selecting the top 10 most energy songs registered (14 because of the dupplications)
top_10_energy <- head(df[order(-df$Energy), ], 10)

#creating a graph about the top 10 songs from youtube
ggplot(top_10_youtube, aes(y = reorder(Track, Views), x = Views, fill=Track)) +
  geom_bar(stat = "identity", alpha=5, width=.3,) +
  ggtitle("Top 10 Songs by number of views") +
  geom_text(aes(label = Views), vjust = 0.5, hjust = -0.1) +
  xlab("Number of views (Billions)") +
  ylab("") +
  scale_x_continuous(limits = c(0,9100000000), expand = c(0.001,0)) +
  theme(
    plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5), 
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position="none",
    axis.ticks.x = element_blank(),
    axis.text.x = element_blank(),
    axis.title.x = element_text(family = 'Courier', face='bold'),
  )

#cutting some features from the table
top_liked_youtube <- subset(top_liked_youtube, select = c(Artist, Track, Danceability, Energy, Valence, Likes, Comments, Stream, Views))

#creating a graph about the danceability and energy of the top songs
ggplot(data=top_10_spotify) + geom_point(mapping = aes(x = Danceability, y = Energy, color=Track),size=4) +
ggtitle("Danceability and Energy of the Top 10 Songs") +
theme(plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5))

#selecting the songs with less streams in spotify
less_10 <- head(df[order(df$Stream), ], 10)

#cutting some features from the table
less_10 <- subset(less_10, select = c(Artist, Track, Danceability, Energy, Valence, Likes, Comments, Stream, Views))

#cutting some songs for a pretty table
less_10 <- less_10[-c(1,2),]

#making an scatterplot about energy and loudness
ggplot(data=df) + geom_point(mapping = aes(x = Loudness, y = Energy),color='red') +
  ggtitle("Comparing Energy and Loudness of the songs") +
  theme(plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5))


#creating a graph about the valence and energy of the top songs
#making an scatterplot about Acousticness and danceability
  ggplot(data=df) + geom_point(mapping = aes(x = Acousticness, y = Danceability),color='red') +
  ggtitle("Comparing Acousticness and Danceability of the songs") +
  theme(plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5))
  

#creating a graph about the key and stream of the top songs
#making an scatterplot about KEY and STREAM
  ggplot(data=df) + geom_point(mapping = aes(x = Key, y = Stream),color='red') +
  ggtitle("Comparing Key and Stream of the songs") +
  theme(plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5)) 

#creating a graph about the valence and loudness of the top songs
#making an scatterplot about Valence and Loudness
  ggplot(data=df) + geom_point(mapping = aes(x = Valence, y = Loudness),color='red') +
    ggtitle("Comparing Valence and Loudness of the songs") +
    theme(plot.title=element_text(family='', face='bold', colour='blue', size=14, hjust = 0.5))
