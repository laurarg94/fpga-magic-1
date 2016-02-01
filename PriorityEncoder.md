# Introduction #

The Magic-1 Faults and Interrupts card uses the CI 74F148 (Priority Encoder) to mask prioritize interrupts.

For example a 4-bit priority encoder basically convert a 4-bit input into a binary representation. If the input n is active, all lower inputs (n-1 .. 0) are ignored (Less priority):

Example: x(inputs), y(outputs), X(Don't care)

|x3|x2|x1|x0|y1|y0|
|:-|:-|:-|:-|:-|:-|
|1 |X |X |X |1 |1 |
|0 |1 |X |X |1 |0 |
|0 |0 |1 |X |0 |1 |
|0 |0 |0 |X |0 |0 |

Note that if the input bit x3 is '1' the output will be (1,1) even if all others inputs changes. then x3 has the most priority level.
Also note that the circuit function as specified here does not depend at all on the least significand input bit.

# Details #
In magic-1 we're going to use the CI 8-bit 74F148 (Priority Encoder)

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/74f148.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/74f148.png)

This chip has the following turth table.

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/74f148_PriorityEncoder.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/74f148_PriorityEncoder.png)

His signals are explained here:
  * EI: Enable Inputs , If high all outputs will be high
  * A0,A1,A2: Outputs(negate)
  * I(7 downto 0): Inputs

The 74f148 was described in vhdl [here](http://code.google.com/p/fpga-magic-1/source/browse/trunk/PriorityEncoder.vhd)

The simulation is found bellow:
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/Simulation_PriorityEncoder.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/Simulation_PriorityEncoder.png)