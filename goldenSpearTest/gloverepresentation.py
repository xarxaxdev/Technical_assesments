import os
import numpy as np
import pandas as pd 
from sklearn.ensemble import RandomForestClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import cross_val_score




DATASETPATH='/datasets/'
FILENAME_TRAIN= 'trainratings.csv'
FILENAME_VAL= 'valratings.csv'
FILENAME_TEST= 'testratings.csv'



def printdash(word):
	print('----------------------' + word.upper() + '-------------------------' )






def printSearch(clf):

	print("Best parameters set found on development set:")
	print()
	print(clf.best_params_)

	print("Grid scores on development set:")
	print()
	means = clf.cv_results_['mean_test_score']
	stds = clf.cv_results_['std_test_score']
	for mean, std, params in zip(means, stds, clf.cv_results_['params']):
		print("%0.3f (+/-%0.03f) for %r"
			% (mean, std * 2, params))


def predictAndAccuracies(clf,x,y,name,data):
	predy = clf.predict(x)
	table =[list(a) for a in  zip(predy,y)]
	accuracy = sum(1 for x,y in table if x == y) / len(y)
	print(name +' Accuracy '+data+':' + str(accuracy))




if __name__ == '__main__':
	i=0
	cwd = os.getcwd()
	glove = dict()
	printdash('reading glove')
	with open('glove.840B.300d.txt','r') as f:
		for line in f:
			line = line.split()
			word_spaces= (len(line)-300)
			i+=1
			if (i % 100000) == 0:
				print(i)
			word = ' '.join(line[:word_spaces])
			#print(word)
			#print(line)
			glove[word]= np.array([np.float(i) for i in line[word_spaces:]])
			#if len(glove) > 5000:
				#break
			#print(line)
			#exit()

	printdash('reading data')

	dataTrain = list(pd.read_csv(cwd+DATASETPATH+FILENAME_TRAIN).iterrows())
	dataVal = list(pd.read_csv(cwd+DATASETPATH+FILENAME_VAL).iterrows())
	dataTest = list(pd.read_csv(cwd+DATASETPATH+FILENAME_TEST).iterrows())
	trainy= [y for _,(y,_) in dataTrain]
	valy = [y for _,(y,_) in dataVal]
	testy= [y for _,(y,_) in dataTest]

	printdash('creating repr')
	trainx =  np.zeros((len(dataTrain),300),np.float)#for each document and for each vector
	valx =  np.zeros((len(dataTrain),300),np.float)#for each document and for each vector
	testx =  np.zeros((len(dataTest),300),np.float)#for each document and for each vector

	for i,(rating,text) in dataTrain:
		for word in text.split():
			if word in glove:
				trainx[i]= list(map(sum,zip(trainx[i],glove[word])))
	
	for i,(rating,text) in dataVal:
		for word in text.split():
			if word in glove:
				valx[i]= list(map(sum,zip(valx[i],glove[word])))

	for i,(rating,text) in dataTest:
		for word in text.split():
			if word in glove:
				testx[i]= list(map(sum,zip(testx[i],glove[word])))



	printdash('NN')
	parameters = {'max_iter':(300,400,500), 'alpha':(5e-4,1e-4,1e-3,1.5e-3)}
	clf = MLPClassifier(solver='lbfgs', alpha=1e-5,
                    hidden_layer_sizes=(100,50,30,), random_state=1)


	clf = GridSearchCV(clf, parameters, cv=3,return_train_score=True)
	scores = cross_val_score(clf, trainx, trainy, cv=5)
	print('Scores ')
	print(scores)
	clf.fit(trainx,trainy)
	printSearch(clf)
	name= 'NN'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')


	printdash('KNN')
	parameters = {'n_neighbors':(1,2,3)}
	clf =  KNeighborsClassifier(n_neighbors=1)
	clf = GridSearchCV(clf, parameters, cv=3,return_train_score=True)
	scores = cross_val_score(clf, trainx, trainy, cv=5)
	print('Scores ')
	print(scores)
	clf.fit(trainx,trainy)
	printSearch(clf)
	name= 'KNN'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')
