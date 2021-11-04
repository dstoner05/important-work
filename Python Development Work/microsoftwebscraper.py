import smtplib, ssl
from bs4 import BeautifulSoup as bs
import re
import urllib.request
import requests
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


class Scraper:
    def __init__(self):

        self.url="https://www.fool.com/quote/nasdaq/microsoft/msft/"
        self.page= requests.get(self.url)
        self.soup = bs(self.page.content, 'html.parser')

        self.server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
        self.server.connect('smtp.gmail.com', '465')
        self.server.login("stockpricenotifications@gmail.com", "pricenotifications")
        self.sender_email="Stockpricenotifications@gmail.com"
        self.receiver_email="dstoner05@gmail.com"


        self.msg2=MIMEMultipart()
        self.msg2['From']="Stockpricenotifications@gmail.com"
        self.msg2['To']="dstoner05@gmail.com"
        self.msg2['Subject']="Large Price Jump in Microsoft!"
        self.msg2.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/microsoft/msft/"))

        self.msg3=MIMEMultipart()
        self.msg3['From']="Stockpricenotifications@gmail.com"
        self.msg3['To']="dstoner05@gmail.com"
        self.msg3['Subject']="Buy Microsoft Now!"
        self.msg3.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/microsoft/msft/"))

        self.msg4=MIMEMultipart()
        self.msg4['From']="Stockpricenotifications@gmail.com"
        self.msg4['To']="dstoner05@gmail.com"
        self.msg4['Subject']="Large Price Drop in Microsoft!"
        self.msg4.attach(MIMEText( "Check it out! https://www.fool.com/quote/nasdaq/microsoft/msft/"))

        print(self.soup)
        self.mydiv= self.soup.find("div", attrs={"class" : "price-container"}).find('span')
        self.posneg= self.soup.find('span', class_="price-pos")
        self.spans = self.soup.find('span', class_="price-change-percent")

    def funct(self):

        while True:
            price=self.mydiv.string
            price1=re.findall("\d+\.\d+", price)
            price2=price1[0]
            price3=float(price2)

            if price3 < 135:
                server.send_message(self.msg3)
                print(self.price)
                break
            
            pricechange1=self.spans.text
            pricechange2=re.findall("\d+\.\d+", pricechange1)
            pricechange3=pricechange2[0]
            pricechange4=float(pricechange3)
            
            if pricechange4 > 4 and self.posneg != None:
                server.send_message(self.msg2)
                print(pricechange4, "Positive")
                break

            elif pricechange4 > 4 and self.posneg == None:
                server.send_message(self.msg4)
                print(pricechange4, "Negative")
                break

def __main__():
    run = Scraper()
    run.funct()

if __name__ == "__main__":
    __main__()
