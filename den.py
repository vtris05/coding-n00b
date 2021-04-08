user_name = int(input("Give me a number!"))

for i in range(1, user_name + 1):
    if user_name % i != 0:
        continue
    print(i)    
