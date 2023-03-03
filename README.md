# AIR-PRESSURE-LEVEL-CONTROLLER-WITH-NOKIA5110
BMP280 Pressure Sensor based Micro Air Pump and LCD NOKIA 5110 driver implementations with Tiva TM4C123 board.

EE-447 LABORATORY PROJECT REPORT
Air Pressure Level Controller
Objectives:
The objective of this project was to design and implement a system that can continuously sense the air pressure
inside a container, and maintain it within a predefined range using two micro air pumps. The system was also
required to provide a user interface to display the current pressure and the pressure range, as well as the status of
the air pumps.
Methodology:
The system was built using a BMP280 pressure and temperature sensor to detect the air pressure inside the
container. The sensor samples were stored in an array of 256 elements, and the average pressure was calculated
once the array was filled. The system used two micro air pumps - a filling pump to pump air into the container
from outside, and a discharge pump to deflate air inside the container - to maintain the pressure within the
predefined range. The system also used a Nokia 5110 LCD, driven using an SPI module, to display the current
pressure and the pressure range. The status of the air pumps was indicated using on-board RGB LEDs, which
were turned on or off according to the detected pressure. If the pressure was below the range, the red LED was
on and the others were off. If the pressure was in the range, the green LED was on. If the pressure exceeded the
range, the blue LED was on.
The following components are used :
1. TM4C123G Board
2. BMP280 Pressure and Temperature Sensor
3. NOKIA 5110 LCD Screen
4. Potentiometer
5. RGB LED Placed on the TM4C123G Board
6. BC237 transistor
7. 1K Ohm resistor
8. Micro Air Pump
The flow chart that shows the methodology of the system can be seen from Figure 1.1
Figure 1.1. Flowchart of Air Pressure Controller
In order to set up our system in a regular way steps are divided into 4 parts. These are:
I2C SENSOR PRESSURE READING Reading Bmp280 using I2C protocol and store in 256 element array
ADC FOR POTENTIOMETER Converting analog signals to digital for potentiometer reading
PRINTING RESULTS TO THE LCD Driving Nokia 5110 LCD using an SPI module to display the current pressure and
the pressure range
INTEGRATION OF THE WHOLE
SYSTEM
Integration of the whole system by using the above three parts, adding range and
arranging leds.
Table 1: Steps that followed during implementation of Air Pressure Level Controller
PRESSURE READING:
To read the pressure using the BMP280 sensor with the I2C module on the Tm4c123GH6PM board, the
following steps are done:
1. Connecting the BMP280 sensor to the I2C module on the Tm4c123GH6PM board. Connect the SDA
and SCL pins on the sensor to the corresponding SDA and SCL pins on the I2C module in this project
I2C3 module used so PD0 is used for SCL and PD1 is used for SDA.
2. Initializing the I2C module by enabling it in the device configuration and setting the desired clock
speed.
3. Initializing the BMP280 sensor by writing the configuration registers to configure the sensor's
measurement settings. To do this the I2CMultipleByteWrite function is used. This is for setting the
oversampling ratio for the pressure measurement etc. The slave address is 0x77 and F5, F4 is
configured.
4. Reading the temperature and pressure data from the BMP280 sensor using the I2CReadMultipleByte
function. The temperature data is stored in the BMP280_TEMP_MSB_REG and
BMP280_TEMP_LSB_REG registers, and the pressure data is stored in the
BMP280_PRESS_MSB_REG, BMP280_PRESS_LSB_REG, and BMP280_PRESS_XLSB_REG
registers.
5. Converting the raw temperature and pressure data to the actual temperature and pressure values using
the appropriate equations. Uncompensation functions are created and used for that.
RANGE SETTING WITH POTENTIOMETER:
To set the pressure range using the ADC with a potentiometer on the TM4c123GH6PM board, the following
steps was done:
1. Connecting the potentiometer to the ADC module on the TM4c123GH6PM board. Connecting the
three pins on the potentiometer to the appropriate ADC input pin which is PE3, ground, and power
supply. Initializing the ADC module by enabling it in the device configuration and setting the desired
clock speed.
2. Configuring the ADC input channel by enabling it and setting the appropriate trigger source.
3. Reading the value of the potentiometer using the ADC module.
4. Converting the ADC value to the actual pressure range using the appropriate equation.
PRINTING PRESSURE TO THE SCREEN USING SPI:
Pinout Diagram of the Nokia 5110 and TM4C123G Board.
NOKIA 5110 - RST PA7
NOKIA 5110 - CE PA3
NOKIA 5110 - DC PA6
NOKIA 5110 - Din PA5
NOKIA 5110 - CLK PA2
NOKIA 5110 - VCC 3.3 V
NOKIA 5110 - BL (not connected)
NOKIA 5110 - GND GND
Necessary configurations are in CONFIG_NOKIA.s. Initialization is handled by INIT_NOKIA.s. DRAW_MAP
subroutine prints MIN, MAX, PRES names and dots for numbers. The NokiaClear function clears the screen. In
the main function we first call INIT_NOKIA and CONFIG_NOKIA. Then we call the NokiaClear function and
the DRAW_MAP subroutine. NokiaCommands.s file has NokiaClear subroutine, SetCursor_X and Y
subroutines which set the current position on the screen and PRINT subroutine that prints what we have in
register R5 to screen’s 8 pixel vertically. We got CONFIG_NOKIA.s, INIT_NOKIA.s and NokiaCommands.s
files from an open source project (link: https://github.com/canerpotur/Battleship-Game-Console) and arrange it
according to the air pressure level controller project. For the printing part we print 3 values on the screen. These
values have a precision of 3 or 4 (varying with different pressure values) and a scale of 1. basamak.s subroutine
has 12 different digit places corresponding to its x and y coordinates. sayilar.s subroutine has 10 different
numbers with suitable size for digit place and has 1 clear function named “bos” for 1 number digit place. When
a number has a precision of 4 and then 3, the first digit has to be cleared only so we use this subroutine. We first
call for the corresponding digit value and then we call for the number in here.Min, max and pressure values are
shown in the Figure 2.1.
Figure 2.1 System with LCD
INTEGRATION OF THE WHOLE SYSTEM:
In this part whole parts are integrated together. First pressure reading part and ADC part are integrated so that
the system obtains a range that bounds pressure. Later LCD parts have been added. Current pressure and range
are printed on the screen. According to the obtained range that comes from potentiometer. Potentiometer gives
us a range between 0-4095. We converted this range to 0-40 by simply dividing and adding 75 for min and 85
for max range values. Then potentiometer’s min value can be minimum 75 and maximum 115, potentiometer’s
max value can be minimum 85 and maximum 125. Onboard leds are lighted. Pressure value is in kPa units. If
pressure value is in the range then green led is on and red and blue leds are off, If pressure value is below the
range then red led is on and blue and green leds are off, If pressure value exceeds the range blue led is on and
green and red leds are off. Air pumps are driven with PF1 (red led) and PF2 (blue led) pins which are on the
TM4C123GH6PM board. We used a similar circuitry with Figure 3.1. We replaced the arduino pin with
TM4C123GH6PM board PF1 and PF2 pins. We used 3 volts instead of 9 volts, BC237 NPN transistors instead
of BD135 and we didn’t use any diodes. Transistor connections are given below:
Collector of the BC237 NPN transistor is connected to the motor first and then the power supply connected to
the motor. Emitter of the transistor is connected to the common ground of the whole system. Base of the
transistor is connected to 1K ohm resistor and the on-board led pin which are PF1 or PF2. PF1 red led is for
charging pump and PF2 blue led is for discharging pump.
base 1k ohm and TM4C123GH6PM board’s PF1 and PF2 pins separately for different air pumps..
At the end of this integration part the whole system worked successfully and pressure was controlled in the
desired range.
Figure 3.1 Scheme of Air Pump Driving with Transistor
Results:
The system was successfully able to continuously sense the air pressure inside the container and maintain it
within the predefined range using the filling and discharge pumps. The Nokia 5110 LCD displayed the current
pressure and the pressure range, and the on-board RGB LEDs accurately indicated the status of the air pumps.
The system was able to respond to user inputs through the pushbuttons and GPIO.
Conclusion:
The air pressure level controller system was able to meet the objectives of the project. It was able to
continuously sense the air pressure inside a container, maintain it within a predefined range using two micro air
pumps, and provide a user interface to display the current pressure and the pressure range, as well as the status
of the air pumps. The system was able to function accurately and reliably, and could be used in a variety of
applications where precise control of air pressure is required.
