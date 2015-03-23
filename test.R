library(tm)
load = readPlain(elem = list(content = readLines('./input.txt')), language = "en", id = "id1")
doc.vec <- VectorSource(load)
a <- Corpus(doc.vec)

a <- tm_map(a, removeNumbers)
a <- tm_map(a, removePunctuation)
a <- tm_map(a , stripWhitespace)
a <- tm_map(a, tolower)
a <- tm_map(a, removeWords, stopwords("english"))

term = TermDocumentMatrix(a)
freq = findFreqTerms(term)
bagOfWord = inspect(term)
