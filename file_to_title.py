import sys

# Get input file
inp = sys.argv[1]

# Create title by replacing stings
title = inp.replace(".pdf", "").replace("_", " ").replace("-", " - ").title()

# Print title
print(title)
