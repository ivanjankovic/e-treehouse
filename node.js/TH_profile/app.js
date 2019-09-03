

const profile = require('./profile')
// const users = ['ivanjankovic', 'ivanjankovic2']
const users = process.argv.slice(2)
users.forEach(profile.get)
