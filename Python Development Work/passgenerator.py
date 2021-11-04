import random 
import string


class Password:
    def __init__(self):
        self.charlength = int(input("Type the number of characters you want your random password to be: "))
        self.charlist = []
        self.passstring = ""
        self.randomnumlist = []

    def function(self):
        for i in range(0,3):
            indexnum = random.randint(0,self.charlength)
            self.randomnumlist.append(indexnum)

        self.randomnumlist.sort(reverse = True)


        for i in range(0, self.charlength-self.randomnumlist[0]):
            newletter = chr(random.randint(65,90))
            self.charlist.append(newletter)

        for i in range(self.charlength-self.randomnumlist[0], self.charlength-self.randomnumlist[1]):
            newlowerletter = chr(random.randint(97,122))
            self.charlist.append(newlowerletter)

        for i in range(self.charlength-self.randomnumlist[1], self.charlength-self.randomnumlist[2]):
            newnumber = random.randint(0,9)
            self.charlist.append(str(newnumber))

        for i in range(self.charlength-self.randomnumlist[2], self.charlength):
            newspecialchar = chr(random.randint(33,152))
            self.charlist.append(newspecialchar)

        random.shuffle(self.charlist)
        print(self.passstring.join(self.charlist))
        return self.passstring.join(self.charlist)
        
            
def __main__():
    run = Password()
    run.function()

if __name__ == "__main__":
    __main__()