const { tables } = require("../config")

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
    // Deletes ALL existing entries
    await knex(tables.users).del();
    await knex(tables.users).insert([
        {
            id: 1,
            user_id: "BRILife",
            password: "2digit",
        },
    ]);
};