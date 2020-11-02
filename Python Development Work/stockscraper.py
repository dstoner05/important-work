import smtplib, ssl
import time
from bs4 import BeautifulSoup as bs
import re
import urllib.request
import requests
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import matplotlib.pyplot as plt
import numpy as np

#calls the server and allows program to notify changes#
server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
server.connect('smtp.gmail.com', '465')
server.login("stockpricenotifications@gmail.com", "pricenotifications")
sender_email="Stockpricenotifications@gmail.com"
receiver_email="dstoner05@gmail.com"

#List of various messages#
msg=MIMEMultipart()
msg['From']="Stockpricenotifications@gmail.com"
msg['To']="dstoner05@gmail.com"
msg['Subject']="Large Price Jump in Everi!"
msg.attach(MIMEText( "Check it out! https://www.fool.com/quote/nyse/everi-holdings-inc/evri/"))

msg1=MIMEMultipart()
msg1['From']="Stockpricenotifications@gmail.com"
msg1['To']="dstoner05@gmail.com"
msg1['Subject']="Large Price Drop in Everi!"
msg1.attach(MIMEText( "Check it out! https://www.fool.com/quote/nyse/everi-holdings-inc/evri/"))

msg2=MIMEMultipart()
msg2['From']="Stockpricenotifications@gmail.com"
msg2['To']="dstoner05@gmail.com"
msg2['Subject']="Large Price Jump in Microsoft!"
msg2.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/microsoft/msft/"))

msg3=MIMEMultipart()
msg3['From']="Stockpricenotifications@gmail.com"
msg3['To']="dstoner05@gmail.com"
msg3['Subject']="Buy Microsoft Now!"
msg3.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/microsoft/msft/"))

msg4=MIMEMultipart()
msg4['From']="Stockpricenotifications@gmail.com"
msg4['To']="dstoner05@gmail.com"
msg4['Subject']="Large Price Drop in Microsoft!"
msg4.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/microsoft/msft/"))

msg5=MIMEMultipart()
msg5['From']="Stockpricenotifications@gmail.com"
msg5['To']="dstoner05@gmail.com"
msg5['Subject']="Buy in to Everi!"
msg5.attach(MIMEText( "Check it out! https://www.fool.com/quote/nyse/everi-holdings-inc/evri/"))

msg6=MIMEMultipart()
msg6['From']="Stockpricenotifications@gmail.com"
msg6['To']="dstoner05@gmail.com"
msg6['Subject']="Buy in to ARCT!"
msg6.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/arcturus-therapeutics-holdings/arct/"))

msg7=MIMEMultipart()
msg7['From']="Stockpricenotifications@gmail.com"
msg7['To']="dstoner05@gmail.com"
msg7['Subject']="Large Price Jump in ARCT!"
msg7.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/arcturus-therapeutics-holdings/arct/"))

msg8=MIMEMultipart()
msg8['From']="Stockpricenotifications@gmail.com"
msg8['To']="dstoner05@gmail.com"
msg8['Subject']="Large Price Drop in ARCT!"
msg8.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/arcturus-therapeutics-holdings/arct/"))

#First stock to be monitored#
url="https://www.fool.com/quote/nasdaq/microsoft/msft/"
page= requests.get(url)
soup = bs(page.content, 'html.parser')

mydiv= soup.find("div", attrs={"class" : "price-container"}).find('span')
posneg= soup.find('span', class_="price-pos")
spans = soup.find('span', class_="price-change-percent")

#second stock to be monitored#
url1="https://www.fool.com/quote/nyse/everi-holdings-inc/evri/"
page1= requests.get(url1)
soup1 = bs(page1.content, 'html.parser')

mydiv1= soup1.find("div", attrs={"class" : "price-container"}).find('span')
posneg1= soup1.find('span', class_="price-pos")
spans1 = soup1.find('span', class_="price-change-percent")

#third stock to be monitored#
url2="https://www.fool.com/quote/nasdaq/arcturus-therapeutics-holdings/arct/"
page2= requests.get(url2)
soup2 = bs(page2.content, 'html.parser')

mydiv2= soup2.find("div", attrs={"class" : "price-container"}).find('span')
posneg2= soup2.find('span', class_="price-pos")
spans2 = soup2.find('span', class_="price-change-percent")

#looping over all urls to find values and monitor them#
while True:
    price=mydiv.string
    price1=re.findall("\d+\.\d+", price)
    price2=price1[0]
    price3=float(price2)
    pricechange1=spans.text
    pricechange2=re.findall("\d+\.\d+", pricechange1)
    pricechange3=pricechange2[0]
    pricechange4=float(pricechange3)

    cost=mydiv1.string
    cost1=re.findall("\d+\.\d+", cost)
    cost2=cost1[0]
    cost3=float(cost2)
    costchange1=spans1.text
    costchange2=re.findall("\d+\.\d+", costchange1)
    costchange3=costchange2[0]
    costchange4=float(costchange3)

    a=mydiv2.string
    a1=re.findall("\d+\.\d+", a)
    a2=a1[0]
    a3=float(a2)
    achange1=spans2.text
    achange2=re.findall("\d+\.\d+", achange1)
    achange3=achange2[0]
    achange4=float(achange3)

    
    def timedprinter():
        print("Mircrosoft's Price is now" , price, "!")
        print("Everi's Price is now" , cost, "!")
        print("ARCT's Price is now" , a, "!")
        time.sleep(60)

    #for loop prevents while loop from stopping after notification is sent#
    for price in price:

        if price3 < 135:
            server.send_message(msg3)
            print("Microsoft's Price is ", price)
            break
    
        if pricechange4 > 4 and posneg != None:
            server.send_message(msg2)
            print("microsoft has increased by ", pricechange4, "percent")
            break

        elif pricechange4 > 4 and posneg == None:
            server.send_message(msg4)
            print("microsoft has decreased by ", pricechange4, "percent")
            break

    #for loop prevents while loop from stopping after notification is sent#
    for cost in cost:

        if cost3 < 3.5:
            server.send_message(msg5)
            print("Everi's Price is ", cost)
            break
    
        if costchange4 > 4 and posneg1 != None:
            server.send_message(msg)
            print("Everi's Price increased by " ,costchange4, "Percent")
            break

        elif costchange4 > 4 and posneg1 == None:
            server.send_message(msg1)
            print("Everi's Price decreased by " ,costchange4, "Percent")
            break

    #for loop prevents while loop from stopping after notification is sent#
    for a in a:

        if a3 < 13:
            server.send_message(msg6)
            print("ARCT's Price is " , a)
            break
    
        if achange4 > 4 and posneg2 != None:
            server.send_message(msg7)
            print("ARCT's price increased by " ,achange4, "percent")
            break

        elif achange4 > 4 and posneg2 == None:
            server.send_message(msg8)
            print("ARCT's price decreased by " ,achange4, "percent")
            break
    
    timedprinter()

    #allows the user to manually break the while loop#
    input1=input("type 'break' to end ")
    if input1 == "break":
        break
