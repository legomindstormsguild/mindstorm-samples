import ev3dev.ev3 as ev3
import time

m = ev3.LargeMotor('outA')

print("Run full speed forward till stop for 5 seconds")
m.run_forever(duty_cycle_sp=100)
time.sleep(5)
m.stop()

print("Run full speed backward till stop for 5 seconds")
m.run_forever(duty_cycle_sp=-100)
time.sleep(5)
m.stop()

print("Run timed for 5 seconds")
m.run_timed(time_sp=5000, duty_cycle_sp=50)
time.sleep(5)

ev3.Sound.speak('LEGO Mindstorms!').wait()

