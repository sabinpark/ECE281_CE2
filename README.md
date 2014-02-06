ECE281_CE2
==========

Sabin's Computer Exercise 2

## Decoder
A decoder is a device which takes in binary inputs and returns the information into unique, separate outputs.  In CE 2, we will program a simple decoder using both the structural and behavioral architectural designs.

## Schematic of a Decoder
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder%20Schematic.png "Decoder Schematic")

## Truth Table of a Decoder
The truth table shows the functionality of a decoder; inputs are taken in and the decoder returns unique outputs.
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder%20Truth%20Table.PNG "Decoder Truth Table")

## Structural Decoder
The first decoder that was made was using structural architecture.  This means that the decoder consisted of various components that were put together using VHDL.  Three VHDL modules were created: *inverter*, *and3*, *Decoder_Structural*.  As it sounds, the *inverter* takes an input and outputs the inverse of the input.  *and3* takes in three inputs and outputs the AND of the three.  Finally, *Decoder_Structural* is used to combine the other two modules in such a way to program a functional decoder.

Under the *architecture* part of the *Decoder_Structural* module, the *inverter* and the *and3* modules were declared so that these components may be used to program the decoder.  As shown below, *inverter* and *and3* have the appropriate number and types of inputs and outputs.  The intermediary signals, *I0_NOT* and *I1_NOT* are declared here as well.

```vhdl
	COMPONENT inverter
	PORT(
		I : IN std_logic;
		O : OUT std_logic);
	END COMPONENT;
	
	COMPONENT and3
	PORT(
		I0 : IN std_logic;
		I1 : IN std_logic;
		I2 : IN std_logic;
		O : OUT std_logic);
	END COMPONENT;
	
	SIGNAL I0_NOT, I1_NOT : std_logic;
```

Following the schematic, the decoder module was programmed to use the appropriate components and signals for the decoder.  Below is an example of the connection for the Y3_and3 component:

```vhdl
	Y3_and3: and3 PORT MAP(
		I0 => I0,
		I1 => I1,
		I2 => EN,
		O => Y3);
```

After completing the connections for all of the components in the circuit, the next step was to test the module using a test bench.  NOTE: it was interesting that after creating a gate, a vhdl representing that gate was automatically created under the *Decoder_Structural* module.

## Test Bench for Structural Decoder
For this test bench, all of code pertaining to clocks were commented out.  Along with the inputs (I0, I1, and EN) and outputs (Y0, Y1, Y2, and Y3), a counter signal (count) was also created to be used in the stimulus process.  *count* was initialized to a value of *000*, and would go through all eight of the input combinations.  Thus, in the UUT (Unit Under Test), count(0) was set to I0, count(1) as I1, and count(3) as EN.  The outputs were kept the same.

A *for-loop* was used to test the eight input combinations.  Starting with *000*, the simulation would read through the three inputs and print out the corresponding output values.  Immediately after printing the results in the console, the simulation displayed the waveform of the inputs and outputs.  After every iteration, *count* was incremented by *001*.  This was made possible by using the unsigned.all library.  

## Structural Decoder Results
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder_Structural%20Simulation%20Results.PNG "Structural Decoder Results")

These results may be compared with the truth table above or the waveform below.

## Structural Decoder Waveform
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder_Structural%20Simulation%20Waveform.PNG "Structural Decoder Waveform")

The three inputs, I0, I1, and EN are represented by the count signal, and therefore are not shown to actually take in the input values for the simulation.

## Behavioral Decoder
The decoder was made once more using behavioral programming techniques.  A new module was created which implemented the behavioral architecture.  This was relatively simple to do by following the provided circuit schematic.  I coded in the connections part of the module as shown below.

```vhdl
	I0_NOT <= not I0;
	I1_NOT <= not I1;
	Y0 <= I0_NOT and I1_NOT and EN;
	Y1 <= I0 and I1_NOT and EN;
	Y2 <= I0_NOT and I1 and EN;
	Y3 <= I0 and I1 and EN;
```

Afterwards, I created a test bench for the behavioral decoder.  I used the same code from the test bench used by the structural decoder.  As expected, the results were the same.  Below are images of the behavioral test bench showing that the results are indeed the same.

## Behavioral Decoder Results
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder_Behavioral%20Simulation%20Results.PNG "Behavioral Decoder Results")

## Behavioral Decoder Waveform
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder_Behavioral%20Simulation%20Waveform.PNG "Behavioral Decoder Waveform")

## Conclusion
To review, a decoder is a device that takes in inputs, converts the inputs and returns unique output values.  The third input, EN, stands for enabler.  The enabler is used to limit, or distinguish the unique outputs.  If EN is 0, then the entire output will have to be 0 as well because all of the AND gates are connected to the enabler.  By connecting the enabler with each of the other inputs and utilizing the two NOT gates, we have a way to return three unique outputs.

Decoders are used in numerous ways.  If certain information is encoded, the decoder can take the information and return the original information before it was encoded.  For example, this process is used by cable TV companies who only want to allow pay-per-view customers to have access to a movie or TV show.  The streaming of the movie/show is encoded by the company and the viewer's decoder will return the decoded/viewable movie/show.
