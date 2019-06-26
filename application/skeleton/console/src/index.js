'use strict';
 
const KcAdmin = require('keycloak-admin');
 
const settings = {
  baseUrl: process.env.KEYCLOAK_INTERNAL_URL,
};

const auth = {
  username: process.env.KEYCLOAK_USER,
  password: process.env.KEYCLOAK_PASSWORD,
  grantType: 'password',
  clientId: 'admin-cli'
};

(async (settings, auth) => {
    const adminClient = new KcAdmin.default(settings);

    await adminClient.auth(auth);

    console.log('adminClient', adminClient);

    let realms = await adminClient.realms.find();
    console.log('realms', realms);

})(settings, auth);
