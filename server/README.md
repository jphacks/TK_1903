# GUS server :smile:

## :cloud: environments

- :sushi: ruby 2.6.5
- :train: Rails 6.0.0
- :musical_note: yarn
- :notes: webpacker
- :art: bulma as Style framework
- :dizzy: foreman as Process manager

## :books: endpoints

:construction:

## :zzz: GPIO pins

:construction:

| Connected item | GPIO Number | wiring Pi Numer |
|:--------------:|:-----------:|:---------------:|
| Tape LED Blue  |  5          |  5              |
| Tape LED Red   |  4          |  4              |
| Indicater LED1 | 21          | 21              |
| Indicater LED2 | 22          | 22              |
| Indicater LED3 | 23          | 23              |
| Indicater LED4 | 24          | 24              |
| Indicater LED5 | 25          | 25              |
| Human Sensor   | 27          | 27              |
| Switch1        | 29          | 29              |
| Switch2        | 28          | 28              |

### Pin mode initialization

```sh
gpio mode 4 out
gpio mode 5 out
gpio mode 21 out
gpio mode 22 out
gpio mode 23 out
gpio mode 24 out
gpio mode 25 out
gpio mode 27 in
gpio mode 28 in
gpio mode 29 in
```
