#task1
'''num1=int(input("enter a number:"))
num2=int(input("enter a number:"))
num3=int(input("enter a number:"))
if num1>num2 and num1>num3:
    print(num1,"is the largest number")
elif num2>num1 and num2>num3:
    print(num2,"is the largest number")
else:
    print(num3,"is the largest number")'''
    
    #task2
'''from random import *
rasulta = randint(1,12)
print(f"your number is : {rasulta}")
if rasulta==1:
    print("The corresponding month is January")
elif rasulta==2:
    print("The corresponding month is February")    
elif rasulta==3:
    print("The corresponding month is March")
elif rasulta==4:
    print("The corresponding month is April")   
elif rasulta==5:
    print("The corresponding month is May")
elif rasulta==6:
    print("The corresponding month is June")
elif rasulta==7:
    print("The corresponding month is July")
elif rasulta==8:
    print("The corresponding month is August")
elif rasulta==9:
    print("The corresponding month is September")
elif rasulta==10:
    print("The corresponding month is October")
elif rasulta==11:
    print("The corresponding month is November")
elif rasulta==12:
    print("The corresponding month is December")'''
    
#task3
'''num1=12
num2=13
num1=num1^num2
num2=num1^num2
num1=num1^num2
print(num1,num2)'''

#task4
'''age=int(input("enter your age:"))
if age<=12:
    print("Tickect is free")
elif age>12 and age<=60:
    membership_card=input("do you  have a membership card:")
    if membership_card=="yes":
        price=150
    else:
        price=200
        print(price)
else:
    price=100
print(price)'''

#task5
'''from random import *
utility = randint(0.1000)
print(f"your utility usages is {utility}")
if utility<100:
    cost=utility*5
elif utility>=100 and utility<=300:
    temp=utility-100
    cost=100*5+temp*8
elif utility>300:
    temp=utility-300
    cost=100*5+200*8+temp*10
print(f"your total cost is: Rs. {cost}.")'''

#task6
'''print("PAPER =P")
print("SCISSOR =S")
PLAYER1=input("PLAYER1;  enter your move:")
PLAYER2=input("PLAYER2;  enter your move:")
if PLAYER1==PLAYER2:
    print("IT'S A TIE")
elif PLAYER1 == 'R':
    if PLAYER2 == 'S':
        print("PLAYER1 WINS")
    elif PLAYER2 == 'P':
        print("PLAYER2 WINS")
elif PLAYER1 == 's':
    if PLAYER2 == 'R':
        print("PLAYER2 WINS")
    elif PLAYER2 == 'P':
        print("PLAYER1 WINS")
elif PLAYER1 == 'P':
    if PLAYER2 == 'R':
        print("PLAYER1 WINS")
    elif PLAYER2 == 'S':
        print("PLAYER2 WINS")
else:
    print("INVALID INPUT")'''
    
#task7
'''class1=int(input("enter the number of students in class'a'"))
class2=int(input("enter the number of students in class'b'"))
class3=int(input("enter the number of students in class'c'"))
desk1=int((class1+1)//2)
desk2=int((class2+1)//2)
desk3=int((class3+1)//2)
print(desk1,desk2,desk3)'''

#task8
'''from random import *
temp=randint(0,10)
if temp ==0:
    current = 'G'
else:
    current = str(temp)
    print(f"you are currently in group {current} floor.")
    wanna=input("Enter which floor you want to go to next(G-10):")
    if wanna =='G':
        wanna =0
    else:
        wanna=int(wanna)
    if temp == wanna:
        print("Lift syaing at current floor.")
    elif temp > wanna:
        print("Lift going down.")
    else:
        print("Lift going up.")'''
        
#task9
'''num=int(input("enter a number:"))
if num > 0:
    print("The number is positive")
    if num % 2 == 0:
        print("It is even")
    else:
        print("It is odd")
else:
    print("The number is not positive")'''
    
#task10
'''a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
if a > b:
    print("The greater number is:",a)
elif b > a:
    print("The greater number is:",b)
else:
    print("Both numbers are equal.")
    if a > 0:
        print("The number is positive.")
    elif a < 0:
        print("The number is negative.")
    else:
        print("The number is zero.")'''
        
        #task11
'''num = int(input("Enter a number: "))
if num % 3 == 0 and num % 5 == 0:
    print("FizzBuzz")
elif num % 3 == 0:
    print("Fizz")
elif num % 5 == 0:
    print("Buzz")
else:
    print(num)'''
    
    #task12
'''num = int(input("enter a number:"))
if num == 0:
    print('Flamingos turn pink eating shrimp.')
elif num == 1:
    print("The only food that doesn't spoil is honey.")
elif num == 2:
    print("shrimp can only swim backwards.")
elif num == 3:
    print("A taste bud's life span is about 10 days.")
elif num == 4:
    print('It is impossible to sneeze while sleeping.')
elif num == 5:
    print("It is illegal to sing off-key in North Carolina.")'''
    
    #task13
'''total_amount = float(input("Enter total purchase amount:"))
is_member = input("Are you a member? (True/False):")
if is_member == 'True' or is_member=='true':
    is_member = "True"
elif is_member == 'False' or is_member=='false':
    is_member = "False"
    if total_amount > 1000 and is_member == "True":
        discount = total_amount * 0.20
        final_amount = total_amount - discount
        print("Total after 20% discount:,final _amount")
    elif total_amount > 1000 and is_member == "False":
        discount = total_amount * 0.10
        final_amount = total_amount - discount
        print("Total after 10% discount:,final_amount")
    else:
        print("No discount, Total:", total_amount)'''
        
#task14
'''weight = float(input("Enter your earth weight:"))
planet = int(input("Enter planet number (1-7):"))
if planet ==1:
    gravity = 0.38
elif planet ==2:
    gravity = 0.91  
elif planet ==3:
    gravity = 0.38
elif planet ==4:
    gravity = 2.53
elif planet ==5:
    gravity = 1.07
elif planet ==6:
    gravity = 0.89
elif planet ==7:
    gravity = 1.14
else:
    print("Invalid planet number.")
    gravity = None
if gravity is not None:
    print("your weight on that planet is:",weight*gravity)'''
    
    #task15
'''m1 = float(input("Enter marks for subject 1:"))
m2 = float(input("Enter marks for subject 2:"))
m3 = float(input("Enter marks for subject 3:")) 
m4 = float(input("Enter marks for subject 4:"))
total= m1 + m2 + m3 + m4
percentage = (total / 400) * 100
print("Total marks:", total)
print("Percentage:", percentage)
if percentage >= 70:
    print("Grade:Distinction")
elif percentage >= 60:
    print("Grade:First Class")  
elif percentage >= 40:
    print("Grade:Pass")
else:
    print("Grade:Fail")'''
    
#task16
'''cost = float(input("Enter the cost price of bike:"))
if cost > 100000:
    tax = 0.15
elif cost > 50000:
    tax = 0.10
else:
    tax = 0.05
print("The road tax to be paid is:", cost * tax)'''


#task17
'''years = int(input("Enter years of service:"))
if years > 10:
    bonus = 0.10
elif years >= 6:
    bonus = 0.08
else:
    bonus = 0.05
print("The bonus percentage is:", bonus * 100, "%")'''

#task18
'''score = int(input("Enter your subject score: "))
if score > 90:
    print("Congratulations! Great job!")
elif score >= 50:
    print("You did okay, but try to improve.")
else:
    print("You should retake the course to build a stronger foundation.")'''
    
    #task19
'''age = int(input("Enter your age: "))
if age >= 18:
    has_degree = input("Do you have a degree? (yes/no): ")
    if has_degree == "yes":
        experience = int(input("Enter your work experience in years: "))
        if experience > 3:
            print("Highly Eligible")
        elif experience >= 1:
            print("Eligible")
        else:
            print("Under Review")
    else:
        print("Not Eligible (degree required)")
else:
    print("Not Eligible (must be at least 18)")'''
    
#task20
'''age = int(input("Enter your age: "))
gender = input("Enter your gender (M/F): ")
days = int(input("enter number of working days:"))
if age >= 18 and age < 30:
    if gender == "M":
        wage = 700
    else:
        wage = 750
elif age >= 30 and age <= 40:
    if gender == "M":
        wage = 800
    else:
        wage = 850
else:
    wage = 0
if wage == 0:
    print("invalid age for wage calculation.")
else:
    print("Total wage:", wage * days)
if wage==0:
        print("invalid age for wage calculation.")
else:
        print("Total wage:",wage*days)'''
        
        #task21
        # Simple ATM Program
# Card is valid, PIN = 123, Balance = 50000
is_valid = True
balance = 50000
correct_pin = 123

'''if is_valid:
    pin = int(input("Enter PIN: "))
    if pin == correct_pin:
        print("\nATM Menu")
        print("1. Withdraw")
        print("2. Check Balance")
        print("3. Exit")
        choice = int(input("Choose option: "))
        if choice == 1:
            amount = int(input("Enter amount: "))
            if amount <= balance:
                balance -= amount
                print("Withdrawal successful.")
                print("Remaining balance:", balance)
            else:
                print("Not enough balance.")
        else:
            if choice == 2:
                print("Your balance is:", balance)
            else:
                if choice == 3:
                    print("Thank you for visiting.")
                else:
                    print("Invalid option.")
    else:
        print("Wrong PIN.")
else:
    print("Card not valid.")'''
    
    #task22
'''print("Welcome to the Magic Forest")
direction = input("Do you want to go 'north' or 'south'? ")
if direction == "south":
    print("Game Over")
else:
    if direction == "north":
        choice = input("Do you want to 'cross the river' or 'follow the path'? ")
        if choice == "cross the river":
            print("Game Over")
        else:
            if choice == "follow the path":
                creature = input("Choose: 'fairy', 'ogre', or 'elf': ")
                if creature == "ogre" or creature == "fairy":
                    print("Game Over")
                else:
                    if creature == "elf":
                        print("You Win")
                    else:
                        print("Invalid choice")
            else:
                print("Invalid choice")
    else:
        print("Invalid choice")'''
        
        #task23
print("Welcome to the Haunted House")
choice1 = input("Do you want to go 'upstairs' or 'downstairs'? ")
if choice1 == "downstairs":
    print("Game Over")
else:
    if choice1 == "upstairs":
        choice2 = input("Do you want to 'enter the room' or 'stay outside'? ")
        if choice2 == "enter the room":
            print("Game Over")
        else:
            if choice2 == "stay outside":
                choice3 = input("Choose: 'ghost', 'vampire', or 'werewolf': ")
                if choice3 == "ghost" or choice3 == "vampire":
                    print("Game Over")
                else:
                    if choice3 == "werewolf":
                        print("You Win")
                    else:
                        print("Invalid choice")
            else:
                print("Invalid choice")
    else:
        print("Invalid choice")