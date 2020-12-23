# Simple python program for randomly assigning drivers to bank holidays

import random

vans = []
hgvs = []

# Read van drivers txt
with open('vans.txt') as f:
        for line in f:
                vans.append(line)

# Read hgv drivers txt
with open('hgvs.txt') as f:
        for line in f:
                hgvs.append(line)

# Duplicate list of drivers
vans = vans * 2
hgvs = hgvs * 2

# Shuffle drivers list
vrandomised = random.sample(vans, len(vans))
hrandomised = random.sample(vans, len(hgvs))

# Split drivers equally
num_drivers = int(len(vans) / 7)

# Create 2D Array
def createRota(x, y):
    arr = [x[i:i+y] for i in range(0, len(x), y)]
    return arr

# Print to text file
with open("rota.txt", "w") as txt_file:
    for line in createRota(vans, num_drivers):
        txt_file.write(" ".join(line) + "\n")

print("Rota Created")