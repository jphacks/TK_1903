import RPi.GPIO as GPIO


class GpioController:
    def __init__(self):
        self.setup(GPIO.BCM)
        self.setup_pin_output_mode(26)

    # get mode
    def get_mode(self):
        return GPIO.getmode()

    # set mode
    def setup(self, mode):
        self.cleanup_all_pin()
        GPIO.setmode(mode)

    # digital output
    def setup_pin_output_mode(self, pin_number_or_list):
        GPIO.setup(pin_number_or_list, GPIO.OUT)

    def set_output(self, pin_number_or_list, output):
        GPIO.output(pin_number_or_list, output)

    # analog output
    # pwmは途中で変更できるため、複数の関数からアクセスできるように変数を先に用意した
    pwm_pin_or_pins = {}

    def setup_pin_pwm_mode(self, pin_number, frequency):
        GPIO.setup(pin_number, GPIO.OUT)
        self.pwm_pin_or_pins[pin_number] = GPIO.PWM(pin_number, frequency)

    def start_pwm(self, pin_number, duty_ratio):
        self.pwm_pin_or_pins[pin_number].start(duty_ratio)

    def change_pwm_duty_ratio(self, pin_number, duty_ratio):
        self.pwm_pin_or_pins[pin_number].ChangeFrequency(duty_ratio)

    def stop_pwm(self, pin_number):
        self.pwm_pin_or_pins[pin_number].stop()

    # input
    def setup_pin_in_mode(self, pin_number_or_list):
        GPIO.setup(pin_number_or_list, GPIO.IN)

    def read_pin_input(self, pin_number_or_list):
        pin_input = GPIO.input(pin_number_or_list)
        return pin_input

    # cleanup
    def cleanup_pin(self, pin_number_or_list):
        GPIO.cleanup(pin_number_or_list)

    def cleanup_all_pin(self):
        GPIO.cleanup()