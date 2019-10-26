import RPi.GPIO as GPIO
from gpio_controller import GpioController
import config

human_sensor_pin_number = config.HUMAN_SENSOR_PIN_NUMBER
controller = GpioController()


# 人間か？
def is_human(pin_number = human_sensor_pin_number):
    controller.cleanup_pin(pin_number)
    controller.setup_pin_in_mode(pin_number)
    gpio_input = controller.read_pin_input(pin_number)
    if gpio_input == GPIO.HIGH:
        return True
    else:
        return False