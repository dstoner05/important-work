
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

num_cars = 40

num_res = 100
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
s = []
s1 = []



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
    s.append('0')
    
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
    s1.append('0')
# print(s)
    
# print(st, nh, index, ct, g)


dat = pd.DataFrame({'Start': st,
    'Number_hours' : nh,
    'ID' : index,
    'Type' : ct, 
    'Garage' : g,
    'Status' : s})



second_dataset = pd.DataFrame({'Start': st1,
     'Number_hours' : nh1,
     'ID' : index1,
     'Type' : ct1,
     'Garage' : g1,
     'Status' : s})

data_chart=dat.sort_values(by =['Start', 'Number_hours'])
data_chart2 = second_dataset.sort_values(by = ['Start', 'Number_hours'])   


# print(Start_Slot)
# print(Number_of_Slots)


columns = []
count = 1
for number in range(number_hours):
    count +=1
    columns.append(count)
    
for num in range(num_res):
    car_type2 = r.choice(car_type)
    ct1.append(car_type2)
    df1 = pd.DataFrame ({
        "ABCD": ct1
    })
    df2 = pd.DataFrame ({
        "ABCD" : ct1
    })
    
for col in range(count):
    df1[col] = -1
    df2[col] = 0
    
    
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

    # #print(NUM_CARS_TEXT)
    # user_text1 = ''
    # user_text2 = ''
    # user_text3 = ''
    # user_text4 = ''
    # user_text5 = ''
    
    
    
    
    font = pygame.font.SysFont("Arial",10)
    font1 = pygame.font.SysFont("Arial", 18)
    font2 = pygame.font.SysFont("Arial", 12)
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
    
    count = 0
    count1= -1
    for i in range (num_res):
        count += 1    
        
 
        screen.blit(font.render(str(count),True,(0,0,0)),(((MARGIN +4 ) * 1 )+200,(((HEIGHT + MARGIN) * count)+5) * 1 ))
        for i in range(number_hours):
            count1 +=1 
            screen.blit(font.render(str(count),True,(0,0,0)),((((MARGIN +WIDTH ) * count)+10 )+200,(((HEIGHT ) * 1)-5) * 1 ))
    
    total_slots = number_hours * num_cars
            
    state = True
    def function():
        col_list= ['Start', 'Number_hours', 'ID', 'Type', 'Garage', 'Status']
        df = pd.read_csv("algorithm.csv", usecols= col_list)
        df.style.hide_index()
        
        
        second_df = second_dataset.sort_values(by = ['Start', 'Number_hours'])
        
            
          
        def schedule_Res(index):
            scheduled = 0  
            Success = False
            Start_Slot = df.iloc[index,0]
            Number_of_Slots = df.iloc[index,1]
            Res_ID = df.iloc[index,2]
        
            for Cars in range (1,num_cars): #resources to schedule
                if df1.iloc[Cars,Start_Slot] == -1:
                    Success = True
                    #print (df8.iloc[Cars])
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        # print   (df8.iloc[Cars,car_slots])
                        if df1.iloc[Cars,car_slots] !=-1:
                            Success = False
                            break
                    if Success == True:
                        
                        scheduled += 1
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
                            
                            df1.iloc[Cars , car_slots] = Res_ID
                            df.iloc[index, 5] = "1"
                            # scheduled+=1
                            # count_num += 1
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
                        pygame.time.delay(50)
                        pygame.display.update()
                        
                        
                        break
                    elif Success == False:
                        pass
            # print ("Outside for cars loop")
            return Success
            
        def check_conflict(index):
            Start_Slot = df.iloc[index,0]
            Number_of_Slots = df.iloc[index,1]
            for Cars in range (1,num_cars): #resources to schedule
                if df1.iloc[Cars,Start_Slot] == -1:
                #if df1.iloc[Cars,Start_Slot] == 0:
                    
                    Success = True
                    # print (df1.iloc[Cars, :])
                    #print (df1.iloc[Cars])
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        # print   (df1.iloc[Cars,car_slots])
                        if df1.iloc[Cars,car_slots] !=-1:
                            Success = False
                            
                            return True
                    if Success == True:
                        pass
                else:
                    
                    return True    
            return False #no conflict found
                            #print (Success) #No, I cannot Schedule this car
            
            
            
            
            
            
            # Success = True
            # for i in range(1,num_res):
            #     Res_ID = df.iloc[i,2]
                
            #     for cols in range(1, number_hours):
            #         for each_col in df.iloc[: , cols]:
            #             if each_col != 0 and df.iloc[i,5] ==0:
            #                 schedule_Res(i)
            #                 df.iloc[i, 5] == 1
            #                 Success == True
            #             else:
            #                 Success == False
            #                 pass
            
        def get_next_req(res_index):  
            # print ("Inside get_next_req")
            for i in range(res_index,(num_res)):
                if df.iloc[i,5] == 0:
                    # print (i)
                    return i
                
            return -1
        res_index = 0
        
        
        schedule_Res(1)
        # print ("Before While Loop")
        # print(df1)
        total_scheduled = 0
        while res_index<=num_res:
            
            res_index += 1
            i = get_next_req(res_index )
           
            if i == -1:
                break
            # print ("Next Request to Schedule: ",i)
            if check_conflict(i):
                # schedule_Res(df.iloc[i])
                if schedule_Res(i):
                    df.iloc[i, 5] = "1"
                    res_index = 0
                    total_scheduled +=1 
                else:
                    df.iloc[i, 5] = "-1"
                # res_index = 1
        print("Total Scheduled:", total_scheduled)   
        df.to_csv("dump.csv")       
                
        
        
        

    
    def sec_dataset():
        sec_dataset.failure_count = 0
        col_list= ['Start', 'Number_hours', 'ID', 'Type', 'Garage', 'Status']
        df = pd.read_csv("algorithm.csv", usecols= col_list)
        second_df = pd.read_csv("algorithm1.csv", usecols = col_list)
        t = df.append(second_df)
        
        result = t.sort_values(by = ['Start', ('Number_hours' = desc)])
        print(df)
        print(second_df)
        print(result)
        columns = []
        count = 1
        for number in range(number_hours):
            count +=1
            columns.append(count)
            
        for num in range(num_res):
            car_type2 = r.choice(car_type)
            ct1.append(car_type2)
            df8 = pd.DataFrame ({
                "ABCD": ct1
            })
            df9 = pd.DataFrame ({
                "ABCD" : ct1
            })
            
        for col in range(count):
            df8[col] = -1
            df9[col] = 0
    
        count = 0
        count1= -1
        
        for i in range ( (num_res * 2) ):
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
            for i in range (num_res*2):
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
        
        
            
        sec_dataset.sort_count = 0
        def schedule_Res(index):
            
            scheduled = 0  
            Success = False
            Start_Slot = result.iloc[index,0]
            Number_of_Slots = result.iloc[index,1]
            Res_ID = result.iloc[index,2]
        
            for Cars in range (1,num_cars): #resources to schedule
                if df8.iloc[Cars,Start_Slot] == -1:
                    Success = True
                    #print (df8.iloc[Cars])
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        # print   (df8.iloc[Cars,car_slots])
                        if df8.iloc[Cars,car_slots] !=-1:
                            Success = False
                            break
                    if Success == True:
                        sec_dataset.sort_count +=1 
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
                            
                            df8.iloc[Cars , car_slots] = Res_ID
                            result.iloc[index, 5] = "1"
                            
                            # scheduled+=1
                            # count_num += 1
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
                        screen.blit(font.render(str(Res_ID),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+190,(MARGIN + HEIGHT) * Cars + MARGIN))
                        screen.blit(font2.render(str(":  "),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+205 ,(MARGIN + HEIGHT) * Cars + MARGIN))
                        screen.blit(font.render(str(sec_dataset.sort_count),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+212 ,(MARGIN + HEIGHT) * Cars + MARGIN))
                        pygame.time.delay(50)
                        pygame.display.update()
                        
                        
                        break
                    elif Success == False:
                        pass
            # print ("Outside for cars loop")
            if Success == False:
                for car_slots in range(Start_Slot, Start_Slot+Number_of_Slots):
                    
                    pygame.draw.rect(screen,
                                    PINK,
                                    [((MARGIN + WIDTH) * Start_Slot + MARGIN)+200,
                                    (MARGIN + HEIGHT) * (num_cars + sec_dataset.failure_count) + 20  + MARGIN,
                                    ((WIDTH* Number_of_Slots ) + (MARGIN * Number_of_Slots) - MARGIN ),
                                    HEIGHT])
                    screen.blit(font.render(str(Res_ID),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+200 ,(MARGIN + HEIGHT) * (num_cars + sec_dataset.failure_count) + 20  + MARGIN))
                    
                    screen.blit(font2.render(str(":  "),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+205 ,(MARGIN + HEIGHT) * (num_cars + sec_dataset.failure_count) + 20   + MARGIN))
                    screen.blit(font.render(str(sec_dataset.sort_count),True,(0,0,0)),(((MARGIN + WIDTH) * car_slots + MARGIN)+212 ,(MARGIN + HEIGHT) * (num_cars + sec_dataset.failure_count) + 20  + MARGIN))
                    
                sec_dataset.failure_count+=1
            return Success
            
        def check_conflict(index):
            
            Start_Slot = result.iloc[index,0]
            Number_of_Slots = result.iloc[index,1]
            for Cars in range (1,num_cars): #resources to schedule
                if df8.iloc[Cars,Start_Slot] == -1:
                #if df1.iloc[Cars,Start_Slot] == 0:
                    
                    Success = True
                    # print (df1.iloc[Cars, :])
                    #print (df1.iloc[Cars])
                    for car_slots in range (Start_Slot,Start_Slot+Number_of_Slots):
                        # print   (df1.iloc[Cars,car_slots])
                        if df8.iloc[Cars,car_slots] !=-1:
                            Success = False
                            
                            return True
                    if Success == True:
                        pass
                else:
                    
                    return True    
            return False #no conflict found
                            #print (Success) #No, I cannot Schedule this car
            
            
            
            
            
            
            # Success = True
            # for i in range(1,num_res):
            #     Res_ID = df.iloc[i,2]
                
            #     for cols in range(1, number_hours):
            #         for each_col in df.iloc[: , cols]:
            #             if each_col != 0 and df.iloc[i,5] ==0:
            #                 schedule_Res(i)
            #                 df.iloc[i, 5] == 1
            #                 Success == True
            #             else:
            #                 Success == False
            #                 pass
            
        def get_next_req(res_index):  
            
            # print ("Inside get_next_req")
            for i in range(res_index, ((num_res*2))):
                if result.iloc[i,5] == 0:
                    # print (i)
                    return i
                
            return -1
        res_index = 0
        
        print(df8)
        schedule_Res(0)
        print(df8)
        # print ("Before While Loop")
        # print(df1)
        total_scheduled = 0
        print(result)
        while res_index<=num_res:
            
            res_index += 1
            i = get_next_req(res_index )
           
            if i == -1:
                break
            # print ("Next Request to Schedule: ",i)
            if check_conflict(i):
                # schedule_Res(df.iloc[i])
                if schedule_Res(i):
                    result.iloc[i, 5] = "1"
                    res_index = 0
                    total_scheduled +=1 
                else:
                    result.iloc[i, 5] = "-1"
                # res_index = 1
        print("Total Scheduled:", total_scheduled)   
        print("Total failed:", sec_dataset.failure_count)
        result.to_csv("dump.csv")       
                





    col_list= ['Start', 'Number_hours', 'ID', 'Type', 'Garage', 'Status']
    while True:
        # active = False
        # active1 = False
        # active2 = False
        # active3 = False
        pygame.display.update()
        
        
            
        text_surface = font1.render(NUM_CARS_TEXT1, True, BLACK)
        # surface = font1.render(NUM_CARS_TEXT2, True, BLACK)
        # surface1 = font1.render(NUM_CARS_TEXT3, True, BLACK)
        screen.blit(text_surface, (input_rect1.x +25, (input_rect1.y) + 75))
        # screen.blit(surface, (input_rect1.x +5, ((input_rect1.y) + 5+(18))))
        # screen.blit(surface1, (input_rect1.x +5, ((input_rect1.y) + 5+(18*2))))
            
        
        
        ###############################################################
        
        
        text_surface2 = font1.render(NUM_RES_TEXT1, True, BLACK)
        # s = font1.render(NUM_RES_TEXT2, True, BLACK)
        screen.blit(text_surface2, (input_rect3.x +5, input_rect3.y + 5))
        # screen.blit(s, (input_rect3.x +5, input_rect3.y + 5+18))
        
        

        ################################################################
        
        
        
        text_surface3 = font1.render(y_text1, True, BLACK)
        s1 = font1.render(y_text2, True, BLACK)
        # s2 = font1.render(y_text3, True, BLACK)
        screen.blit(text_surface3, (input_rect4.x +5, input_rect4.y + 5))
        screen.blit(s1, (input_rect4.x +5, input_rect4.y + 5+18))
        # screen.blit(s2, (input_rect4.x +5, input_rect4.y + 5+36))
       
        
        ####################################################################
        
        
        text_surface4 = font1.render(z_text1, True, BLACK)
        s3 = font1.render(z_text2, True, BLACK)
        # s4 = font1.render(z_text3, True, BLACK)
        # s5 = font1.render(z_text4, True, BLACK)
        screen.blit(text_surface4, (input_rect5.x +5, input_rect5.y + 5))
        screen.blit(s3, (input_rect5.x +5, input_rect5.y + 5+18))
        # screen.blit(s4, (input_rect5.x +5, input_rect5.y + 5+36))
        # screen.blit(s5, (input_rect5.x +5, input_rect5.y + 5 +54))

        
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
                        dat.to_csv("algorithm.csv", columns=col_list)
                        second_dataset.to_csv("algorithm1.csv", columns=col_list)
                    if input_rect9.collidepoint(mouse_pos):
                      
                        function()
                        
                        pygame.display.flip() 
                    elif data_button.collidepoint(mouse_pos):
                        dat.to_csv("algorithm.csv", columns=col_list)
                        second_dataset.to_csv("algorithm1.csv", columns=col_list)
                    elif data_button2.collidepoint(mouse_pos):
                        sec_dataset()
                        # second_data()
                    # else:
                    #     print('no')
                        
                    # if input_rect6.collidepoint(mouse_pos):
                    #     function()
                    #     total()
                    #     pygame.display.flip()
                else:
                    pass                   
                    
                    
                    #  input_rect9 = pygame.draw.rect(screen,
                    #  DARK_GRAY,
                    #  [5,
                    #  750,
                    #  195,
                    #  72.5])  
                
           
            
                # print(active, active1, active2, active3)
                    
if __name__ == "__main__":
    __main__()       