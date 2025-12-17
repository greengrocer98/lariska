# ZMK config

ZMK config for reverse engineered VGN F1/VXE R1 mouse powered by nrf52840 and PAW3395 sensor. You can also find Adafruit bootloader for this mouse [here](https://github.com/greengrocer98/Adafruit_nRF52_Bootloader).

## Pinout

Full pinout of the mouse if you would like to add additional functionality

| left button       | P0.30 |
| ----------------- | ----- |
| right button      | P0.29 |
| middle button     | P0.28 |
| forward button    | P0.03 |
| back button       | P0.02 |
| LDO enable front💡| P1.02 |
| red front led     | P0.16 |
| green front led   | P0.15 |
| blue front led    | P0.14 |
| motion pin        | P0.07 |
| clock pin         | P0.06 |
| mosi              | P0.05 |
| miso              | P0.04 |
| cs pin            | P0.27 |
| enc A             | P0.00 |
| enc B             | P0.01 |
| voltage divider   | P0.31 |
| TP4056 CHRG       | P0.26 |
| DPI button        | P1.15 |
| LDO enable bottom💡| P1.01 |
| blue bottom led   | P0.21 |
| red bottom led    | P0.24 |
| green bottom led  | P0.22 |

💡 - LDO is used for powering LEDS. It should be enabled through enable pin.
