
# Project: UART transmitter

### Popis zadania
Úlohou bolo navrhnúť UART (Universal asynchronous receiver/transmitter) vysielač s nastaviteľnými parametrami UART rámca, dátového slova a voľby jednej z dvoch prednastavených štandardných symbolových rýchlostí za chodu aplikácie. Bola predpokladaná implementácia top vrstvy na CoolRunner-II CPLD starter board. 

UART (Universal asynchronous receiver/transmitter) je pomenovanie pre zariadenie slúžiace na asynchrónnu sériovú komunikáciu s nastaviteľnými parametrami posielaných dát, možnosťou nastavenia znakovej rýchlosti (baud rate) .

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

* [MUX.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/MUX/MUX.vhd)
* [tb_MUX.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/MUX/tb_MUX.vhd)
* [clock_enable.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/clock_enable/clock_enable.vhd)
* [tb_clock_enable.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/clock_enable/tb_clock_enable.vhd)
* [parity_bit.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/parity_bit/parity_bit.vhd)
* [tb_parity_bit.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/parity_bit/tb_parity_bit.vhd)
* [clk_counter.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/CLK_counter/clk_counter.vhd)
* [tb_clk_counter.vhd](https://github.com/tomgalg/Digital-electronics-1/blob/master/labs/project/CLK_counter/tb_clk_counter.vhd)


### Zdroje

* Prednášky z predmetu Digitální Elektronika 1, návody a zdrojové súbory k cvičeniam od p. doc. Frýzy
* <https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter>




***Made by Filip Paul & Tomáš Galgánek***
