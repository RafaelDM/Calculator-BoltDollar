# Nayra 1316 
# My wallet 0x8241d17F66e6a7cE30831F282b1c843386d20465 if you want help me to reach my goal of 3 bts xD

n = 3 # How much btd are you winning right now
total = 0 # Initialize the variable of the total amount you will have if you don't unstake in btd
for k in range(200): # 201 epochs or 1608 hours = 66 days or 2 months, you can change this to your expectations
    if(k >= 60): 
        n= n + (n * .015) # for 60 to 120 epochs 1.5% you can change this with your expects
        total = total+n
    elif(k >= 120):
        n= n + (n * .01) # for 120 to 200 epochs 1% you can change this with your expects
        total = total+n
    else:
        n = n + (n * .03) # For the first 60 epochs with 3% expansion in boardroom you can change this with your expects
        total = total+n

print("Total BTD by day ", n) # Total btd by day
print("Total amount of money ", total) # Total amount of money from today to the number you put in range


