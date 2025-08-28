import pandas as pd
import sys
mapping = pd.read_csv(sys.argv[2])
history = json.load(open(sys.argv[3]))
prev_partition = json.load(open(sys.argv[4]))
