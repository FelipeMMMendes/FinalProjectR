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

