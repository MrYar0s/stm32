/*
 * This example demonstrates how to use EXTI and System Timer
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_tim.h"

int counter_top = 1000;
int ms = 0;
uint32_t digit = 0;

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */
static void rcc_config()
{
    /* Set FLASH latency */
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

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

#define DOT LL_GPIO_PIN_4

static const int32_t MASKB = A|B|C|D|E|F|G;
static const int32_t MASKC = POS0|POS1|POS2|POS3;

static const uint32_t DECODER[] =
{
    A | B | C | D | E | F,      //0
    B | C,                      //1
    A | B | G | E | D,          //2
    A | B | G | C | D,          //3
    B | C | G | F,              //4
    A | F | G | C | D,          //5
    A | C | D | E | F | G,      //6
    A | B | C,                  //7
    A | B | C | D | E | F | G,  //8
    A | B | C | D | F | G,      //9
    A | B | C | E | F | G,      //A
    C | D | E | F | G,          //b
    A | D | E | F,              //C
    B | C | D | E | G,          //d
    A | D | E | F | G,          //E
    A | E | F | G,              //F
    0                           //NaN
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

    if(digit_num == 3)
        LL_GPIO_WriteOutputPort(GPIOC, outc | DOT);
    else
        LL_GPIO_WriteOutputPort(GPIOC, outc & ~DOT);

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

#undef DOT

/*
 * Configure GPIO
 */
static void gpio_config(void)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_4, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_5, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_6, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_7, LL_GPIO_MODE_OUTPUT);

    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);

    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_4, LL_GPIO_MODE_OUTPUT);

    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);

    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_5, LL_GPIO_MODE_ALTERNATE);
    LL_GPIO_SetPinPull(GPIOA, LL_GPIO_PIN_5, LL_GPIO_PULL_UP);
}

static void systick_config(void)
{
    LL_InitTick(48000000, 1000);
    LL_SYSTICK_EnableIT();
    NVIC_SetPriority(SysTick_IRQn, 1);
}

static void timers_config(void)
{
    LL_GPIO_SetAFPin_0_7(GPIOA, LL_GPIO_PIN_5, LL_GPIO_AF_2);
    LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM2);
    LL_TIM_SetPrescaler(TIM2, 47999);
    LL_TIM_SetCounterMode(TIM2, LL_TIM_COUNTERMODE_UP);
    LL_TIM_EnableIT_UPDATE(TIM2);
    LL_TIM_EnableCounter(TIM2);

    LL_TIM_IC_SetFilter(TIM2, LL_TIM_CHANNEL_CH1, LL_TIM_IC_FILTER_FDIV16_N5);
    LL_TIM_IC_SetPolarity(TIM2, LL_TIM_CHANNEL_CH1, LL_TIM_IC_POLARITY_BOTHEDGE);
    LL_TIM_IC_SetActiveInput(TIM2, LL_TIM_CHANNEL_CH1, LL_TIM_ACTIVEINPUT_DIRECTTI);
    LL_TIM_IC_SetPrescaler(TIM2, LL_TIM_CHANNEL_CH1, LL_TIM_ICPSC_DIV1);
    LL_TIM_CC_EnableChannel(TIM2, LL_TIM_CHANNEL_CH1);
    LL_TIM_GenerateEvent_UPDATE(TIM2);
    LL_TIM_EnableIT_CC1(TIM2);

    NVIC_EnableIRQ(TIM2_IRQn);
    NVIC_SetPriority(TIM2_IRQn, 0);
}

void TIM2_IRQHandler(void)
{
    digit = LL_TIM_IC_GetCaptureCH1(TIM2);
    LL_TIM_ClearFlag_UPDATE(TIM2);
}

void SysTick_Handler(void)
{
    dyn_display(digit);
}

int main(void)
{
    rcc_config();
    gpio_config();
    timers_config();
    systick_config();

    while(1);
    return 0;
}