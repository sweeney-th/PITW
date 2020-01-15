
import random

# a simple way to represent a door
class Door(object):

    # will have contents (win or loss)
    contents = None

    # will or will not be opened at any given time
    isOpen = False

# make three blank doors
door1 = Door()
door2 = Door()
door3 = Door()

# potential outcomes
outcomes = ["win", "loss", "loss"]

# shuffle the results
random.shuffle(outcomes)

# doors
door1.contents = outcomes[0]
door2.contents = outcomes[1]
door3.contents = outcomes[2]

# simply for convinience
doors = [door1, door2, door3]

for d in doors:
    print(d.contents)
