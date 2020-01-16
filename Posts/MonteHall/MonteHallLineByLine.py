
import random

# a simple way to represent a door
class Door(object):

    # just something to refer to it by
    name = None

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
door1.name = "Door #1"

door2.contents = outcomes[1]
door2.name = "Door #2"

door3.contents = outcomes[2]
door3.name = "Door #3"

# simply for convinience
doors = [door1, door2, door3]

# a function to pick a random door
def pickRandomDoor(doorList):
    return doorList[random.randint(0,2)]

chosenDoor = pickRandomDoor(doors)

# now we need to to be able to "open" a door
def openDoor(door):
    door.isOpen = True
    return door

# now we need to reveal a door - this is where things get weird
# the key is that to build the suspense, they always reveal a
# door that has a loss behind it. This means the selection is
# NOT random. They're removing one loss from the equation for
# you. That means if you guess again, you gussing between 2
# doors, a win and a loss. The selection you started with had
# a 1/3 chance of being a loss - you could picked any of the 
# doors. Now though, you're making another guess after one way
# to lose has been removed from the equation

def revealLoss(doors, chosenDoor):
    # we will START with a random door, but if it's the winner
    # we won't reveal it, and if it's already opened, we can't
    # do that either! this is how the data get skewed - we're 
    # not removing a random door
    
    # we will look for the door to reveal in a random order...
    orderToLook = [0,1,2]

    # shuffle them
    random.shuffle(orderToLook)

    # ...but then look through each door to see if it's open and a loss
    for number in orderToLook:
        doorAtNumber = doors[number]
        if doorAtNumber.isOpen is False and doorAtNumber.contents is not "win" and doorAtNumber is not chosenDoor:
            return doorAtNumber

# now we can reveal a door 
doorOpened = openDoor(revealLoss(doors, chosenDoor))

def switchDoors(doors, currentDoor):
    # there will be one door that isn't open or our current guess
    return [
        d for d in doors if d.isOpen == False
            and d.name != currentDoor.name
    ][0]

def switchDoors2(doors, currentDoor):
    # pick a door that ...
    for d in doors:
        # ...isn't the current door...
        if d == currentDoor:
            continue # skip the iteration
        # ... and isn't opened
        if d.isOpen == True:
            continue
        return d

print("Our first choice is", chosenDoor.name)
print("The door that was opened", doorOpened.name)
chosenDoor = switchDoors2(doors, chosenDoor)
print("Our choice after switching is", chosenDoor.name)