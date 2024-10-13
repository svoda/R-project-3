##### Final Project
##### Name: Svetlana Voda
##### Version Number: 1




## Task 1: Load the Dataset into R (Code)

energydata<-read.csv("C:/Users/vital/Desktop/UNIVERISTY/STAT381/R PROJECT/final project/energydata_381.csv")
kwh<-energydata$TOTAL.KWH
therms<-energydata$THERMS.SQFT.MEAN.2010




## Task 2: Summary Statistics for TOTAL.KWH
	# Summary Stats Code and Results

summary(kwh)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 

2990   51610   90869   90256  124621  199669 
	
	# Variance Code and Results
var(kwh)

 2102832505
	
	
	# Standard Deviation Code and Results

sd(kwh)

 45856.65
	
	# Number of values for this variable Code and Results

	
length(kwh)

 3833

	
## Task 3: Summary Statistics for THERMS.SQFT.MEAN.2010
	# Summary Stats Code and Results

 summary(therms)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 
 904.2  1110.2  1174.5  1174.1  1237.1  1448.8 
	
	# Variance Code and Results

 var(therms)
  8781.347
	
	# Standard Deviation Code and Results

  sd(therms)
  93.70884
	
	# Number of values for this variable Code and Results

  length(therms)
  3833
	
	

	
## Task 4: Histogram for TOTAL.KWH
	## Remember to save your plot and also submit it to Gradescope.

	# Code:

  hist(kwh,right=FALSE, breaks=seq(0,225000, by=25000), main="TOTAL.KWH", ylim = c(0, 800), col="violet")

	# Describe histogram: symmetry?

it does not look very symmetric

	# Describe histogram: unimodal or bimodal or multimodal?

unimodal

	
	
## Task 5: Boxplot for TOTAL.KWH
	## Remember to save your plot and also submit it to Gradescope.

	# Code:

boxplot(kwh,horizontal = TRUE, main ="Boxplot of Total KWH",ylim= c(0,210000), col="coral" )

	# Are there outliers present?

		no outliers

## Task 6: Shapiro-Wilk Test for TOTAL.KWH
	# Code:

shapiro.test(kwh)

	# Copy and paste results here

Shapiro-Wilk normality test

data:  kwh
W = 0.97627, p-value < 2.2e-16  

	# Do you think that your population is normally distributed?

is not normally distributed

	# Reason:

	is not look like normally distributed 
		
	# Does your decision here match what you are seeing with your histogram from Task 4? Why or why not?

		
		yes its match  because  if  p-value  is small than (0.05) implies that the data are not normally distributed 
		
		

		
## Task 7: Histogram for THERMS.SQFT.MEAN.2010
	## Remember to save your plot and also submit it to Gradescope.

	# Code:

hist(therms,right=FALSE, breaks=seq(900,1500, by=50), main="THERS.SQFT.MEAN.2010", ylim = c(0, 850), col="pink")

	# Describe histogram: symmetry?

symmetric- bell shapped 

	# Describe histogram: unimodal or bimodal or multimodal?
		
		unimodal
		


## Task 8: Boxplot for THERMS.SQFT.MEAN.2010
	## Remember to save your plot and also submit it to Gradescope.

	# Code:

boxplot(therms,horizontal = TRUE, main ="Boxplot of Average Therms Per Sqft",ylim= c(900,1500), col= " orange" )

	# Are there outliers present?
		
outliers are present
		
		
## Task 9: Shapiro-Wilk Test for THERMS.SQFT.MEAN.2010
	# Code:

		shapiro.test(therms)

	# Copy and paste results here

		Shapiro-Wilk normality test
		
		data:  therms
		W = 0.99914, p-value = 0.056

	# Do you think that your population is normally distributed?

is normal distributed

	# Reason:

		because p-value is greater than 0.05
		
	# Does your decision here match what you are seeing with your histogram from Task 7? Why or why not?

		
		yes its match because , if the p-value is over 0.05, we will fail to reject the null hypothesis and conclude that the data follow the normal distribution.
		
		

		
## Task 10: Compare average Means for for different Building Subtypes. Create a confidence interval, assuming equal variances. (See PDF for CI to create.)

	# Split Dataset:
//Comm <- datasetname$KWH.MEAN.2010[datasetname$BUILDING_SUBTYPE == "Commercial"]
//SFH <- datasetname$KWH.MEAN.2010[datasetname$BUILDING_SUBTYPE == "Single Family"]

Comm <- energydata$KWH.MEAN.2010[energydata$BUILDING_SUBTYPE == "Commercial"]
SFH <- energydata$KWH.MEAN.2010[energydata$BUILDING_SUBTYPE == "Single Family"]


	# Code:

t.test(Comm, SFH, alternative = "two.sided", conf.level = 0.982, var.equal= TRUE)

	# Copy and paste results here

Two Sample t-test

data:  Comm and SFH
t = 6.9748, df = 3763, p-value = 3.602e-12
alternative hypothesis: true difference in means is not equal to 0
98.2 percent confidence interval:
  1609.970 3263.663
sample estimates:
  mean of x mean of y 
11286.209  8849.392 


	# State the parameter the confidence interval is for.

 µCommercial- µSingle,
		
	# Write down the confidence interval.

98.2 percent confidence interval:
  1609.970 < µCommercial ??? µSingle < 3263.663

	# Write an interpretation of your confidence interval.

 We are 98.2 % confident that our interval from 1609.970 to 3263.663 contains the true difference  average of KWH Mean in 2010 for the Commercial Building Subtype
 - KWH Mean in 2010 for the Single Family Building Subtype

	# We are interested in whether there is evidence that there is specific value difference between the building subtypes. (See PDF for more specifics.)
		# Is there evidence this is true?
 
Yes it is seem reasonable

		# Reason why or why not.

		because 2000 is in interval 
		
		
		
		
		
		
## Task 11: Create a confidence interval for the proportion of buildings of a certain age.

	# Code to observe how many values exist per age group.
addmargins(table(energydata$Age_Group))

Ancient Middle1 Middle2 Middle3   Newer     Sum 
429     283    1592    1470      59    3833 

	# Check the success / failure condition.
		# Code:
P= x/n = 59/3833= 0.0154

		
		# Expected Number of Successes 
np = 3833*0.0154 = 59.0282
		# Expected Number of Failures
n(1-p)= 3833*(1-0.0154)=3773.972
		# Can we use the Normal Distribution to approximate this confidence interval?

yes we can use 

	# Code for Confidence Interval:

prop.test(x=59, n= 3833, alternative = "two.sided", conf.level = 0.973, correct=FALSE)

	# Copy and paste results here

1-sample proportions test without continuity correction

data:  59 out of 3833, null probability 0.5
X-squared = 3600.6, df = 1, p-value < 2.2e-16
alternative hypothesis: true p is not equal to 0.5
97.3 percent confidence interval:
  0.01157229 0.02044811
sample estimates:
  p 
0.01539264 
	
	# State the parameter the confidence interval is for.

  P population proportion
	
	# Write down the confidence interval.

  0.01157229< p <  0.02044811

	# Write an interpretation of your confidence interval.


We are 97.3% confident that our interval from 0.01157229 to 0.02044811 contains the true proportion of buildings that are less than 25 years old



## Task 12: Create a confidence interval for the variance of THERMS.SQFT.MEAN.2010. (See PDF for CI to create.)

	# Code:

varTest(therms, alternative= "two.sided", conf.level = 0.926)
	
	# Copy and paste results here

Chi-Squared 
33650121 

$parameters
df 
3832 

$p.value
[1] 0

$estimate
variance 
8781.347 

$null.value
variance 
1 

$alternative
[1] "two.sided"

$method
[1] "Chi-Squared Test on Variance"

$data.name
[1] "therms"

$conf.int
LCL      UCL 
8433.909 9151.360 
attr(,"conf.level")
[1] 0.926

attr(,"class")
	
	# State the parameter the confidence interval is for.

population variance ??²
	
	# Write down the confidence interval.

8433.909< ??² <9151.360 

	# Write an interpretation of your confidence interval.

We are 92.6% confident that the true population variance  falls between 8433.909 and 9151.360 

	# What assumption did we need to make to construct this confidence interval?

Assume that our population is normaly distributed

	# Do you think that this assumption was met? You should reference an earlier Task from this project to answer this question.


Yes assumptation was made  because histogram is bell shaped
	
	
	

	
## Task 13: Hypothesis Test for TOTAL.KWH
	# What conditions must you satisfy to perform this test? Do you think they are met?  Why or why not?

Must met Central Limited Theorem condition: the distribution of sample means have to be normal distributed as the sample size gets larger, regardless of the populations distribution. 


The sample must be reasonably random.
The data must be from a normal distribution or large sample .
Sample sizes equal to or greater than 30

Yes we met the condition 

The population that are testing is  normally distributed and  sample size is be sufficiently large.




	# State the hypotheses:
		#H0:
         µ = 89100
		#H1:
         µ > 89100
	
	# Code:
t.test(kwh, mu= 89100, alternative = "greater", conf.level = 0.938)
	
	
	# Copy and paste results here

One Sample t-test

data:  kwh
t = 1.5603, df = 3832, p-value = 0.05939
alternative hypothesis: true mean is greater than 89100
93.8 percent confidence interval:
  89116.12      Inf
sample estimates:
  mean of x 
90255.69 

	
	# State the Test Statistic Value:

t = 1.5603

	# State the P-Value:

p-value = 0.05939
	
	# Decision from P-Value (see PDF for significance level):

 Reject
	
	# Conclusion from P-Value:

There is enough evidence that the population mean of TOTAL.KHW is greater than 89100
	
	# State the critical value. Provide your code and results.

qt(0.062, 3832, lower.tail = FALSE)
1.538537

			
	# State the critical region.

Reject H0 if t > 1.538537
  

	# Would you make the same decision based on the critical region that you did with your p-value? Why or why not?


yes, because test statistic value is in the region of Rejection



\
