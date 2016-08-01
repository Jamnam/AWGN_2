#AWGN_2

The project_1 folder contains all the files of the revised version of this design. 

The design is now positive clock triggered and low active reset.

By adding several pipeline stages into the giant combinational logic of function evaluation modules, the whole model could work on high frequency. The revised version is a 13 stage pipeline noise generator which can work on 100MHz and 150MHz. The simulation figure shows the 13 clock periods after reset. (the first 0001 is an unexpected outputs and can be ingnored).

The time constraint file is in the project folder. It includes the clock, inputs and outputs constraints. 

When synthesizing the circuit, there are some warnings. Most of them are resolved. The rest of these warning are shown in the warning figure. Explanations: 1. Because the architecture of the URNG, the "reset" is equivalent to "set". 2. Behavioral  modle is based on the architecture, the synthesizer of Vivado wipes some unused signal out. Both these two warnings don't take effect on the function of this design.
