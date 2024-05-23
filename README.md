# Unifi XG Server LED Control Script
[Unifi UAS-XG](https://dl.ubnt.com/datasheets/unifi/UniFi_XG_Server_DS.pdf)

This project contains a Bash script for controlling the status LEDs found on a Unifi XG Server (Model: UAS-XG). The script allows for toggling the individual or multiple LEDs based on user input.

## Features

- Toggle the individual LEDs including the main status LED around the Unifi logo and the HDD tray LEDs.

## Prerequisites

- The UAS-LED .deb file from Ubiquiti's UAS-XG setup ISO.

## Installation

Install the uas-led .deb file:
`sudo dpkg -i uas-led_0.0.1-4_amd64.deb`

Start uas-led as a service:
`sudo systemctl start uas-led`
`sudo systemctl enable uas-led`

## Usage

To run the script, clone this repository and execute the following commands:

`chmod +x led_control.sh`
`sudo ./led_control.sh`

## Notes
- Below are the links to the references detailing where to source the .deb, as well as an introduction to how to change the LEDs without this script.
- Corresponding LEDs with their GPIO pin IDs:
	1 - Main Status LED (RED)
	68 - Main Status LED (BLUE)
	69 - Main Status LED (WHITE)
	17 - Main Status LED (BLINKING WHITE)
	70 - Left Drive Tray LED - (RED)
	6 - Right Drive Tray LED - (RED)
	7 - N/A / UNKNOWN
	71 - N/A / UNKNOWN

GPIO ID information found from the [X10SDV-4C-TLN2F Manual](https://www.supermicro.com/about/policies/disclaimer_manuals.cfm?url=/manuals/motherboard/D/MNL-1726.pdf)

## Special thanks to the following for reference documentation to make the script:
[ssjenkins on the UI Community Forum](https://community.ui.com/questions/Taking-a-UAS-XG-off-the-reservation-with-BIOS-updates-and-XPEnology/077aceba-b6d4-4335-8645-a9eead593732)
[bauerle on the UI Community Forum](https://community.ui.com/questions/UAS-XG-Application-Server-Setup/bf489d60-2a56-4217-bff9-e33e81abcdca)

## Contributing

Contributions are welcome as this is only a script. Please fork the project and submit a pull request for any changes/fixes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
