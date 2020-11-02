import sys 
import json
import re


###opens the file and loads the json data. Runs a for loop to append all tweets to the list called contents.
class Dataset():
    def __init__(self, path):
        self.contents = [] 
        with open (path, encoding = 'utf8') as handle:
            data = json.load(handle)
            for words in data:
                self.contents.append(Tweet(words))          

##defines the time and text of the tweets as Tweet.timestamp and Tweet.text
class Tweet():
    def __init__ (self, item):
        self.timestamp = item['created']
        self.text = item['text']

##opens the dataset as a system argument so the file name can be input as the argument
dataset = Dataset(sys.argv[1])

#opens the main function
def main():
    ##runs a while loop so the contents of the json file can be searched multiple times
    while True:
        search_string = input('Enter a search term or type q to quit: ')

        ##runs a for loop with regular expressions to search the appended list for the matching words, if they are found, it prints the tweet and timestamp
        for tweet in dataset.contents:
            x = (re.search(search_string, tweet.text))
            if x: 
                print(Tweet.text, Tweet.timestamp)
            elif search_string == 'q':
                sys.exit
            

            
if __name__ == '__main__':
        main()



