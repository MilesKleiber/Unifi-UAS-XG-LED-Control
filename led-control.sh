#!/bin/bash

# LED status variables
main_status_color="OFF"
blinking_status="OFF"
left_hdd_led="OFF"
right_hdd_led="OFF"

# Function to control LED states
# Usage: control_led GPIO_PIN VALUE
# GPIO_PIN - The GPIO pin number
# VALUE - '0' for OFF, '1' for ON, reversed for blinking
control_led() {
    /usr/sbin/intelgpio $1 1 $2
}

# Function to print current LED settings
print_current_settings() {
    echo ""
    echo "UAS-XG LEDs set to:"
    echo "Status LED: $main_status_color"
    if [ "$main_status_color" != "OFF" ] && [ "$blinking_status" == "ON" ]; then
        echo "Blinking: ON"
    else
        echo "Blinking: OFF"
    fi
    echo "Left HDD Tray LED: $left_hdd_led"
    echo "Right HDD Tray LED: $right_hdd_led"
    echo ""
}

# Main menu function
show_menu() {
    echo "Select an LED action:"
    echo "1. Toggle Main Status LED - RED"
    echo "2. Toggle Main Status LED - BLUE"
    echo "3. Toggle Main Status LED - WHITE"
    echo "4. Toggle Main Status LED - RED with Blinking WHITE"
    echo "5. Toggle Main Status LED - BLUE with Blinking WHITE"
    echo "6. Toggle Main Status LED only Blinking WHITE"
    echo "7. Turn ALL Main Status LEDs OFF"
    echo "8. Toggle Left HDD Tray LED - RED"
    echo "9. Toggle Right HDD Tray LED - RED"
    echo "10. Exit"
}

# Function to handle user input and control LEDs
handle_user_input() {
    local choice
    echo ""
    read -p "Enter your choice [1-10]: " choice
    case $choice in
        1) main_status_color="RED"; blinking_status="OFF"; control_led 1 1; control_led 68 0; control_led 69 0; control_led 17 1;;
        2) main_status_color="BLUE"; blinking_status="OFF"; control_led 1 0; control_led 68 1; control_led 69 0; control_led 17 1;;
        3) main_status_color="WHITE"; blinking_status="OFF"; control_led 1 0; control_led 68 0; control_led 69 1; control_led 17 1;;
        4) main_status_color="RED"; blinking_status="ON"; control_led 1 1; control_led 68 0; control_led 69 0; control_led 17 0;;
        5) main_status_color="BLUE"; blinking_status="ON"; control_led 1 0; control_led 68 1; control_led 69 0; control_led 17 0;;
        6) main_status_color="OFF"; blinking_status="ON"; control_led 1 0; control_led 68 0; control_led 69 0; control_led 17 0;;
        7) main_status_color="OFF"; blinking_status="OFF"; control_led 1 0; control_led 68 0; control_led 69 0; control_led 17 1;;
        8) 
            if [ "$left_hdd_led" == "OFF" ]; then
                left_hdd_led="ON"
                control_led 70 1
            else
                left_hdd_led="OFF"
                control_led 70 0
            fi;;
        9) 
            if [ "$right_hdd_led" == "OFF" ]; then
                right_hdd_led="ON"
                control_led 6 1
            else
                right_hdd_led="OFF"
                control_led 6 0
            fi;;
        10) exit 0;;
        *) echo "Invalid choice. Please select a valid number [1-10].";;
    esac
    print_current_settings
}

# Main loop
while true
do
    show_menu
    handle_user_input
done
