#!/bin/bash

function task_overlay_apply()
{
    run rsync --exclude='*.twig' --exclude='_twig' -a /home/node/application/overlay/ /app/
}
