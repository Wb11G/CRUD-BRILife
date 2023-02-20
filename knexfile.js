// Update with your config settings.

const config = require('./config')

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */
module.exports = {

  development: config.KnexConfig,

};
