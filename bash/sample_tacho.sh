#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No arguments supplied. Please put number of chosen motor (for example 1 for /sys/class/tacho-motor/motor1)."
    exit 1
fi

export MC=/sys/class/tacho-motor/motor$1

echo "Running 50% forward for 5 secs."
echo reset > $MC/command
echo 50 > $MC/duty_cycle_sp #fixme: this should be changed after kernel update
echo run-forever > $MC/command
sleep 5
echo stop > $MC/command

echo "Running 50% backward for 5 secs."
echo reset > $MC/command
echo -50 > $MC/duty_cycle_sp #fixme: this should be changed after kernel update
echo run-forever > $MC/command
sleep 5
echo stop > $MC/command

echo "Run timed for 10 seconds."
echo 10000 > $MC/time_sp
echo 100 > $MC/duty_cycle_sp
echo run-timed > $MC/command
sleep 10

echo 0 > $MC/duty_cycle_sp
echo "End."
