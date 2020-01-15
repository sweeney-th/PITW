
import random

# first we need the potential outcomes
doors = ["Door1", "Door2", "Door3"]

# then the results we have
outcomes = ["Win", "Loss", "Loss"]

# randomize the order of wins/losses
random.shuffle(outcomes)

# associate the wins and losses with a door
doorsDict = dict(zip(doors, outcomes))

# a function to choose a random door
def pickRandomDoor(doorsDict):
    return list(doorsDict.keys())[random.randint(0,2)]

ourDoor = pickRandomDoor(doorsDict)

