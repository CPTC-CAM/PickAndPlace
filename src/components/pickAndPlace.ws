# This program is to demonstrate a pick and place program
# There are 3 chutes that are gravity fed to dispense cylindrical objects like Glue Sticks
# The program will be run from an app that will take the number of each product
# grip the objects one at a time, and place them in a bin if a bin is sensed on a
# conveyor belt. This program is a basic one meant to run in Robot Pad

myrobot = myvirtualbot # Name of the robot

# These are inputs will be provided via the ProgramRunner in the App
num_product_1 = read(arguments, "num_product_1")
num_product_2 = read(arguments, "num_product_2")
num_product_3 = read(arguments, "num_product_3")

# Using join rotations for more predictable movements
home = [-0.976, -2.08, -1.62, 3.715, -5.713, 1.584]

# Joint points

# Chute 01
chute_01_approach = [-1.12, -2.332, -1.224, 3.531, -5.839, 1.584] # -64.21, -133.61, -70.15, 202.26, -334.49, 90.77
chute_01_pick = [-1.323, -2.333, -1.235, 3.527, -5.912, 1.584]
chute_01_up = [-1.322, -2.17, -1.294, 3.516, -6.017, 1.546] # Move up with product picked

# Chute 02
chute_02_approach = [-1.0316, -2.1069, -1.6166, 3.7024, -5.7506, 1.5797]
chute_02_pick = [-1.269, -2.071, -1.683, 3.741, -5.921, 1.586]
chute_02_up = [-1.274, -1.816, -1.083, 3.084, -6.031, 1.394]

# Chute 03
chute_03_approach = [-1.013, -1.872, -1.996, 3.858, -5.715, 1.583]
chute_03_pick = [-1.175, -1.832, -2.065, 3.885, -5.900, 1.583]
chute_03_up = [-1.147, -1.484, -1.445, 3.157, -5.980, 1.397]

# Universal
move_to_box = [-1.419, -1.776, -1.248, 4.571, -6.174, 0.565]
place_in_box = [-1.628, -2.410, -0.841, 4.595, -6.233, 1.803]
away_from_box = [-1.599, -1.981, -0.842, 4.579, -4.663, 1.803]

# Remove product bin
#up_from_box = [-1.321, -1.454, -1.583, 3.612, -5.983, 1.396]
#rotate_gripper = []
#box_lineup = []
#box_pickup = []
#box_up = []
#box_away = []
#box_dropoff = []
#box_dropoff_up = []

# GLOBALS
WAIT_TIME = 500
VEL_APPROACH = 50
VEL_PICKED = 90
VEL_FREE = 130

def open_gripper():
    write(myrobot, "digital_out[0]", False)
    wait(WAIT_TIME)
    print("Gripper open")

def close_gripper():
    write(myrobot, "digital_out[0]", True)
    wait(WAIT_TIME)
    print("Gripper closed")


def get_and_place_chute_product(approach_pose, pick_pose, up_pose):
    velocity(VEL_FREE)
    move via joint_p2p() to approach_pose
    velocity(VEL_APPROACH)
    move via joint_p2p() to pick_pose
    velocity(VEL_PICKED)
    close_gripper()
    move via joint_p2p() to up_pose
    place_product_in_box()

def place_product_in_box():
    move via joint_p2p() to move_to_box
    move via joint_p2p() to place_in_box
    open_gripper()
    velocity(VEL_FREE)
    move via joint_p2p() to away_from_box

## Start program
velocity(VEL_FREE) # Slow speed down at the start to avoid fast movement
move via joint_p2p() to home
open_gripper()

# Pick products
for i = 1..num_product_1:
    get_and_place_chute_product(chute_01_approach, chute_01_pick, chute_01_up)

for i = 1..num_product_2:
    get_and_place_chute_product(chute_02_approach, chute_02_pick, chute_02_up)

for i = 1..num_product_3:
    get_and_place_chute_product(chute_03_approach, chute_03_pick, chute_03_up)

move via joint_p2p() to home