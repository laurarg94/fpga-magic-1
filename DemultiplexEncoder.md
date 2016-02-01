# Introduction #

The Magic-1 Faults and Interrupts card uses the 74F138 1-of-8 Decoder/Demultiplexer, this page will explain it's behavior and shows it's VHDL description.


# Details #
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/LogicSymbols.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/LogicSymbols.png)

The 74F138 uses a line address (A2,A1,A0) an enable line (E3,E2,E1) and a output line O(7 downto 0). Unless E1,E2=0 and E3=1 all outputs will be high.

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/Encoder_TruthTable.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/Encoder_TruthTable.png)

The VHDL description can be found [here](http://code.google.com/p/fpga-magic-1/source/browse/trunk/EncoderDemux.vhd)

Simulation here:

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/Simulacao74f148.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/Simulacao74f148.png)