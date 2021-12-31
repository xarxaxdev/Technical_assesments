import pandas as pd 
#import seaborn as sns
import os
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn import svm
from sklearn.ensemble import AdaBoostClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import GridSearchCV
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

	printdash('reading')
	cwd = os.getcwd()
	dataTrain = list(pd.read_csv(cwd+DATASETPATH+FILENAME_TRAIN).iterrows())
	dataVal = list(pd.read_csv(cwd+DATASETPATH+FILENAME_VAL).iterrows())
	dataTest = list(pd.read_csv(cwd+DATASETPATH+FILENAME_TEST).iterrows())
	trainy= [y for _,(y,_) in dataTrain]
	valy = [y for _,(y,_) in dataVal]
	testy= [y for _,(y,_) in dataTest]

	printdash('create vocabulary')
	vocabulary = dict()


	wordid=0
	#linear to the size of corpus
	for _,(rating,text) in dataTrain:
		for word in text.split():
			if not word in  vocabulary:
				vocabulary[word]=wordid
				wordid+=1
			
	#last wordid is the sizer of the vocabulary
	#print(vocabulary)
	#print(wordid)

	printdash('create bow')
	trainx =  np.zeros((len(dataTrain),wordid),np.int)#for each document and for each word
	valx =  np.zeros((len(dataVal),wordid),np.int)#for each document and for each word
	testx =  np.zeros((len(dataTest),wordid),np.int)#for each document and for each word
	#for each review, we count how many times each word appears in it
	for i,(rating,text) in dataTrain:
		#print(text)
		for word in text.split():
			trainx[i][vocabulary[word]]+= 1
	for i,(rating,text) in dataVal:
		#print(text)
		for word in text.split():
			if word in vocabulary:
				valx[i][vocabulary[word]]+= 1

	for i,(rating,text) in dataTest:
		#print(text)
		for word in text.split():
			if word in vocabulary:
				testx[i][vocabulary[word]]+= 1


	


	
	printdash('random forest')
	#n_estimators= (50,100,200,500)
	#parameters = {'n_estimators':n_estimators }

	clf = RandomForestClassifier(n_estimators=100,criterion='entropy')
	#clf = GridSearchCV(clf, parameters, cv=3,return_train_score=True)
	#scores = cross_val_score(clf, trainx, trainy, cv=5)
	#print('Scores ')
	#print(scores)
	clf.fit(trainx,trainy)
	#printSearch(clf)
	name= 'Forest'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')

	
	printdash('adaboost')
	#n_estimators= (50,100,200,500)
	#parameters = {'n_estimators':n_estimators }
	clf = RandomForestClassifier(n_estimators=50) 
	clf.fit(trainx,trainy)
	#printSearch(clf)
	name= 'Adaboost'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')



	#after a lots of tests NB is sub 0.8 accuracy
	printdash('naive Bayes')
	clf =  GaussianNB()
	clf.fit(trainx,trainy)
	name= 'NB'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')

	printdash('KNN')
	clf =  KNeighborsClassifier(n_neighbors=1)
	clf.fit(trainx,trainy)
	name= 'KNN'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')


	printdash('SVM')
	clf = svm.SVC(gamma='scale', kernel = 'rbf' ,tol=1e-2, C= 3.5)
	clf.fit(trainx,trainy)
	name= 'SVM'
	predictAndAccuracies(clf,trainx,trainy,name,'Train')
	predictAndAccuracies(clf,valx,valy,name,'Val')
	predictAndAccuracies(clf,testx,testy,name,'Test')



