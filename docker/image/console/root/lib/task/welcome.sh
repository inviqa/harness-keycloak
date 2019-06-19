#!/bin/bash

function task_welcome()
{
    echo ""
    echo "Welcome!"
    echo "--------"
    echo "URL: https://${APP_HOST}"
    echo "Admin: https://${APP_HOST}/auth/admin/master/console"
    echo "  Username: ${KEYCLOAK_USER}"
    echo "  Password: ${KEYCLOAK_PASSWORD}"
    echo ""
}
