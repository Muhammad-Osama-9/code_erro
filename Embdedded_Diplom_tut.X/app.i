# 0 "app.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "app.c"
# 14 "app.c"
# 1 "app.h" 1
# 11 "app.h"
# 1 "ECU_layer/Button/button.h" 1
# 10 "ECU_layer/Button/button.h"
# 1 "ECU_layer/Button/../../MCAL_layer/GPIO/HAL_GPIO.h" 1




# 1 "ECU_layer/Button/../../MCAL_layer/GPIO/../mcal_std_libraries.h" 1
# 10 "ECU_layer/Button/../../MCAL_layer/GPIO/../mcal_std_libraries.h"
# 1 "ECU_layer/Button/../../MCAL_layer/GPIO/../compiler.h" 1
# 11 "ECU_layer/Button/../../MCAL_layer/GPIO/../mcal_std_libraries.h" 2
# 1 "ECU_layer/Button/../../MCAL_layer/GPIO/../std_libraries.h" 1
# 19 "ECU_layer/Button/../../MCAL_layer/GPIO/../std_libraries.h"
typedef unsigned char uint8 ;
typedef char sint8 ;
typedef unsigned short uint16 ;
typedef short sint16 ;
typedef unsigned long uint32 ;
typedef long sint32 ;

typedef uint8 std_ReturnType ;
# 12 "ECU_layer/Button/../../MCAL_layer/GPIO/../mcal_std_libraries.h" 2
# 1 "ECU_layer/Button/../../MCAL_layer/GPIO/../device_config.h" 1
# 13 "ECU_layer/Button/../../MCAL_layer/GPIO/../mcal_std_libraries.h" 2
# 6 "ECU_layer/Button/../../MCAL_layer/GPIO/HAL_GPIO.h" 2
# 19 "ECU_layer/Button/../../MCAL_layer/GPIO/HAL_GPIO.h"
typedef enum {
    LOW ,
    HIGH

}logic_t;
typedef enum {
    GPIO_PIN_OUTPUT ,
    GPIO_PIN_INPUT

}direction_t;

typedef enum {
    PIN0 = 0 ,
    PIN1 ,
    PIN2 ,
    PIN3 ,
    PIN4 ,
    PIN5 ,
    PIN6 ,
    PIN7 ,

}pins_t;
typedef enum {
    PORTA_INDEX = 0 ,
    PORTB_INDEX,
    PORTC_INDEX,
    PORTD_INDEX,
    PORTE_INDEX,
}port_index_t;
typedef struct {
   uint8 port :3;
   uint8 pin :3;
   uint8 direction :1;
   uint8 logic :1;
}pin_config_t;



std_ReturnType gpio_pin_direction_initialize (const pin_config_t *_pin_config );
std_ReturnType gpio_pin_get_direction_status (const pin_config_t *_pin_config ,direction_t *dic_stat );
std_ReturnType gpio_pin_intialize (const pin_config_t *_pin_config );
std_ReturnType gpio_pin_write_logic (const pin_config_t *_pin_config ,logic_t logic );
std_ReturnType gpio_pin_read_logic (const pin_config_t *_pin_config ,logic_t *logic );
std_ReturnType gpio_pin_toggle_logic (const pin_config_t *_pin_config );

std_ReturnType gpio_port_direction_initialize (const port_index_t port );
std_ReturnType gpio_port_get_direction_status (const port_index_t port ,direction_t dic_stat );

std_ReturnType gpio_port_read_logic (const port_index_t port , uint8 * logic ) ;
std_ReturnType gpio_port_write_logic (const port_index_t port , uint8 logic ) ;
std_ReturnType gpio_port_toggle_logic (const port_index_t port ) ;
# 11 "ECU_layer/Button/button.h" 2


typedef enum {
    BUTTON_ACTIVE_LOW ,
    BUTTON_ACTIVE_HIGH
}button_active_t;
typedef enum {
    BUTTON_PRESSED ,
    BUTTON_UN_PRESSED
}button_state_t;
typedef struct {
    uint8 port_name :3 ;
    uint8 pin :3 ;
    uint8 button_state :1 ;
    uint8 RESERVED :1 ;
}button_t;


std_ReturnType button_intialize (const button_t *button ) ;
std_ReturnType button_read_state (const button_t *button , button_state_t *button_state ) ;
# 12 "app.h" 2
# 1 "ECU_layer/LED/ecu_led.h" 1
# 11 "ECU_layer/LED/ecu_led.h"
# 1 "ECU_layer/LED/../../MCAL_layer/GPIO/HAL_GPIO.h" 1
# 12 "ECU_layer/LED/ecu_led.h" 2




typedef enum {
    LED_OFF ,
    LED_ON
}led_stats_t;

typedef struct {
    uint8 port_name :3 ;
    uint8 pin :3 ;
    uint8 led_status :1 ;
    uint8 RESERVED :1 ;
}led_t;

std_ReturnType led_initialize (const led_t *led) ;
std_ReturnType led_off (const led_t *led) ;
std_ReturnType led_on (const led_t *led );
std_ReturnType led_toggle (const led_t *led );
# 13 "app.h" 2
# 15 "app.c" 2


uint8 ret = (std_ReturnType)0x01 ;

    led_t led = {
    .port_name = PORTC_INDEX ,
    .pin = PIN0 ,
    .led_status = LOW
    };

    button_t button_high = {.port_name = PORTC_INDEX ,
    .pin = PIN0 ,
    .button_state =BUTTON_ACTIVE_HIGH
    };
    button_state_t button_st ;

int main() {
    pin_config_t pin = {
    .direction = GPIO_PIN_INPUT,
    .port = PORTC_INDEX ,
    .pin= PIN0 ,
    .logic = LOW
    };
       ret = gpio_pin_intialize(&pin);
# 68 "app.c"
    return (0);
}
