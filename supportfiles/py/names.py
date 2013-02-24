import requests, sys, threading, string
from pprint import pprint, pformat
from bs4 import BeautifulSoup as bs4

class HumanPool():
    '''OMG SUPER HYPER MEGA BOOST PIPE'''
    def __init__(self, max):
        self.humans = []
        for x in xrange(max):
            self.humans.append(ThreadableHuman())
        for x in self.humans:
            try:
                x.start()
            except requests.ConnectionError:
                print 'Failed to connect to site'
        for x in self.humans:
            x.join()
        
class ThreadableHuman(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.data = []
    def run(self):
        h = Human()
        self.data = h.data # HERE's THE MAGICK FOLKS!
        
class Human():
    def __init__(self):
        self.raw_data = self.__getData()
        self.data = {}
        self.data['firstname'] = self.raw_data[0]
        self.data['middlename'] = self.raw_data[1]
        self.data['lastname'] = self.raw_data[2]
        self.data['phone'] = self.raw_data[3]
        self.data['website'] = self.raw_data[4]
        self.data['email'] = self.raw_data[5]
        self.data['username'] = self.raw_data[6]
        self.data['password'] = self.raw_data[7]
        self.data['mothersmaidenname'] = self.raw_data[8]
        self.data['birthday'] = self.raw_data[9]
        self.data['creditcardnumber'] = self.raw_data[10]
        self.data['creditcardexpiry'] = self.raw_data[11]
        self.data['creditcardcvv'] = self.raw_data[12]
        self.data['jobtitle'] = self.raw_data[13]
        self.data['jobcompany'] = self.raw_data[14]
        self.data['vehicle'] = self.raw_data[15]
        self.data['bloodtype'] = self.raw_data[16]
        self.data['weight'] = self.raw_data[17]
        self.data['height'] = self.raw_data[18]
        self.data['location'] = self.raw_data[19]
        '''
        self.data['firstname'] = str(self.raw_data[0]).encode('utf8', 'replace')
        self.data['middlename'] = str(self.raw_data[1]).encode('utf8', 'replace')
        self.data['lastname'] = str(self.raw_data[2]).encode('utf8', 'replace')
        self.data['phone'] = str(self.raw_data[3]).encode('utf8', 'replace')
        self.data['website'] = str(self.raw_data[4]).encode('utf8', 'replace')
        self.data['email'] = str(self.raw_data[5]).encode('utf8', 'replace')
        self.data['username'] = str(self.raw_data[6]).encode('utf8', 'replace')
        self.data['password'] = str(self.raw_data[7]).encode('utf8', 'replace')
        self.data['mothersmaidenname'] = str(self.raw_data[8]).encode('utf8', 'replace')
        self.data['birthday'] = str(self.raw_data[9]).encode('utf8', 'replace')
        self.data['creditcardnumber'] = str(self.raw_data[10]).encode('utf8', 'replace')
        self.data['creditcardexpiry'] = str(self.raw_data[11]).encode('utf8', 'replace')
        self.data['creditcardcvv'] = str(self.raw_data[12]).encode('utf8', 'replace')
        self.data['jobtitle'] = str(self.raw_data[13]).encode('utf8', 'replace')
        self.data['jobcompany'] = str(self.raw_data[14]).encode('utf8', 'replace')
        self.data['vehicle'] = str(self.raw_data[15]).encode('utf8', 'replace')
        self.data['bloodtype'] = str(self.raw_data[16]).encode('utf8', 'replace')
        self.data['weight'] = str(self.raw_data[17]).encode('utf8', 'replace')
        self.data['height'] = str(self.raw_data[18]).encode('utf8', 'replace')
        self.data['location'] = str(self.raw_data[19]).encode('utf8', 'replace')
        '''
    
    def help(self):
        print 'Avaliable variables:'
        for x in self.data:
            print x
        print ''
        print "To access use: Human.data['VARIABLE']"
        
    def __getData(self):
        data = []
        r = requests.get('http://www.fakenamegenerator.com/gen-random-us-us.php').text
        soup = bs4(r)
        title = soup.h3.text
        list = soup.div('ul')[2]
        listdata = list()

        for x in list:
            listdata.append(x)

        data.append(title.split(' ')[0])
        data.append(title.split(' ')[1])
        data.append(title.split(' ')[2])
        data.append(listdata[2].text)
        data.append(listdata[6].text)
        data.append(listdata[9].text)
        data.append(listdata[14].text)
        data.append(listdata[17].text)
        data.append(listdata[20].text)

        birthday = listdata[23].text.split(' ')[0:3]
        data.append(birthday[1][:-1] + ' ' + birthday[0] + ' ' + birthday[2])

        data.append(listdata[26].text.replace(' ', ''))
        data.append(listdata[29].text)
        data.append(listdata[32].text)
        data.append(listdata[40].text)
        data.append(listdata[43].text)
        data.append(listdata[46].text)
        data.append(listdata[52].text)
	
        weight = listdata[54].text.split(' ')
        weight = str(weight[2] + ' ' + weight[3])
        weight = weight[1:]
        weight = weight[:-1]
        data.append(weight)
        
        height = listdata[57].text.split(' ')
        height = str(height[2] + ' ' + height[3])
        height = height[1:]
        height = height[:-1]
        data.append(height)
        
        data.append(listdata[64].text)

        return data

'''
file = open(sys.path[0]+'/testdata.txt', 'w')
for x in range(int(sys.argv[1])):
	file.write(pformat(getData()) + '\n\n')
	print str(x+1),'/',str(sys.argv[1]),'\t\tuser processed.'
file.close()
'''
