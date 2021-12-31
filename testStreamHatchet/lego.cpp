#include <iostream>
#include <vector>
using namespace std;

//this function calculates the water given a water height
//pre: first and last position are peaks, first < last, no higher peak in the valley
int water(const vector<int> & valley, int & first, int & last, int  &level){
	int water = 0;
	for (int i = first+1 ; i<last; i++){//first and last are peak
	}									//no water on them
	return water;
}

//this function calculates the water within a peak
//pre: first and last position are peaks, first < last
//post: 0 or positive integer.
int water(const vector<int> & valley, int & first, int & last){
	//cant quite store water with less than 3 cols, base case
	if (last - first < 2) return 0;
	int max1, max2, max1pos, max2pos;
	//max1 is highest peak,max2 is 2nd highest
	if (valley[first] > valley[first+1]){
		max1 = valley[first];
		max2 = valley[first+1];
		max1pos = first;
		max2pos = first+1;
	}else{
		max1 = valley[first+1];
		max2 = valley[first];
		max1pos = first+1;
		max2pos = first;	
	}
	//find 2 highest peaks, this guarantees the solution
	for (int i = first+2; i <= last ; i++){
		if(valley[i]>= max2){
			if (valley[i] >= max1 ) {
				max2=max1;
				max2pos = max1pos;
				max1 =valley[i];			
				max1pos= i;
			}else{
				max2=valley[i] ;
				max2pos = i;			
			}
		}
	}
	//calculate each valley separately
	int left = max2pos > max1pos ? max1pos:max2pos, 
		right = max2pos > max1pos ? max2pos:max1pos; 
	return water(valley, first, left) + water(valley,left,right,max2)+ water(valley,right,last);
}

void print(const vector<int> & v){
	for (int i=0;i< v.size(); i++) cout << v[i] << " " ;
	cout << endl;	
}

int main(){
	int n, last, last_up;
	vector<int> valley;
	cin >> last;
	//ensure left is a peak
	while (cin >> n and last <= n){
	 last = n;
	}	
	valley.push_back(last);
	valley.push_back(n);
	last_up = last;
	while (cin >> n) {
		valley.push_back(n);
		if( last <= n ) last_up = n;
		last = n;
	}
	//ensure right is also a peak
	if( last <= n ) last_up = n;
	while (valley[valley.size() - 1 ] < last_up) valley.pop_back();
	int f = 0,l= valley.size()-1;
	cout << water(valley, f, l) << endl;
	return 1;
}
