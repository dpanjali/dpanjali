install.packages("magick")
library(magick)

# frame 1
text <- image_blank(width = 500, height = 500, color = "gray88") %>%
  image_annotate(text = "when your r code doesn't work",
                 color = "#FF0000",
                 size = 18,
                 font = "Century",
                 gravity = "center")

# frame 2
sad_face <- image_read("https://media.istockphoto.com/photos/stressed-out-working-late-picture-id1044392376?k=20&m=1044392376&s=612x612&w=0&h=lLLjPueZgNydxrBNoxxx63pVr0eoNFLDFj6p7jN3c6s=")
meme <- image_write(sad_face, "my_meme.png")

# frame 3
frustrated_text <- image_blank(width = 500, height = 500, color = "#FFFF00") %>%
  image_annotate(text = "when you realise you forgot a bracket at the end of the code",
                 color = "#FF0000",
                 size = 17,
                 font =  "Century",
                 gravity = "center")

# frame 4
frustrated_face <- image_read("https://cdn.pixabay.com/photo/2017/10/10/21/49/youtuber-2838945__480.jpg")
my_meme <- image_write(frustrated_face, "my_meme.png")

#making each row/column
vector <- c(text,sad_face)
top_row <- image_append(vector)
bottom_row <- image_append(c(frustrated_text, frustrated_face))

#putting them all together
meme <- c(top_row, bottom_row) %>%
  image_append(stack = TRUE) %>%
  image_scale(500)
image_write(meme, "my_meme.png")



