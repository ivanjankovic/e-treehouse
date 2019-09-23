const bcrypt = require('bcrypt');
const colors = require('colors')

const saltRounds = 10;
let unsecurePlainTextPassword = 'password'

bcrypt.genSalt(saltRounds, function(err, salt) {
    bcrypt.hash(unsecurePlainTextPassword, salt, function(err, hash) {
        console.log(hash.green)
    });
});