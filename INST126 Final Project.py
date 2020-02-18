import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

#opens the csv file and allows access to the data
applestock = pd.read_csv("C:\\Users\\dston\\downloads\\apple.csv")


#removes the rows where there is at least 1 column empty (incomplete data) this data will be used for charts
applestock_nonull=applestock.dropna()

#prints different statistics for each column statistics can show main imformation for each category
apple1 = applestock_nonull['open'].describe()
apple2 = applestock_nonull['high'].describe()
apple3 = applestock_nonull['low'].describe()
apple4 = applestock_nonull['close'].describe()
apple5 = applestock_nonull['volume'].describe()
print(apple1, apple2, apple3, apple4, apple5)

#prints a scatter plot of the values of the open prices vs the year
x = applestock_nonull ['year']
y = applestock_nonull ['open']
plt.scatter(x, y, label="stars", color= "blue", marker="*", s=30)
plt.title("Year vs Open prices")
plt.xlabel("Year")
plt.ylabel("Open Price")
plt.legend()
plt.show()

#prints a scatter plot of the values of the closing prices vs the year
x = applestock_nonull ['year']
y = applestock_nonull ['close']
plt.scatter(x, y, label="stars", color= "red", marker="*", s=30)
plt.title("Year vs close prices")
plt.xlabel("Year")
plt.ylabel("Close Price")
plt.legend()
plt.show()

#prints a scatter plot of the values of the open prices vs the closing prices
x = applestock_nonull ['open']
y = applestock_nonull ['close']
plt.scatter(x, y, label="stars", color= "orange", marker="*", s=30)
plt.title("Open prices vs close prices")
plt.xlabel("Open Price")
plt.ylabel("Close Price")
plt.legend()
plt.show()

#prints a scatter plot of the values of the volume vs the month
x = applestock_nonull ['month']
y = applestock_nonull ['volume']
plt.scatter(x, y, label="stars", color= "green", marker="*", s=30)
plt.title("Month vs Volume")
plt.xlabel("Month")
plt.ylabel("Volume")
plt.legend()
plt.show()

#prints a scatter plot of the high and low values
x = applestock_nonull ['high']
y = applestock_nonull ['low']
plt.scatter(x, y, label="stars", color= "purple", marker="*", s=30)
plt.title("High prices vs low prices")
plt.xlabel("High Price")
plt.ylabel("Low Price")
plt.legend()
plt.show()




#group average values for high,low,open,close,volume by month
applestock_bymonth= applestock.groupby('month', as_index= False).mean()

#Open price vs month
x = applestock_bymonth['month']
y = applestock_bymonth['open']
plt.bar(x, y)
plt.title("Average Open price by month")
plt.xlabel("Month")
plt.ylabel("Open Price")

#Close price vs month
x = applestock_bymonth['month']
y = applestock_bymonth['close']
plt.bar(x, y)
plt.title("Average closing price by month")
plt.xlabel("Month")
plt.ylabel("Closing Price")

#High price vs month
x = applestock_bymonth['month']
y = applestock_bymonth['high']
plt.bar(x, y)
plt.title("Average High price by month")
plt.xlabel("Month")
plt.ylabel("High Price")

#low price vs month
x = applestock_bymonth['month']
y = applestock_bymonth['low']
plt.bar(x, y)
plt.title("Average Low price by month")
plt.xlabel("Month")
plt.ylabel("Low Price")

#Volume vs month
x = applestock_bymonth['month']
y = applestock_bymonth['volume']
plt.bar(x, y)
plt.title("Average volume by month")
plt.xlabel("Month")
plt.ylabel("Volume")





#group average values for high,low,open,close,volume by year
applestock_byyear = applestock.groupby('year', as_index= False).mean()

#Open price vs year
x = applestock_byyear['year']
y = applestock_byyear['open']
plt.plot(x, y)
plt.title("Average Open price by year")
plt.xlabel("Year")
plt.ylabel("Open Price")
plt.show()

#Close price vs year
x = applestock_byyear['year']
y = applestock_byyear['close']
plt.plot(x, y)
plt.title("Average closing price by year")
plt.xlabel("Year")
plt.ylabel("Closing Price")
plt.show()

#High price vs year
x = applestock_byyear['year']
y = applestock_byyear['high']
plt.plot(x, y)
plt.title("Average high price by year")
plt.xlabel("Year")
plt.ylabel("High Price")
plt.show()

#Low price vs year
x = applestock_byyear['year']
y = applestock_byyear['low']
plt.plot(x, y)
plt.title("Average low price by year")
plt.xlabel("Year")
plt.ylabel("Low Price")
plt.show()

#Volume vs year
x = applestock_byyear['year']
y = applestock_byyear['volume']
plt.plot(x, y)
plt.title("Average volume by year")
plt.xlabel("Year")
plt.ylabel("Volume")
plt.show()