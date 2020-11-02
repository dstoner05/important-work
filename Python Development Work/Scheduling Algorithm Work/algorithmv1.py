import pygame
import sys
from pygame.locals import *
import csv
import pandas as pd
import statistics as s
import random as r

    
num_cars = int(input("How many cars do you want to try to fit the reservations into " ))
num_slots = 100
num_res = int(input(" How many People are reserving?"))
y = int(input("How many hours in advance can people book? (48 max)"))
z = int(input("How many hours can people reserve a car for? (max 24)"))

st = []
nh = []   
index = []
car_type = ['a','b','c','d']
ct =[]
# sc = []



pygame.init()
BLACK =   (0,   0,   0)
WHITE = (255, 255, 255)
BLUE =   (73,   124, 150)
GREEN =   (0, 153,   76)
PINK =   (200,   155,   200)
GRAY = (200, 200, 200)
LIGHT_BLUE =(102, 178, 255)
LIGHT_GREEN = (150, 220, 179)
YELLOW = (255,255,0)
width= 1920
height = 1080

screen = pygame.display.set_mode((width,height))
pygame.display.set_caption("Rental Request Sort")


for i in range(num_res):
    car_type1 = r.choice(car_type)
    start_time = r.randint(1,(y))
    num_hours = r.randint(1,(z))
    st.append(start_time)
    nh.append(num_hours)
    index.append(i)
    ct.append(car_type1)


dat = pd.DataFrame(
{'Start': st,
    'Number_hours' : nh,
    'ID' : index,
    'Type' : ct
    # 'Slot_color' : sc: 
})


df=dat.sort_values(by =['Start', 'Number_hours'])



columns= ["ABCD","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
df1 = pd.read_csv("test.csv", usecols= columns)
df2 = pd.read_csv("test.csv", usecols= columns)

grid = []
for row in range(num_res):
    grid.append([])
    for column in range(num_slots):
        grid[row].append(0)
    
def __main__():
    total_scheduled = 0
    clock = pygame.time.Clock()
    MARGIN = 5
    pygame.display.update()
    clock.tick(60)
    WIDTH = 15
    HEIGHT = 10
    screen.fill(WHITE)
    
  
    for row in range(num_cars):
        color = GRAY
        for column in range(num_slots):
            pygame.draw.rect(screen,
                            color,
                           [(MARGIN + WIDTH) * column + MARGIN,
                           (MARGIN + HEIGHT) * row + MARGIN,
                           WIDTH,
                           HEIGHT])
            
      
    font = pygame.font.SysFont("Arial",10)
    count = 0
    count1= -1
    for i in range (num_res):
        count += 1    
        
        # screen.blit(font.render(str(df1.iloc[i,0]),True,(0,0,0)),((MARGIN +4 ) * 1 ,(((HEIGHT + MARGIN) * count)+5) * 1 ))
        screen.blit(font.render(str(count),True,(0,0,0)),((MARGIN +4 ) * 1 ,(((HEIGHT + MARGIN) * count)+5) * 1 ))
        for x in range(num_slots):
            count1 +=1 
            screen.blit(font.render(str(count),True,(0,0,0)),(((MARGIN +WIDTH ) * count)+10 ,(((HEIGHT ) * 1)-5) * 1 ))
   
    for i in range(num_res):
        

        Start_Slot = df.iloc[i,0]
        Number_of_Slots = df.iloc[i,1]
        Res_ID = df.iloc[i,2]
        car_ID = df.iloc[i, 3]
        car_letter = df1.iloc[i, 0]
        #print(car_letter)
        for Cars in range (1,num_cars): #resources to schedule
            if df1.iloc[Cars,Start_Slot] == 0:
            #if df1.iloc[Cars,Start_Slot] == 0:
                Success = True
                for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                    #print   (df1.iloc[Cars,car_slots])
                    if df1.iloc[Cars,car_slots] !=0:
                        Success = False
                        break
    
                if Success == True:
     
                    total_scheduled += 1
                    Success = True
                    #print (Success) #Yes, I can Schedule this Car
                    car_color = BLUE
                    #print ("ResID: ", Res_ID,"Iteration: ", Cars, " car_slots_current: " ,Start_Slot, " Car Slot Color Previous: " , df2.iloc[Cars,Start_Slot - 1])
                    if Cars % 2 == 0:
                        car_color = BLUE #LIGHT_BLUE
                        if car_slots > 0 and df2.iloc[Cars,Start_Slot - 1] == 1:
                            car_color = PINK  #2                      
                    else:
                        car_color = GREEN # LIGHT_GREEN
                        if car_slots > 0 and df2.iloc[Cars,Start_Slot - 1] == 3:
                            car_color = LIGHT_GREEN #4

                            
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        
                        df1.iloc[Cars,car_slots] = Res_ID
                        if car_color == BLUE:
                            df2.iloc[Cars,car_slots] = 1
                        elif car_color == PINK:
                            df2.iloc[Cars,car_slots] = 2
                        elif car_color == GREEN:
                            df2.iloc[Cars,car_slots] = 3
                        elif car_color == LIGHT_GREEN:
                            df2.iloc[Cars,car_slots] = 4
 
                    pygame.draw.rect(screen,
                                        car_color,
                                        [(MARGIN + WIDTH) * Start_Slot + MARGIN,
                                        (MARGIN + HEIGHT) * Cars + MARGIN,
                                        ((WIDTH* Number_of_Slots ) + (MARGIN * Number_of_Slots) - MARGIN ),
                                        HEIGHT])
                    screen.blit(font.render(str(Res_ID),True,(0,0,0)),((MARGIN + WIDTH) * car_slots + MARGIN ,(MARGIN + HEIGHT) * Cars + MARGIN))
                        
                        
                    break
                else:
                    pass
                        #print (Success) #No, I cannot Schedule this car
    
    
    
    print(df)
    print("Total number of people successfully scheduled:" , total_scheduled)   
    df.to_csv('dump.csv')
                  
         ######Take program out of while loop... it is currently running indefinitely
    while True:
      
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit(); sys.exit()
                
        pygame.display.flip()                    
                
    
        
        

            

if __name__ == "__main__":
    __main__()