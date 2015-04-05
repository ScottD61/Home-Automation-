Predictive Maintenance for Samsung Home Appliances

Appliance and operating conditions found on company website: http://www.samsung.com/us/showcase/smart-home-appliance-washer-dryer-and-refrigerators/

Appliances and operating variables:

1.	Plasma T.V. – Samsung PN1F85500AF

a.	Operating temperature: 0°C - 35°C

b.	Operating humidity: 20-80%

c.	Hours of operation: 0-2500hrs


2.	Refrigerator – Samsung RF31FMEDBSR

a.	Operating temperature: 10°C-45°C

b.	Defective compressor: (Yes-1, No-0)

c.	Dirty condenser coils: (Yes-1, No-0)

d.	Condenser fan broken: (Yes-1, No-0)

e.	Defrost timer broken: (Yes-1, No-0)

f.	Thermostat broken: (Yes-1, No-0)

g.	Operating capacity: 0-31 cu.ft.

h.	Hours of operation: 0-8765hrs. 


3.	Dishwasher -  Samsung DMT800

a.	Wash capacity: 14 place settings

b.	Hours of operation: 1000hrs 

c.	Nozzle hole plugged: (Yes-1, No-0) 

d.	Operating water temperature: 49°C-65°C

e.	Operating Hot water supply line pressure: 20-120 PSI. 


4.	Dryer – Samsung DV50F9A7EVW/A2

a.	Dryer capacity: 7.4 cu.ft. 

b.	Hours of operation: 0-600

c.	Vent restricted: (Yes-1, No-0) 


5.	Washing Machine – Samsung WA50F9A7DSW/A2

a.	Washer capacity: 5.0 cu.ft. 

b.	Hours of operation: 0-600

c.	Spin speed: 0-1100 rpm


Data:

Created simulated cross-sectional dataset taken after one year of machine operation. The binary variables are under a uniform randomized distribution and the numerical variables have a normal distribution within the operating conditions. 

Classifier algorithm: Logistic regression. 

Purpose of study: Estimate probability of each Samsung appliance breaking down after one year of operation. 

