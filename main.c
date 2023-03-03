#include "TM4C123GH6PM.h"
#include <stdint.h>
#include <stdio.h>
#include "TM4C123GH6PM.h"
#include <stdlib.h>
#include <time.h>
#include "stdio.h"

extern void SAYI(void);
extern void INIT_NOKIA(void);
extern void DRAW_MAP(void);
extern void CONFIG_NOKIA(void);
extern void BASAMAK(void);




// potantiometer
void setupGPIOEandADC(void);
extern void OutStr(char*);
void timer0A_delayMs(int ttime);
void setupGPIOE(void);
char array[100];
float value;
float offset_removed_value;
char array[100];
float min=0;
float max=0;
int range=10;
int deneme2;
int a;
int b;
int c;


unsigned short dig_T1=27504;
short dig_T2=26435;
short dig_T3= -1000;
unsigned short dig_P1=36477;
short dig_P2=-10685;
short dig_P3=3024;
short dig_P4=2855;
short dig_P5=140;
short dig_P6=-7;
short dig_P7=15500;
short dig_P8=-14600;
short dig_P9=6000;


double T;
double P;



// potentiometer

void timer0A_delayMs(int ttime)
{
 int i;
 SYSCTL->RCGCTIMER |= 1; /* enable clock to Timer Block 0 */
 TIMER0->CTL = 0; /* disable Timer before initialization */
 TIMER0->CFG = 0x04; /* 16-bit option */
 TIMER0->TAMR = 0x02; /* periodic mode and down-counter */
 TIMER0->TAILR = 16000 - 1; /* Timer A interval load value register */
 TIMER0->ICR = 0x1; /* clear the TimerA timeout flag*/
 TIMER0->CTL |= 0x01; /* enable Timer A after initialization */
 for(i = 0; i < ttime; i++) { while ((TIMER0->RIS & 0x1) == 0) ; /* wait for TimerA timeout flag */
 TIMER0->ICR = 0x1; /* clear the TimerA timeout flag */
 }
}
void setupGPIOEandADC(void)
{
		SYSCTL->RCGCADC |= 0x01;
		
    // Enable the clock for GPIO port E
   SYSCTL->RCGCGPIO |= 0XFF;
		
    // Set PE3 to be an input pin
    GPIOE->DIR &= ~0x08;

    // Set PE3 to be a digital input
    GPIOE->DEN &= ~0x08;

    // Set PE3 to be a analog input
    GPIOE->AMSEL |= 0x08;
		
		//Set PE3 to be Alternate Function
		GPIOE->AFSEL |= 0x08;
		// Disable sequencer 3 while configuring it
		ADC0->ACTSS &= ~0x08;
	  // Set the ADC to trigger a sample from a software trigger
    ADC0->EMUX= ~0xF000;
	  // Select channel AIN0 for the first sample of sequencer 3
    ADC0->SSMUX3 &= ~0x0F;
	  // Set sequencer 3 to only take one sample
    ADC0->SSCTL3 |= 0x06;
	  // Set the ADC to sample at 125 ksps
    ADC0->PC |= 0x01;
	  //clear interrupt flag
	  ADC0->ISC |= 0x08;
	  // Enable sequencer 3
	  ADC0->ACTSS |= 0x08;
	
}

void read_ADC(){

	ADC0->PSSI |= 0x08;
        // Poll the interrupt flags in the RIS register to check
        // when the sample is ready
        if (ADC0->RIS & 0x08)
        {
           
            value = ADC0->SSFIFO3;
						offset_removed_value= value;  
					  min=	offset_removed_value;
					  max=	offset_removed_value;
					/*
						if(1000>offset_removed_value && offset_removed_value>=100){
						sprintf(array, "%f", offset_removed_value);     //answer for q3
						array[3] = '\r';
						array[4] = '\4'; 
						OutStr(array); 
						}
						else if(offset_removed_value>=1000){
						sprintf(array, "%f\n\4", offset_removed_value);     //answer for q3
						array[4] = '\r';
						array[5] = '\4'; 
						OutStr(array); 
							
						}
						else if(100>offset_removed_value && offset_removed_value>=10){
						sprintf(array, "%g", offset_removed_value);     //answer for q3
						array[2] = '\r';
						array[3] = '\4'; 
						OutStr(array); 
							
						}
						else if(10>offset_removed_value){
						array[1] = '\r';
						array[2] = '\4'; 
						OutStr(array); 
							
						}
						*/
						
					  timer0A_delayMs(100);   //1 sec delay
						
						

    }
}

// potentiometer




// led

void initLED(void)
{
    // Enable the clock for the GPIOF port
    SYSCTL->RCGCGPIO|= 0x20;  // Set bit 5 of SYSCTL_RCGCGPIO_R to 1
		while (!SYSCTL->PRGPIO)
		{}
		
    // Set the LED pins (PF1, PF2, PF3) as output pins
    GPIOF->DIR|= 0x0E;  // Set bits 1, 2, and 3 of GPIO_PORTF_DIR_R to 1
		GPIOF->AFSEL &= ~(0x0E);
		GPIOF->PCTL	&= ~(0xFFFFFFFF);	// Enable digital function for the LED pins
		GPIOF->AMSEL &= ~(0x0E);
    GPIOF->DEN |= 0x0E;  // Set bits 1, 2, and 3 of GPIO_PORTF_DEN_R to 1
}


void red_light_on_others_off(){
		GPIOF->DATA &= ~0x0E;  // Set the output of pin PF1 (red LED) to low
		GPIOF->DATA|= 0x02;  // Set the output of pin PF2 (blue LED) to high

    //GPIOF->DATA &= ~0x08;  // Set the output of pin PF3 (green LED) to low

 
}

void blue_light_on_others_off(){
	GPIOF->DATA &= ~0x0E;  // Set the output of pin PF1 (red LED) to low
  GPIOF->DATA|= 0x04;  // Set the output of pin PF2 (blue LED) to high
    
    //GPIOF->DATA &= ~0x08;  // Set the output of pin PF3 (green LED) to low

 
}


void green_light_on_others_off(){
	GPIOF->DATA&= ~0x0E;  // Set the output of pin PF1 (red LED) to low
   GPIOF->DATA |= 0x08;  // Set the output of pin PF3 (green LED) to high
     
     //GPIOF->DATA &= ~0x04;  // Set the output of pin PF2 (blue LED) to low

}


// led finished







char I2C3_Write_Multiple(int slave_address, char slave_memory_address, int bytes_count, char* data);

char I2C3_read_Multiple(int slave_address, char slave_memory_address, int bytes_count, char* data);

static int I2C_wait_till_done(void)
{
    while(I2C3->MCS & 1);   /* wait until I2C master is not busy */
    return I2C3->MCS & 0xE; /* return I2C error code, 0 if no error*/
}


char I2C3_Write_Multiple(int slave_address, char slave_memory_address, int bytes_count, char* data)
{   
    char error;
    if (bytes_count <= 0)
        return -1;                  /* no write was performed */
    /* send slave address and starting address */
    I2C3->MSA = slave_address << 1;
    I2C3->MDR = slave_memory_address;
    I2C3->MCS = 3;                  /* S-(saddr+w)-ACK-maddr-ACK */

    error = I2C_wait_till_done();   /* wait until write is complete */
    if (error) return error;

    /* send data one byte at a time */
    while (bytes_count > 1)
    {
        I2C3->MDR = *data++;             /* write the next byte */
        I2C3->MCS = 1;                   /* -data-ACK- */
        error = I2C_wait_till_done();
        if (error) return error;
        bytes_count--;
    }
    
    /* send last byte and a STOP */
    I2C3->MDR = *data++;                 /* write the last byte */
    I2C3->MCS = 5;                       /* -data-ACK-P */
    error = I2C_wait_till_done();
    while(I2C3->MCS & 0x40);             /* wait until bus is not busy */
    if (error) return error;
    return 0;       /* no error */
}


char I2C3_read_Multiple(int slave_address, char slave_memory_address, int bytes_count, char* data)
{
    char error;
    
    if (bytes_count <= 0)
        return -1;         /* no read was performed */

    /* send slave address and starting address */
    I2C3->MSA = slave_address << 1;
    I2C3->MDR = slave_memory_address;
    I2C3->MCS = 3;       /* S-(saddr+w)-ACK-maddr-ACK */
    error = I2C_wait_till_done();
    if (error)
        return error;

    /* to change bus from write to read, send restart with slave addr */
    I2C3->MSA = (slave_address << 1) + 1;   /* restart: -R-(saddr+r)-ACK */

    if (bytes_count == 1)             /* if last byte, don't ack */
        I2C3->MCS = 7;              /* -data-NACK-P */
    else                            /* else ack */
        I2C3->MCS = 0xB;            /* -data-ACK- */
    error = I2C_wait_till_done();
    if (error) return error;

    *data++ = I2C3->MDR;            /* store the data received */

    if (--bytes_count == 0)           /* if single byte read, done */
    {
        while(I2C3->MCS & 0x40);    /* wait until bus is not busy */
        return 0;       /* no error */
    }
 
    /* read the rest of the bytes */
    while (bytes_count > 1)
    {
        I2C3->MCS = 9;              /* -data-ACK- */
        error = I2C_wait_till_done();
        if (error) return error;
        bytes_count--;
        *data++ = I2C3->MDR;        /* store data received */
    }

    I2C3->MCS = 5;                  /* -data-NACK-P */
    error = I2C_wait_till_done();
    *data = I2C3->MDR;              /* store data received */
    while(I2C3->MCS & 0x40);        /* wait until bus is not busy */
    
    return 0;       /* no error */
}



void I2C3_Init ( void )
{
SYSCTL->RCGCGPIO  |= 0x00000008 ; // Enable the clock for port D
SYSCTL->RCGCI2C   |= 0x00000008 ; // Enable the clock for I2C 3
GPIOD->DEN |= 0x03; // Assert DEN for port D
// Configure Port D pins 0 and 1 as I2C 3      IMPORTANTT!!!!!! D0 IS SCL and D1 IS SDA
GPIOD->AFSEL |= 0x00000003 ;
GPIOD->PCTL |= 0x00000033 ;
GPIOD->ODR |= 0x00000002 ; // SDA (PD1 ) pin as open darin
I2C3->MCR  = 0x0010 ; // Enable I2C 3 master function
/* Configure I2C 3 clock frequency
(1 + TIME_PERIOD ) = SYS_CLK /(2*
( SCL_LP + SCL_HP ) * I2C_CLK_Freq )
TIME_PERIOD = 16 ,000 ,000/(2(6+4) *100000) - 1 = 7 */
I2C3->MTPR  = 0x07 ;
}







int main() {

	setupGPIOEandADC();
	

	//timer0A_delayMs(100);
	

	

	INIT_NOKIA();
	CONFIG_NOKIA();
	NokiaClear();
	DRAW_MAP();
	
	int deneme;
	
	char varx, vary;
  double sum=0;
	double average=0;
	int avg=0;
	int i = 0;
	


	
	long signed int t_fine;
	int32_t value = 0;
	int32_t pressure_value = 0;
	uint8_t val3 = 0b00000000; // 4 bits
	short number;
	signed int asd;
	double var1,var2;
	 I2C3_Init();
	 char data[2] = {0x00,0x27};
I2C3_Write_Multiple(0x77, 0xF5, 1, data);
I2C3_Write_Multiple(0x77, 0xF4, 1, data+1);
	 
	initLED();
GPIOF->DATA |= 0x0E;
GPIOF->DATA &= ~(0x0C);
	 
	while(1){
		
		
			
		
		read_ADC();
		
		
		a=min;
		b=max;
		c=min;
		//	Print
		
		c=c/10;
		c+=800;
		
		a=a/10;
		a+=750;
		
		b=b/10;
		b+=850;
		
		deneme2=a;
		if(deneme2<1000)
		{
				ONEONE();
				BOS();
		}
		else
		{
				deneme2 = deneme2/1000;
				ONEONE();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		}
		deneme2=a;
		deneme2 = deneme2/100;
		deneme2 = deneme2%10;
		
				ONETWO();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		
		deneme2=a;
		deneme2 = deneme2/10;
		deneme2 = deneme2%10;

				ONETHREE();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		
		deneme2=a;
		deneme2 = deneme2%10;

				ONEFOUR();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		
		// print max value
				
				deneme2=b;

		if(deneme2<1000)
		{
				TWOONE();
				BOS();
		}
		else
		{
				deneme2 = deneme2/1000;
				TWOONE();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		}
		deneme2=b;
		deneme2 = deneme2/100;
		deneme2 = deneme2%10;
		
				TWOTWO();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		
		deneme2=b;
		deneme2 = deneme2/10;
		deneme2 = deneme2%10;

				TWOTHREE();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		
		deneme2=b;
		deneme2 = deneme2%10;

				TWOFOUR();
				if(deneme2==0)
				{
					ZERO();
				}
				if(deneme2==1)
				{
					ONE();
				}
				if(deneme2==2)
				{
					TWO();
				}
				if(deneme2==3)
				{
					THREE();
				}
				if(deneme2==4)
				{
					FOUR();
				}
				if(deneme2==5)
				{
					FIVE();
				}
				if(deneme2==6)
				{
					SIX();
				}
				if(deneme2==7)
				{
					SEVEN();
				}
				if(deneme2==8)
				{
					EIGHT();
				}
				if(deneme2==9)
				{
					NINE();
				}
		
		
		
		
		
		
		while(i!=256)
		{
		 //varx=I2C3_read_Multiple(0X76, 0xFB, 1,  data); // LSB
		  I2C3_read_Multiple(0x77, 0XFA, 2,  data); // MSB
		 
		
		
		  value =(uint32_t) (data[0] << 12) | (data[1] << 4) | val3;

		
		  var1=(((double)value)/16384.0-((double)dig_T1)/1024.0)*((double)dig_T2);
		  var2=((((double)value)/131072.0 - ((double)dig_T1)/8192.0)*(((double)value)/131072.0 - ((double)dig_T1)/8192.0))*((double)dig_T3);
		  t_fine=(long signed int)(var1+var2);
		  T=(var1+var2)/5120.0;
		
		I2C3_read_Multiple(0x77, 0XF7, 2,  data); // MSB
		pressure_value=(uint32_t) (data[0] << 12) | (data[1] << 4) | val3;
		
		
		
		var1=((double)t_fine/2.0)-64000.0;
		var2=var1*var1*((double)dig_P6)/32768.0;
		var2 = var2+var1*((double)dig_P5)*2.0; 
    var2 = (var2/4.0)+(((double)dig_P4)*65536.0);
    var1 = (((double)dig_P3)*var1*var1/524288.0+((double)dig_P2)*var1)/524288.0;
    var1 = (1.0+var1/32768.0)*((double)dig_P1);
    P=1048576.0-(double) pressure_value;
    P=(P-(var2/4096.0))*6250.0/var1;
    var1=((double)dig_P9)*P*P/2147483648.0;
    var2=P*((double)dig_P8)/32768.0;
    P=P+(var1+var2+((double)dig_P7))/16.0;
		//P=P/1000.0;
		sum += P;
		i++;
	}
		
			average = sum / 256.0;
			sum = 0;
			i=0;
		
			avg = average;
			avg=avg/100;
	
			//red_light_on_others_off();
		  // Set the output of pin PF1 (red LED) to low
		//GPIOF->DATA|= 0x02;  // Set the output of pin PF2 (blue LED) to high
	
		if(avg<b && avg>a)
		{
		int ab=3;
			green_light_on_others_off();
			
		}
		if(avg<a)
		{
		// red
			red_light_on_others_off();
		}
		
		if(avg>b)
		{
		// blue
			blue_light_on_others_off();
		}
		
		
		
		
		
		
		//	WRITING;
		
		deneme=average;
		deneme = deneme/100000;
		if(deneme==0)
		{
				THREEONE();
				BOS();
		}
		else
		{
				THREEONE();
				if(deneme==0)
				{
					ZERO();
				}
				if(deneme==1)
				{
					ONE();
				}
				if(deneme==2)
				{
					TWO();
				}
				if(deneme==3)
				{
					THREE();
				}
				if(deneme==4)
				{
					FOUR();
				}
				if(deneme==5)
				{
					FIVE();
				}
				if(deneme==6)
				{
					SIX();
				}
				if(deneme==7)
				{
					SEVEN();
				}
				if(deneme==8)
				{
					EIGHT();
				}
				if(deneme==9)
				{
					NINE();
				}
		}
		
		
		deneme=average;
		deneme = deneme/10000;
		deneme = deneme%10;
		THREETWO();
				if(deneme==0)
				{
					ZERO();
				}
				if(deneme==1)
				{
					ONE();
				}
				if(deneme==2)
				{
					TWO();
				}
				if(deneme==3)
				{
					THREE();
				}
				if(deneme==4)
				{
					FOUR();
				}
				if(deneme==5)
				{
					FIVE();
				}
				if(deneme==6)
				{
					SIX();
				}
				if(deneme==7)
				{
					SEVEN();
				}
				if(deneme==8)
				{
					EIGHT();
				}
				if(deneme==9)
				{
					NINE();
				}
				
				
				deneme=average;
				deneme = deneme/1000;
				deneme = deneme%10;
				THREETHREE();
				if(deneme==0)
				{
					ZERO();
				}
				if(deneme==1)
				{
					ONE();
				}
				if(deneme==2)
				{
					TWO();
				}
				if(deneme==3)
				{
					THREE();
				}
				if(deneme==4)
				{
					FOUR();
				}
				if(deneme==5)
				{
					FIVE();
				}
				if(deneme==6)
				{
					SIX();
				}
				if(deneme==7)
				{
					SEVEN();
				}
				if(deneme==8)
				{
					EIGHT();
				}
				if(deneme==9)
				{
					NINE();
				}
				
				
				
				deneme=average;
				deneme = deneme/100;
				deneme = deneme%10;
				THREEFOUR();
				if(deneme==0)
				{
					ZERO();
				}
				if(deneme==1)
				{
					ONE();
				}
				if(deneme==2)
				{
					TWO();
				}
				if(deneme==3)
				{
					THREE();
				}
				if(deneme==4)
				{
					FOUR();
				}
				if(deneme==5)
				{
					FIVE();
				}
				if(deneme==6)
				{
					SIX();
				}
				if(deneme==7)
				{
					SEVEN();
				}
				if(deneme==8)
				{
					EIGHT();
				}
				if(deneme==9)
				{
					NINE();
				}
		
	
		
		
		
		
	}
	
				
}







