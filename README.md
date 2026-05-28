# Mosquitto Broker — Home Assistant Add-on

Eclipse Mosquitto MQTT Broker в виде дополнения для Home Assistant. Создано специально для **SONOFF iHost** (armv7), где стандартный Mosquitto Broker из магазина недоступен.

## Зачем

iHost от SONOFF работает на armv7 и не имеет доступа к стандартным дополнениям HA Community. Этот add-on решает проблему — MQTT брокер устанавливается в один клик через магазин дополнений.

Docker-образы собираются через GitHub Actions и публикуются в GitHub Container Registry (ghcr.io), что обеспечивает доступность из регионов с блокировками Docker Hub.

## Поддерживаемые архитектуры

| Архитектура | Устройства |
|-------------|-----------|
| armv7 | SONOFF iHost |
| aarch64 | Raspberry Pi 4/5, HA Yellow |
| amd64 | Intel NUC, VM |

## Установка

1. Home Assistant → **Settings → Add-ons → Add-on Store**
2. Нажми **⋮** (три точки, правый верхний угол) → **Repositories**
3. Добавь URL: `https://github.com/seoeaa/ha-mosquitto-addon`
4. В магазине появится **Mosquitto Broker** → **Install** → **Start**

## Конфигурация

По умолчанию:
- Порт: **1883**
- `allow_anonymous: true`
- Persistence включена

Конфигурация хранится в `/config/mosquitto/` и сохраняется между перезапусками.

Для кастомизации — отредактируй файл `mosquitto.conf` через SSH или файловый менеджер HA.

## Технические детали

- **Базовый образ:** `eclipse-mosquitto:2`
- **Сборка:** GitHub Actions (multi-arch build через QEMU + Docker Buildx)
- **Репозиторий образов:** `ghcr.io/seoeaa/ha-mosquitto-addon-{arch}`
- **Автозапуск:** включён (`boot: auto`)

## Структура репозитория

```
├── mosquitto/
│   ├── config.yaml    # Метаданные HA add-on
│   ├── Dockerfile     # Docker-образ на базе eclipse-mosquitto:2
│   └── run.sh         # Точка входа, генерация конфига при первом запуске
├── .github/
│   └── workflows/
│       └── build.yml  # CI: сборка и пуш образов для armv7/aarch64/amd64
├── repository.json    # Регистрация в HA Add-on Store
└── README.md
```

## Лицензия

MIT
