#!/bin/bash

function task_skeleton_apply()
{
    run rsync --exclude='*.twig' --exclude='_twig' -a /home/node/application/skeleton/ /app/
}
