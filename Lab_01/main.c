/*
 * It is just simple and pure template project
 * It does absolutely nothing and indicates that toolchain
 * is installed correctly.
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"

static void rcc_config()
{
    /* Set FLASH latency */
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_0LAT_DELAY1LAT)
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_0);
#else
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);
#endif

    /* Enable HSI and wait for activation*/
    LL_RCC_HSI_Enable();
    while (LL_RCC_HSI_IsReady() != 1);

    /* Main PLL configuration and activation */
    LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                LL_RCC_PLL_MUL_12);

    LL_RCC_PLL_Enable();
    while (LL_RCC_PLL_IsReady() != 1);

    /* Sysclk activation on the main PLL */
    LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    /* Set APB1 prescaler */
    LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

    /* Update CMSIS variable (which can be updated also
     * through SystemCoreClockUpdate function) */
    SystemCoreClock = 48000000;
}

static void gpio_config(void){
//rcc on the port B
	LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
	LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_4, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_5, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_6, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_7, LL_GPIO_MODE_OUTPUT);
//---------------------------------------------------------------
//rcc on the port A
	LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
	LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);

//---------------------------------------------------------------
//rcc on the port C
	LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);

	LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
	LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
	LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
	LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);

	LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
	return;
}

__attribute__((naked)) static void delay(void)
{
    asm ("push {r7, lr}");
    asm ("ldr r6, [pc, #8]");
    asm ("sub r6, #1");
    asm ("cmp r6, #0");
    asm ("bne delay+0x4");
    asm ("pop {r7, pc}");
    asm (".word 30000");
}

#define A LL_GPIO_PIN_0
#define B LL_GPIO_PIN_1
#define C LL_GPIO_PIN_2
#define D LL_GPIO_PIN_3
#define E LL_GPIO_PIN_4
#define F LL_GPIO_PIN_5
#define G LL_GPIO_PIN_6

#define POS0 LL_GPIO_PIN_0
#define POS1 LL_GPIO_PIN_1
#define POS2 LL_GPIO_PIN_2
#define POS3 LL_GPIO_PIN_3


static const int32_t MASKB = A|B|C|D|E|F|G;
static const int32_t MASKC = POS0|POS1|POS2|POS3;

static const uint32_t DECODER[] = {
	A | B | C | D | E | F,		//0
	B | C,						//1
	A | B | G | E | D,			//2
	A | B | G | C | D,			//3
	B | C | G | F,				//4
	A | F | G | C | D,			//5
	A | C | D | E | F | G,		//6
	A | B | C,					//7
	A | B | C | D | E | F | G,	//8
	A | B | C | D |	F | G,		//9
	A | B | C | E | F | G,		//A
	C | D | E | F | G,			//b
	A | D | E | F,				//C
	B | C | D | E |	G,			//d
	A | D | E | F | G,			//E
	A | E | F | G,				//F
	0							//NaN
};

const uint32_t POSITIONS[] = 
{
	POS1|POS2|POS3,
	POS0|POS2|POS3,
	POS0|POS1|POS3,
	POS0|POS1|POS2
};

uint32_t digit_num = 0;

// Code for dynamic display on 7-segment indicator
void dyn_display(uint32_t number)
{
    uint32_t outb = 0;
    uint32_t outc = 0;

    outb = LL_GPIO_ReadOutputPort(GPIOB);
    outc = LL_GPIO_ReadOutputPort(GPIOC);

    LL_GPIO_WriteOutputPort(GPIOC, (outc & ~MASKC) |POS0|POS1|POS2|POS3);

    int step = digit_num * 4;

    outb = (outb & ~MASKB) | DECODER[(number & (0x000F << step)) >> step];
    outc = (outc & ~MASKC) | POSITIONS[digit_num];

    LL_GPIO_WriteOutputPort(GPIOB, outb);
    LL_GPIO_WriteOutputPort(GPIOC, outc);

    digit_num = (digit_num + 1) % 4;
}

#undef A
#undef B
#undef C
#undef D
#undef E
#undef F
#undef G

#undef POS0
#undef POS1
#undef POS2
#undef POS3

int main(void)
{
	// Start clock functions
    rcc_config();
    gpio_config();
	
	// Number at start
    uint32_t num = 0;
	
	// Status of the button
    uint32_t status = 0;
    uint32_t dstatus = 0;
    // Previous status of the button
    int prev = 0;
	// Number of clicks on the button
    uint32_t clicks = 0;
    uint32_t dclicks = 0;
	
	//--------------------------------------------------------------
    LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);
    
	while(1){
		dyn_display(num);
		status = LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_0);
		if((prev == 0) && (status == 1)){
			clicks++;
			delay();
		}
		if(clicks >= 10){
			num++;
			LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
			prev = 1;
			status = 0;
			clicks = 0;
		}
		if(prev){
			if (!LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_0)){
				dstatus = 1;
	        }
	        if(dstatus){
	        	dclicks++;
	        	delay();
	        }
	        if(dclicks >= 10){
	        	prev = 0;
	        	dclicks = 0;
	        	dstatus = 0;
	        }
	    }
	}
	return 0;
}