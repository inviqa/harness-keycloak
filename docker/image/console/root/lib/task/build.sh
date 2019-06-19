#!/bin/bash

function task_build()
{
    if [ ! -f /app/README.md ]; then
        task "skeleton:apply"
    fi

    task "overlay:apply"
    
    task "build:backend"
    task "build:frontend"
}
