library(tercen)
library(dplyr)
library(reticulate)

# use virtualenv

# renv::init()
# renv::use_python()
# 
# reticulate:::py_install_method_detect()
# reticulate::py_install("trimap")
# reticulate::py_install("pandas")
# 
# renv::snapshot()
# 

# http://127.0.0.1:5402/admin/w/99ca4c32889264fd1c01b57bde00c4cd/ds/8035a1c5-cd31-41b9-9ddb-e6babc5ebf9d
options("tercen.workflowId" = "968e828a2d8eb509f7ccd060700068fe")
options("tercen.stepId"     = "bd9c55dd-d533-42ff-af36-9c6f10d837db")

getOption("tercen.workflowId")
getOption("tercen.stepId")

reticulate::source_python("main.py")

df <- (ctx <- tercenCtx()) %>%
  as.matrix(fill=0) %>% run_py_script()

colnames(df) <- c("trimap1", "trimap2")
df <- as.data.frame(df)
df$.ci <- 1:nrow(df) - 1

df %>%
  ctx$addNamespace() %>%
  ctx$save()
