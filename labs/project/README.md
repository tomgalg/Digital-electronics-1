
# Project: UART transmitter

### Popis zadania
Úlohou bolo navrhnúť UART (Universal asynchronous receiver/transmitter) vysielač s nastaviteľnými parametrami UART rámca, dátového slova a voľby jednej z dvoch prednastavených štandardných symbolových rýchlostí za chodu aplikácie. Bola predpokladaná implementácia top vrstvy na CoolRunner-II CPLD starter board. 

### Popis implementácie

TBD

### Moduly

TBD


### Code description

TBD


### Schéma zapojenia


![](resources/Tx_top_scheme.png)
<p align="center">
  Obr. Schéma zapojenia top vrstvy.
</p>

### Výsledky

![](resources/tb_top.PNG)
<p align="center">Obr. Časový priebeh simulácie transmitteru.</p>

![](resources/clock_enable_TB.PNG)
<p align="center">Obr. Prepínanie znakovej rýchlosti.</p>

![](resources/tb_paritysw_LOW.PNG)
<p align="center">Obr. Lichá parita.</p>

![](resources/tb_paritysw_HIGH.PNG)
<p align="center">Obr. Sudá parita.</p>



### Zdrojové súbory

* [MUX.vhd](/MUX/MUX.vhd)
* [tb_MUX.vhd](/MUX/tb_MUX.vhd)
* [clock_enable.vhd](/clock_enable/clock_enable.vhd)
* [tb_clock_enable.vhd](/clock_enable/tb_clock_enable.vhd)
* [parity_bit.vhd](/parity_bit/parity_bit.vhd)
* [tb_parity_bit.vhd](/parity_bit/tb_parity_bit.vhd)
* [clk_counter.vhd](/CLK_counter/clk_counter.vhd)
* [tb_clk_counter.vhd](/CLK_counter/tb_clk_counter.vhd)


### Zdroje

* Prednášky z predmetu Digitální Elektronika 1, návody a zdrojové súbory k cvičeniam od p. doc. Frýzy
* <https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter>




Made by Filip Paul, Tomáš Galgánek
