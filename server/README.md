# GUS server :smile:

## :cloud: environments

- :sushi: ruby 2.6.5
- :train: Rails 6.0.0
- :musical_note: yarn
- :notes: webpacker
- :art: bulma as Style framework
- :dizzy: foreman as Process manager

## Usage

```sh
# Development
bundle exec foreman s -f Procfile.dev

# on Raspberry pi
bundle exec foreman s
```

## :books: API endpoints

APIエンドポイントの概要です．

### `POST /api/weather`

param: none

#### example

```sh
curl -X POST "localhost:3000/api/weather"
```

### `POST /api/umbrella`

param: `umbrella1` `Boolean(0/1)`
- Read from Switch1

param: `umbrella2` `Boolean(0/1)`
- Read from Switch2

#### example

```sh
curl -X POST "localhost:3000/api/umbrella?umbrella1=$(gpio read 28)&umbrella2=$(gpio read 29)"
```

### `POST /api/existence`

param: `exist` `Boolean(0/1)`
- read from Human sensor

#### example

```sh
curl -X POST "localhost:3000/api/existence?exist=$(gpio read 27)"
```


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

### Pin ON/OFF

```sh
gpio write 21 1
gpio write 22 1
gpio write 23 1
gpio write 24 1
gpio write 25 1
gpio write 4 1
gpio write 5 1
```

```sh
gpio write 21 0
gpio write 22 0
gpio write 23 0
gpio write 24 0
gpio write 25 0
gpio write 4 0
gpio write 5 0
```
