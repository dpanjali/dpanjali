install.packages("magick")
library(magick)

# frame 1
text <- image_blank(width = 500, height = 500, color = "gray88") %>%
  image_annotate(text = "when your r code doesn't work",
                 color = "gray88",
                 size = 20,
                 font = "Century" )

# frame 2
sad_face <- image_read("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxCLe1joVRdVm51RsltxBn5sjpltxNMxiNGQ&usqp=CAU")
meme <- image_write(sad_face, "my_meme.png")

# frame 3
frustrated_text <- image_blank(width = 500, height = 500, color = "#FFFF00") %>%
  image_annotate(text = "when you realise you forgot a bracket at the end of the code",
                 color = "#FF0000",
                 size = 20,
                 font =  "Comic Sans MS",
                 gravity = "center")

# frame 4
frustrated_face <- image_read("https://image.shutterstock.com/image-photo/why-that-beautiful-male-halflength-260nw-1294532842.jpg")
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

