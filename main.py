import pandas as pd
import numpy as np
import trimap

def run_py_script(data):
  embedding = trimap.TRIMAP().fit_transform(data)
  return embedding
