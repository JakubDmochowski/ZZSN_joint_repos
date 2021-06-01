import requests 
from bs4 import BeautifulSoup as bs
import re
import os 



def get_images(url):
	try:
		r = requests.get(url)
	except requests.exceptions.RequestException as e:
		print('Invalid URL')
		return False

	webpage = bs(r.content, features="html.parser")	    
	image_urls = [x['href'] for x in webpage.select("div[id='30darchive'] a[class=wcg-archive]")]

	for i in image_urls:
		img_data = requests.get(i).content
		pattern = "oneyear/(.*?).jpg"
		name = re.search(pattern, i).group(1)[6:] + '-' + re.search(pattern, i).group(1)[:5] 
		with open(path + name + '.jpg', 'wb') as handler:
			handler.write(img_data)
	return True



def get_urls(url):
	try:
		r = requests.get(url)
	except requests.exceptions.RequestException as e:
		print('Invalid URL')
		return False

	webpage = bs(r.content, features="html.parser")	    
	hyperlinks = [x['href'] for x in webpage.select("div[class='wcg-border wcg-box-mobile'] a") if not 'complete' in x['href']]

	for h in hyperlinks:
		get_images(h)

	return True



path = os.getcwd() + '..\\..\\..\\images\\'

try:
    os.mkdir(path)
except OSError:
    pass


url = ''
while True:
	url = input("URL: ")
	if url == 'exit':
		break
	else:
		get_urls(url)