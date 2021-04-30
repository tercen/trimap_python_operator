library(tercen)
library(dplyr)
library(reticulate)

reticulate::source_python("main.py")

df <- (ctx <- tercenCtx()) %>%
  as.matrix(fill=0) %>%
  t() %>%
  run_py_script()

colnames(df) <- c("trimap1", "trimap2")
df <- as.data.frame(df)
df$.ci <- 1:nrow(df) - 1

df %>%
  ctx$addNamespace() %>%
  ctx$save()
