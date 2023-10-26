/**
 * @File   :   app.c
 * 
 * @Author : Muhammad Osama Elaraby 
 *
 * Created on October 4, 2023, 12:56 PM
 */


//#include "app.h"
/*
 * 
 */
#include "app.h"
#define _XTAL_FREQ 4000000UL

uint8 ret  = E_OK ; 
    
    led_t led = {
    .port_name = PORTC_INDEX , 
    .pin = PIN0  , 
    .led_status = LOW 
    };
  
    button_t button_high = {.port_name = PORTC_INDEX ,
    .pin = PIN0 ,
    .button_state =BUTTON_ACTIVE_HIGH 
    };
    button_state_t button_st  ; 

int main() {
    pin_config_t  pin  = {
    .direction = GPIO_PIN_INPUT, 
    .port = PORTC_INDEX , 
    .pin= PIN0 ,
    .logic = LOW 
    };
    
    ret =  gpio_pin_intialize(&pin);
    ret =  ecu_led_initialize (&led) ; 
    
    ret =  ecu_led_toggle (&led) ; 
   
    
    //ret =  button_intialize (&button_high) ; 

    /*
    

   if (ret == E_OK)
   {
       while (1)
    {
           button_read_state(&button_high , &button_st);
           if (button_st == BUTTON_PRESSED )
           {
               led_toggle(&led) ; 
               _delay(250);
           }
           else {
               led_off(&led);
               
           }
    }
   }
   else {

        // #error function Erorr Happend 
   }
 
    

    */
    
    return (0);
}

