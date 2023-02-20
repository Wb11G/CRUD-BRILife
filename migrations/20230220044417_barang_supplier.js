const { tables } = require('../config')

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable(tables.barang_suplier, function (table) {
        table.increments();

        table
            .string("kd_sup")
            .notNullable()
            .references("kd_sup")
            .inTable(tables.suplier);
        table
            .string("kd_brg")
            .notNullable()
            .references("kd_brg")
            .inTable(tables.barang);
        table.integer("harga").defaultTo(0);
        table.integer("discount").defaultTo(0);

        table.timestamp("created_at").defaultTo(knex.fn.now());
        table.timestamp("updated_at").defaultTo(knex.fn.now());
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable(tables.barang_suplier);
};
