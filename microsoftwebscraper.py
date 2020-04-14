import smtplib, ssl
from bs4 import BeautifulSoup as bs
import re
import urllib.request
import requests
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

url="https://www.fool.com/quote/nasdaq/microsoft/msft/"
page= requests.get(url)
soup = bs(page.content, 'html.parser')

server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
server.connect('smtp.gmail.com', '465')
server.login("stockpricenotifications@gmail.com", "pricenotifications")
sender_email="Stockpricenotifications@gmail.com"
receiver_email="dstoner05@gmail.com"


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


mydiv= soup.find("div", attrs={"class" : "price-container"}).find('span')
posneg= soup.find('span', class_="price-pos")
spans = soup.find('span', class_="price-change-percent")
while True:
    price=mydiv.string
    price1=re.findall("\d+\.\d+", price)
    price2=price1[0]
    price3=float(price2)

    if price3 < 135:
        server.send_message(msg3)
        print(price)
        break
    
    pricechange1=spans.text
    pricechange2=re.findall("\d+\.\d+", pricechange1)
    pricechange3=pricechange2[0]
    pricechange4=float(pricechange3)
    
    if pricechange4 > 4 and posneg != None:
        server.send_message(msg2)
        print(pricechange4, "Positive")
        break

    elif pricechange4 > 4 and posneg == None:
        server.send_message(msg4)
        print(pricechange4, "Negative")
        break
