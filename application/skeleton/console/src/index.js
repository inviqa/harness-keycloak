'use strict';
 
const KcAdmin = require('keycloak-admin');
const url = require('url');
const waitPort = require('wait-port');
 
const settings = {
  baseUrl: process.env.KEYCLOAK_INTERNAL_URL,
};

const auth = {
  username: process.env.KEYCLOAK_USER,
  password: process.env.KEYCLOAK_PASSWORD,
  grantType: 'password',
  clientId: 'admin-cli'
};

function keycloakHealthcheck(targetUrl) {
  const urlParams = url.parse(targetUrl);
  return waitPort({
    host: urlParams.hostname,
    port: parseInt(urlParams.port, 10),
    timeout: 60000
  });
}

(async (settings, auth) => {
  // Wait for Keycloak to be up and running
  await keycloakHealthcheck(settings.baseUrl);

  const adminClient = new KcAdmin.default(settings);

  await adminClient.auth(auth);

  console.log('adminClient', adminClient);

  let realms = await adminClient.realms.find();
  console.log('realms', realms);
})(settings, auth);
