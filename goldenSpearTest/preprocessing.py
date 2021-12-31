# Load the Pandas libraries with alias 'pd' 
import pandas as pd 
import nltk
import os,sys,string,random





STOPWORDS = set(nltk.corpus.stopwords.words('english'))
STOPWORDS.add("n\'t")



TRANSLATETABLE = {46: None,44: None }
DATASETPATH='/datasets/'
FILENAME= 'ratings.csv'

REST_TEST= 0.75
TRAIN_VAL= 0.99

def printdash(word):
	print('----------------------' + word.upper() + '-------------------------' )


def printstats(data):
	print('Amount of rows: ' + str(data.shape[0]))
	boW = {}
	for text in data['TEXT']:
		words = [w.translate(TRANSLATETABLE) for w in nltk.word_tokenize(text.lower()) if w not in STOPWORDS]
		for w in words:
			if boW.get(w) :
				boW[w]+=1
			else:
				boW[w] =1
	#del boW["!"]
	del boW[""]
	mostmentioned5 = sorted(list(boW.items()),key=lambda a:a[1],reverse=True)[:5]
	print(mostmentioned5)
	


if __name__ == '__main__':


	printdash('reading')
	cwd = os.getcwd()
	data = pd.read_csv(cwd+DATASETPATH+FILENAME)


	printdash('results x group')
	for i in range(5):
		printdash('group' + str(i+1))
		currdata = data.loc[data['RATING'] ==  i+1 ]
		printstats(currdata) 		
	

	printdash('cleaning')
	cleanData=[]
	for _,(text,rating) in data.iterrows():
		words = ' '.join([w.translate(TRANSLATETABLE) for w in nltk.word_tokenize(text.lower()) if w not in STOPWORDS])
		cleanData+=[str(rating) + ', '+ words]
	

	printdash('splitting')
	random.shuffle(cleanData)
	split= int(len(cleanData)*REST_TEST)
	restData= cleanData[:split]
	testData = cleanData[split:]	
	split= int(len(restData)*TRAIN_VAL)
	trainData= restData[:split]
	valData= restData[split:]
	frow= ['RATING,TEXT']
	with open(cwd + DATASETPATH+ 'train'+FILENAME,'w') as f:
		f.write('\n'.join(frow + trainData))
	with open(cwd + DATASETPATH+ 'val'+FILENAME,'w') as f:
		f.write('\n'.join(frow + valData))
	with open(cwd + DATASETPATH+ 'test'+FILENAME,'w') as f:
		f.write('\n'.join(frow + testData))


