#include<iostream>
#include<time.h>
#include<stdlib.h>
using namespace std;
int main(){
int M[50][6],i,j,k=-1,tbt=0,Rn;
 for(i=0;i<50;i++){
     Rn=rand()%100;
	if(Rn<20){k=k+1;

	  M[k][0]=i;
	  M[k][1]=rand()%30+10;
	  if(k==0)
      {
          tbt=i;
      }
      tbt+=M[k][1];
	  M[k][2]=tbt;	 
	  M[k][3]=M[k][2]-M[k][0];
	  M[k][4]=M[k][2]-M[k][0]-M[k][1];
	 if (k==0)M[k][5]=0;
	  else M[k][5]=M[k-1][2]-M[k][0];
	  cout<<M[k][0]<<"     "<<M[k][1]<<"      "<<M[k][2]<<"      "<<M[k][3]<<"     "<<M[k][4]<<"     "<<M[k][5]<<endl;
	   }}
       return (0);}

