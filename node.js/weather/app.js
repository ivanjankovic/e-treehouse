const weather = require('./weather')

const query = process.argv.slice(2)[0]

// query: 90201
// query: Clevland_OH
// query: London_England
console.log(query)
weather.get(query)