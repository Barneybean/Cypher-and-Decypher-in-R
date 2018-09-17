# to encryt
letter <- print(letters)
num <- 1:27
mat <- rbind(num)
letter_w_space<- c(letter, " ")
colnames(mat) <- letter_w_space
mat

#text: "to be or not to be"
## convert text into single letters, make sure it is multiple of row number of key matrix, in this case 3

text <- c("t","o"," ","b","e"," ","o","r"," ","n","o","t"," ","t","o"," ","b","e"," ","y"," ")

for (i in 1:length(text)) {
  text[i] <- mat[1,text[i]]
}
text
text_matrix <- matrix(as.numeric(text), ncol=3, byrow=TRUE)
text_matrix
key <- matrix(c(2,4,6,-1,-4,-3,0,1,-1), nrow=3)
key
encrypted <- text_matrix %*% key
encrypted

#to decrypt

(inverse_key <- solve(key))
(decription <- encrypted %*% inverse_key)
(text_decripted <- as.numeric(t(decription)))

#create letter matrix named in number
mat_text <- matrix(letter_w_space, nrow=1)
colnames(mat_text) <- c(1:27)
mat_text
text_decripted[19]
for(j in 1:length(text_decripted)) {
  text_decripted[j] <- mat_text[,text_decripted[j]]
}
text_decripted
cat(text_decripted)
