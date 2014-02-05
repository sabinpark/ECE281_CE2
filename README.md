ECE281_CE2
==========

Sabin's Computer Exercise 2

# Decoder
A decoder is a device which takes in binary inputs and returns the information into unique, separate outputs.  In CE 2, we will program a simple decoder using both the structural and behavioral architectural designs.

# Schematic of a Decoder
![alt text](https://raw2.github.com/sabinpark/ECE281_CE2/master/Decoder%20Schematic.png "Decoder Schematic")

# Structural Decoder
The first decoder that was made was using structural architecture.  This means that the decoder consisted of various components that were put together using VHDL.  Three VHDL modules were created: *inverter*, *and3*, *Decoder_Structural*.  As it sounds, the *inverter* takes an input and outputs the inverse of the input.  *and3* takes in three inputs and outputs the AND of the three.  Finally, *Decoder_Structural* is used to combine the other two modules in such a way to program a functional decoder.
