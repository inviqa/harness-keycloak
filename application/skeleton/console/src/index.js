'use strict';
 
let adminClient = require('keycloak-admin-client');
 
let settings = {
  baseUrl: process.env.KEYCLOAK_INTERNAL_URL,
  username: process.env.KEYCLOAK_USER,
  password: process.env.KEYCLOAK_PASSWORD,
  grant_type: 'password',
  client_id: 'admin-cli'
};

(async (settings) => {
    let client = await adminClient(settings);

    console.log('client', client);

    let realms = await client.realms.find();
    console.log('realms', realms);

})(settings);
