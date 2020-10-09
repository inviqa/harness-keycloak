#!/usr/bin/env bash

main()
{
    passthru ws networks external
    if [ ! -f .my127ws/.flag-built ]; then

        passthru docker-compose down

        if [[ "$HAS_ASSETS" = "yes" ]]; then
            ws assets download
        fi

        $APP_BUILD
        touch .my127ws/.flag-built

    else
        passthru docker-compose up -d
        passthru docker-compose exec -T -u node console app welcome
    fi

    if [[ "$APP_BUILD" = "dynamic" && "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru docker-sync start
    fi
}

dynamic()
{
    # we synchronise then stop docker-sync as leaving it running during the build
    # will often cause it to crash.

    if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
        passthru gem install docker-sync --no-ri --no-rdoc
        passthru docker-sync start
        passthru docker-sync stop
    fi

    ws external-images pull

    passthru docker-compose pull
    passthru docker-compose build --pull console
    passthru docker-compose up -d console

    passthru docker-compose exec -T -u node console app build

    passthru docker-compose build --pull
    passthru docker-compose up -d

    passthru docker-compose exec -T -u node console app init
}

static()
{
    ws app build

    passthru docker-compose up -d
    passthru docker-compose exec -T -u node console app init
}

main
