# Logbook LAB 2:
## Task 2: 
- [Logbook LAB 2:](#logbook-lab-2)
  - [Task 2:](#task-2)
    - [What I did:](#what-i-did)
    - [Problems encountered:](#problems-encountered)
    - [Other reflexions:](#other-reflexions)
### What I did:
* In _rom2ports_:
  * Created a 2 ports ROM module 258x8 bits. 
    * Address1 gives the points for the 1st wave
    * Address2 is used as the points for 2nd wave. Using an **offset** value generated by the rotary switch on the processor --> addr1 - offset 
* In _sinegen.sv_:
  * **THUS** generated 2 simultaneous sinusoid signals with different phases. 
* In _testbench_: 
  * Added a pointer to the offset and set it equal to
  ```cpp
  top->offset = int(double(vbdValue() / 100) * 255)
  ``` 
  * Added an extra method _vbdPlot()_ to plot the second waveform using _dout2_ as input which is equal to 
  ```sv
  addr1 - offset
  ```
![schematic](./Logbook_images/offset%20waves%20-%20L2T2.png)

* The image above shows two waveforms with exactly 90 degrees apart ib their phases, making one sine wave and one cosine wave at the same frequency. They are **quadrature signals**. 
* **EXPLANATION**:
    * This happens because the the value of the offset = 64. Knowing that we have 255 data points, the value 64 is indeed a quarter. 
---
### Problems encountered:

* At first, I did not know how to tackle the problem because I did not know what to do with the logic value of **addr2**. I then realised that I should not directly use it but only set it equal to addr1 - offset
  
* I was confused as I did not understand how an offset value could be used as an input to a component without it being defined beforehand. I then realised that me define the value in the testbench would be sufficient to make my program running. 
  
---

### Other reflexions: 

_None_

