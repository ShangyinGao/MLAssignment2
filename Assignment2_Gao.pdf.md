# Assignment2_Gao.pdf

## Exercise 1

- prior 
		
		0.0953521529698318	0.190932438759726	0.264775859007329	0.448939549263113

- means

		-0.0122242247574440	0.00588955018948683
		-0.0122242797866279	0.00588949753771891
		-0.0122244153820694	0.00588936780431859
		-0.0122244367775179	0.00588934733435068

- convariance maxtix

		val(:,:,1) =
				
			0.0028    0.0004
			0.0004    0.0067
		
		
		val(:,:,2) =
		
		    0.0028    0.0004
		    0.0004    0.0067
		
		
		val(:,:,3) =
		
		    0.0028    0.0004
		    0.0004    0.0067
		
		
		val(:,:,4) =
		
		    0.0028    0.0004
		    0.0004    0.0067
		    
    

## Exercise 2

all sequences are classified as gesture 2

## Exercise 3

### WalkPolicyIteration

1. reward matrix

	-10|10|-10|10
	:-----:|:-----:|:-----:|:-----:
	-10|10|-20|-10
	10|-10|-20|-10
	-10|-10|10|-10
	-20|-10|-10|10
	0|-10|0|-10
	0|-10|-10|-10
	-20|10|-10|-10
	-20|-10|10|-10
	-10|-10|0|-10
	0|-10|0|-10
	-20|10|-10|-10
	10|-10|-10|-10
	-10|-10|-20|10
	-10|-10|-20|10
	-10|10|-10|10

2. the vaule of gamma i use is 0.7. The bigger gamma is, the more time it needs to converge. vice versa
3. 2-3 times of iterations are needed to converge
4. state 10
	![][2]
5. state 3
	![][1]

### WalkQlearning

1. epsilon = 0.5, alpha = 0.7
2. if pure greedy policy is used, its more likely the optimal policy not be found. The bigger epsilon is, the more steps it takes to find the optimal policy. 
3. 500 steps
4. state 5
	![][3]
5. state 12
	![][4]
	
[1]: /Users/gosing/Desktop/Assignment2_Gao_03692789/WalkPolicyIteration-state-3.png
[2]: /Users/gosing/Desktop/Assignment2_Gao_03692789/WalkPolicyIteration-state-10.png
[3]: /Users/gosing/Desktop/Assignment2_Gao_03692789/WalkQLearning-state-5.png
[4]: /Users/gosing/Desktop/Assignment2_Gao_03692789/WalkQLearning-state-12.png



