import pygame
import sys
from pygame.locals import *
import csv
import pandas as pd
import statistics as s
import random as r
import textwrap
    
# num_cars = int(input("How many cars do you want to try to fit the reservations into " ))
# num_res = int(input(" How many People are reserving?"))
# y = int(input("How many hours in advance can people book? (Random Start Time)"))
# z = int(input("How many hours can people reserve a car for? (Random Length of Reservation)"))
# number_hours = int(input("How many hours do you want to be included in the trial? (Chart Width must be larger than the number of hours in advance)"))

num_cars = 39
num_res = 99
y = 50
z = 20
number_hours = 70

st = []
nh = []   
index = []
car_type = ['a','b','c','d']
garage = ['1', '2', '3', '4']
ct =[]
ct1 = []
g = []

st1 = []
nh1 = []
index1 = []
ct2 = []
garage1 = ['1', '2', '3', '4']
g1 = []
s= []

cartype = ['a','a','a','a','a','a','a','a','a','a','b','b','b','b','b','b','b','b','b','b','c','c','c','c','c','c','c','c','c','d','d','d','d','d','d','d','d','d','d']

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
DARK_GRAY = (120,120,120)
DARK_BLUE = (0,0,255)
BLUE2 = (25,10,112)
width= 1700
height = 1080

SIZE = (width, height)

screen = pygame.display.set_mode(SIZE, pygame.RESIZABLE)
pygame.display.set_caption("Rental Request Sort")


for i in range(num_res):
    TYPE_OF_CAR = r.choice(car_type)
    RANDOM_START_TIME = r.randint(1,(y))
    NUMBER_OF_HOURS = r.randint(1,(z))
    garage_type = r.choice(garage)
    st.append(RANDOM_START_TIME)
    nh.append(NUMBER_OF_HOURS)
    index.append(i)
    ct.append(TYPE_OF_CAR)
    g.append(garage_type)
    s.append('-1')

for i in range(num_res):
    TYPE_OF_CAR1 = r.choice(car_type)
    RANDOM_START_TIME1 = r.randint(1,(y))
    NUMBER_OF_HOURS1 = r.randint(1,(z))
    garage_type1 = r.choice(garage1)
    st1.append(RANDOM_START_TIME1)
    nh1.append(NUMBER_OF_HOURS1)
    index1.append(i)
    ct1.append(TYPE_OF_CAR1)
    g1.append(garage_type1)
    
    
    
# print(st, nh, index, ct, g)

dat = pd.DataFrame(
{'Start': st,
    'Number_hours' : nh,
    'ID' : index,
    'Type' : ct, 
    'Garage' : g,
    'Status' : s
})

second_dataset = pd.DataFrame(
    {'Start': st1,
     'Number_hours' : nh1,
     'ID' : index1,
     'Type' : ct1,
     'Garage' : g1,
     'Status' : s
     
})

data_chart=dat.sort_values(by =['Start'])
data_chart2 = second_dataset.sort_values(by = ['Start'])    

columns = []
count = 0
for number in range(number_hours):
    count +=1
    columns.append(count)
    
for num in range(num_res):
    car_type2 = r.choice(car_type)
    ct1.append(car_type2)
    datf1 = pd.DataFrame ({
        "Type": cartype
    })
    datf2 = pd.DataFrame ({
        "Type" : cartype
    })
    
for col in range(count):
    datf1[col] = -1
    datf2[col] = -1
    
df1 = datf1.sort_values(by = ['Type'])
df2 = datf2.sort_values(by = ['Type'])
    
# print(df1)


grid = []
for row in range(num_res):
    grid.append([])
    for column in range(number_hours):
        grid[row].append(0)   
        

def __main__():
    
    NUM_CARS_TEXT1 ='GENERATE DATA'
    NUM_RES_TEXT1 = '99 people reserving'
    y_text1 = 'People can book 50 hours '
    y_text2 = 'in advance'
    z_text1 = 'Length of reservation'
    z_text2 = 'is 20 hours max'

    
    
    font = pygame.font.SysFont("Arial",10)
    font1 = pygame.font.SysFont("Arial", 18)
    clock = pygame.time.Clock()
    MARGIN = 5
    pygame.display.update()
    clock.tick(60)
    WIDTH = 15
    HEIGHT = 10
    screen.fill(WHITE)

    for row in range(num_cars):
        color = GRAY
        for column in range(number_hours):
            pygame.draw.rect(screen,
                            color,
                           [((MARGIN + WIDTH) * column + MARGIN)+200,
                           (MARGIN + HEIGHT) * row + MARGIN,
                           WIDTH,
                           HEIGHT])
            
    input_rect1 = pygame.draw.rect(screen,
                     BLUE,
                     [5,
                     0,
                     195,
                     145])    
    
    input_rect3 = pygame.draw.rect(screen,
                     DARK_GRAY,
                     [5,
                     150,
                     195,
                     145])    
    
    input_rect4 = pygame.draw.rect(screen,
                     DARK_GRAY,
                     [5,
                     300,
                     195,
                     145])    
    
    input_rect5 = pygame.draw.rect(screen,
                     DARK_GRAY,
                     [5,
                     450,
                     195,
                     145])
    input_rect6 = pygame.draw.rect(screen,
                     DARK_GRAY,
                     [5,
                     600,
                     195,
                     145])     
    input_rect9 = pygame.draw.rect(screen,
                     DARK_GRAY,
                     [5,
                     750,
                     195,
                     72.5])  
    data_button = pygame.draw.rect(screen,
                     BLUE2,
                     [5,
                      827.5,
                      195,
                      36.25]) 
    data_button2 = pygame.draw.rect(screen,
                     BLUE2,
                     [5,
                      868.75,
                      195,
                      36.25])  
    Line1 = pygame.draw.rect(screen,
                     BLACK,
                     [205,
                      151,
                      1800,
                      3])   
    Line2 = pygame.draw.rect(screen,
                     BLACK,
                     [205,
                      301,
                      1800,
                      3])   
    Line3 = pygame.draw.rect(screen,
                     BLACK,
                     [205,
                      451,
                      1800,
                      3])   
    
    count = 0
    count1= -1
    
    col_list= ['Start', 'Number_hours', 'ID', 'Type', 'Garage', 'Status']
    df = pd.read_csv("algorithm.csv", usecols= col_list)

    
    for i in range (num_res):
        count += 1    
        # screen.blit(font.render(str(df.iloc[i,0]),True,(0,0,0)),(((MARGIN +4 ) * 1 )+200,(((HEIGHT + MARGIN) * count)+5) * 1 ))    
    
        for i in range(number_hours):
            count1 +=1 
            screen.blit(font.render(str(count),True,(0,0,0)),((((MARGIN +WIDTH ) * count)+10 )+200,(((HEIGHT ) * 1)-5) * 1 ))
    
    total_slots = number_hours * num_cars
            
    state = True
    def function():
        col_list= ['Start', 'Number_hours', 'ID', 'Type', 'Garage', 'Status']
        df = pd.read_csv("algorithm.csv", usecols= col_list)
        

        function.count_num = 0
        
        total_scheduled = 0
        for i in range(num_res):
            Success = False
            Start_Slot = df.iloc[i,0]
            Number_of_Slots = df.iloc[i,1]
            Res_ID = df.iloc[i,2]
            type_of_car = df.iloc [i,3]
            for Cars in range (1,num_cars): #resources to schedule
                if df1.iloc[Cars,Start_Slot] == -1 and df1.iloc[Cars, 0] == type_of_car:
                #if df1.iloc[Cars,Start_Slot] == 0:
                    Success = True
            
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        #print   (df1.iloc[Cars,car_slots])
                        if df1.iloc[Cars,car_slots] !=-1:
                            Success = False
                            break
                    if Success == True:
                    
                        total_scheduled += 1
                        Success = True
                        #print (Success) #Yes, I can Schedule this Car
                        car_color = BLUE
                        if Cars % 2 == 0:
                            car_color = BLUE 
                            if car_slots > 0 and df2.iloc[Cars,Start_Slot - 1] == 1:
                                car_color = PINK  #2                      
                        else:
                            car_color = GREEN 
                            if car_slots > 0 and df2.iloc[Cars,Start_Slot - 1] == 3:
                                car_color = LIGHT_GREEN #4

                                
                        for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                            df1.iloc[Cars,car_slots] = Res_ID
                            function.count_num += 1
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
                                                [((MARGIN + WIDTH) * Start_Slot + MARGIN)+200,
                                                (MARGIN + HEIGHT) * Cars + MARGIN,
                                                ((WIDTH* Number_of_Slots ) + (MARGIN * Number_of_Slots) - MARGIN ),
                                                HEIGHT])
                            screen.blit(font.render(str(Res_ID),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+200 ,(MARGIN + HEIGHT) * Cars + MARGIN))
                        pygame.time.delay(10)
                        pygame.display.update()    
                        break
                    else:
                        pass
                            #print (Success) #No, I cannot Schedule this car
        print("Total number of people successfully scheduled:" , total_scheduled)
        print('Ratio of filled to non-filled slots:', function.count_num/ total_slots)
        num_scheduled = "successfully scheduled"
        text_surface6 = font1.render(str(num_scheduled), True, BLACK)
        text_surface5 = font1.render(str(total_scheduled), True, BLACK)
        screen.blit(text_surface5, (input_rect6.x+5, input_rect6.y +5+18))
        screen.blit(text_surface6, (input_rect6.x +5, input_rect6.y+5))
        
    
    # print(df1)
    
    # print(assigned_slots)
    # print(assigned_slots / total_slots)
    # df.to_csv('dump.csv')
    
    def second_data():
        col_list= ['Start', 'Number_hours', 'ID', 'Type', 'Garage', 'Status']
        df = pd.read_csv("algorithm.csv", usecols= col_list)
        second_df = pd.read_csv("algorithm1.csv", usecols = col_list)
        t = df.append(second_df)
        
        result = t.sort_values(by = ['Start'])
        columns = []
        count = 0
        for number in range(number_hours):
            count +=1
            columns.append(count)
            
        for num in range(num_res):
            car_type2 = r.choice(car_type)
            ct1.append(car_type2)
            datf8 = pd.DataFrame ({
                "Type": cartype
            })
            datf9 = pd.DataFrame ({
                "Type" : cartype
            })
            
        for col in range(count):
            datf8[col] = -1
            datf9[col] = -1

        df8 = datf8.sort_values(by = ['Type'])
        
        df9 = datf9.sort_values(by = ['Type'])
        
        print(result)
        count = 0
        count1= -1
        
        for i in range (num_res * 2 ):
            count += 1    
            
    
            screen.blit(font.render(str(count),True,(0,0,0)),(((MARGIN +4 ) * 1 )+200,(((HEIGHT + MARGIN) * count)+5) * 1 ))
            for i in range(number_hours):
                count1 +=1 
                screen.blit(font.render(str(count),True,(0,0,0)),((((MARGIN +WIDTH ) * count)+10 )+200,(((HEIGHT ) * 1)-5) * 1 ))
        screen.fill(WHITE)
        for row in range(num_cars):
            color = GRAY
            for column in range(number_hours):
                pygame.draw.rect(screen,
                                color,
                                [((MARGIN + WIDTH) * column + MARGIN)+200,
                                (MARGIN + HEIGHT) * row + MARGIN,
                                WIDTH,
                                HEIGHT])
            count = 0
            count1= -1
            for i in range (num_res):
                count += 1    
                
        
                screen.blit(font.render(str(count),True,(0,0,0)),(((MARGIN +4 ) * 1 )+200,(((HEIGHT + MARGIN) * count)+5) * 1 ))
                for i in range(number_hours):
                    count1 +=1 
                    screen.blit(font.render(str(count),True,(0,0,0)),((((MARGIN +WIDTH ) * count)+10 )+200,(((HEIGHT ) * 1)-5) * 1 ))
        input_rect1 = pygame.draw.rect(screen,
                     BLUE,
                     [5,
                     0,
                     195,
                     145])    
    
        input_rect3 = pygame.draw.rect(screen,
                        DARK_GRAY,
                        [5,
                        150,
                        195,
                        145])    
        
        input_rect4 = pygame.draw.rect(screen,
                        DARK_GRAY,
                        [5,
                        300,
                        195,
                        145])    
        
        input_rect5 = pygame.draw.rect(screen,
                        DARK_GRAY,
                        [5,
                        450,
                        195,
                        145])
        input_rect6 = pygame.draw.rect(screen,
                        DARK_GRAY,
                        [5,
                        600,
                        195,
                        145])     
        input_rect9 = pygame.draw.rect(screen,
                        DARK_GRAY,
                        [5,
                        750,
                        195,
                        72.5])  
        data_button = pygame.draw.rect(screen,
                        BLUE2,
                        [5,
                        827.5,
                        195,
                        36.25]) 
        data_button2 = pygame.draw.rect(screen,
                        BLUE2,
                        [5,
                        868.75,
                        195,
                        36.25]) 
        Line1 = pygame.draw.rect(screen,
                     BLACK,
                     [205,
                      151,
                      1800,
                      3])   
        Line2 = pygame.draw.rect(screen,
                        BLACK,
                        [205,
                        301,
                        1800,
                        3])   
        Line3 = pygame.draw.rect(screen,
                        BLACK,
                        [205,
                        451,
                        1800,
                        3])   
        
        count_num1 = 0
        scheduled = 0
        failure_count = 0
        for i in range(num_res * 2):
            Success = False
            Start_Slot = result.iloc[i,0]
            Number_of_Slots = result.iloc[i,1]
            Res_ID = result.iloc[i,2]
            type_of_car = result.iloc [i,3]
            for Cars in range (1,num_cars): #resources to schedule
                if df8.iloc[Cars,Start_Slot] == -1 and df8.iloc[Cars, 0] == type_of_car:
                #if df1.iloc[Cars,Start_Slot] == 0:
                    Success = True
                    #print (df8.iloc[Cars])
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        # print   (df8.iloc[Cars,car_slots])
                        if df8.iloc[Cars,car_slots] !=-1:
                            Success = False
                            break
                    if Success == True:
                        
                        scheduled += 1
                        Success = True
                        #print (Success) #Yes, I can Schedule this Car
                        car_color = BLUE
                        if Cars % 2 == 0:
                            car_color = BLUE 
                            if car_slots > 0 and df9.iloc[Cars,Start_Slot - 1] == 1:
                                car_color = PINK  #2                      
                        else:
                            car_color = GREEN 
                            if car_slots > 0 and df9.iloc[Cars,Start_Slot - 1] == 3:
                                car_color = LIGHT_GREEN #4

                                
                        for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                            df8.iloc[Cars,car_slots] = Res_ID
                            count_num1 += 1
                            if car_color == BLUE:
                                df9.iloc[Cars,car_slots] = 1
                            elif car_color == PINK:
                                df9.iloc[Cars,car_slots] = 2
                            elif car_color == GREEN:
                                df9.iloc[Cars,car_slots] = 3
                            elif car_color == LIGHT_GREEN:
                                df9.iloc[Cars,car_slots] = 4
                          
                        
                        pygame.draw.rect(screen,
                                            car_color,
                                            [((MARGIN + WIDTH) * Start_Slot + MARGIN)+200,
                                            (MARGIN + HEIGHT) * Cars + MARGIN,
                                            ((WIDTH* Number_of_Slots ) + (MARGIN * Number_of_Slots) - MARGIN ),
                                            HEIGHT])
                        screen.blit(font.render(str(Res_ID),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+200 ,(MARGIN + HEIGHT) * Cars + MARGIN))
                        pygame.time.delay(50)
                        pygame.display.update()
                        
                        
                        break
                    elif Success == False:
                        pass
                            #print (Success) #No, I cannot Schedule this car
                else:
                    Success = False
                    #failed to find empty start slot
            if Success == False:
                for car_slots in range(Start_Slot, Start_Slot+Number_of_Slots):
                    pygame.draw.rect(screen,
                                    PINK,
                                    [((MARGIN + WIDTH) * Start_Slot + MARGIN)+200,
                                    (MARGIN + HEIGHT) * (num_cars + failure_count) + 20  + MARGIN,
                                    ((WIDTH* Number_of_Slots ) + (MARGIN * Number_of_Slots) - MARGIN ),
                                    HEIGHT])
                    screen.blit(font.render(str(Res_ID),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+200 ,(MARGIN + HEIGHT) * (num_cars + failure_count) + 20  + MARGIN))
                    screen.blit(font.render(str(type_of_car),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+193 ,(MARGIN + HEIGHT) * (num_cars + failure_count) + 20  + MARGIN))
                failure_count+=1
        # print(df8)
        ratio = (count_num1 )/ total_slots
        print("Total number of people successfully scheduled:" , scheduled)
        print('Ratio of filled to non-filled slots:', ratio)
        print("Number failed =", failure_count)
        
    
     
    while True:
        pygame.display.update()
        
        
            
        text_surface = font1.render(NUM_CARS_TEXT1, True, BLACK)
        screen.blit(text_surface, (input_rect1.x +25, (input_rect1.y) + 75))
            
        ###############################################################
        
        
        text_surface2 = font1.render(NUM_RES_TEXT1, True, BLACK)
        screen.blit(text_surface2, (input_rect3.x +5, input_rect3.y + 5))

        ################################################################
        
        
        
        text_surface3 = font1.render(y_text1, True, BLACK)
        s1 = font1.render(y_text2, True, BLACK)
        screen.blit(text_surface3, (input_rect4.x +5, input_rect4.y + 5))
        screen.blit(s1, (input_rect4.x +5, input_rect4.y + 5+18))
        
        ####################################################################
        
        
        text_surface4 = font1.render(z_text1, True, BLACK)
        s3 = font1.render(z_text2, True, BLACK)
        screen.blit(text_surface4, (input_rect5.x +5, input_rect5.y + 5))
        screen.blit(s3, (input_rect5.x +5, input_rect5.y + 5+18))
        
        ########################################################################
        text = "Click to Run"
        text_surface9 = font1.render(str(text), True, BLUE2)
        screen.blit(text_surface9, (input_rect9.x + 50, input_rect9.y +20))
        
        text1 = "CHANGE DATA"
        ts1 = font1.render(str(text1), True, WHITE)
        screen.blit(ts1, (data_button.x +40, data_button.y +5))
        
        text2 = "Add Second Dataset"
        ts2 = font1.render(str(text2), True, WHITE)
        screen.blit(ts2, (data_button2.x +30, data_button2.y +5))
        
        
        for event in pygame.event.get():
            
            if event.type == pygame.QUIT:
                pygame.quit(); sys.exit()
                
            if event.type == pygame.MOUSEBUTTONDOWN:
                mouse_pos = event.pos
                if state == True:
                    
                    if input_rect1.collidepoint(mouse_pos):
                        data_chart.to_csv("algorithm.csv")
                        data_chart2.to_csv("algorithm1.csv")
                    if input_rect9.collidepoint(mouse_pos):
                      
                        function()
                        
                        pygame.display.flip() 
                    elif data_button.collidepoint(mouse_pos):
                        data_chart.to_csv("algorithm.csv")
                        data_chart2.to_csv("algorithm1.csv")
                    elif data_button2.collidepoint(mouse_pos):
                        second_data()
                    else:
                        print('no')
                        
                else:
                    pass                   
                    
               
                            
                
                # print(active, active1, active2, active3)
                    
if __name__ == "__main__":
    __main__()       
    