const { tables } = require('../config')

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable(tables.users, function (table) {
        table.increments();

        table.string("user_id").unique().notNullable();
        table.string("password").notNullable();
        table
            .enum("status", ["Y", "N"])
            .defaultTo("Y")
            .notNullable();

        table.timestamp("created_at").defaultTo(knex.fn.now());
        table.timestamp("updated_at").defaultTo(knex.fn.now());

        //-> Indexing
        table.index(["user_id", "password"], "credential_auth_idx");
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable(tables.users);
};
