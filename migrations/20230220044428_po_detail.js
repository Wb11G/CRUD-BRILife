const { tables } = require('../config')

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable(tables.po_detail, function (table) {
        table.increments();

        table
            .string("kt_trans")
            .notNullable()
            .references("kt_trans")
            .inTable(tables.po);
        table
            .string("kd_brg")
            .notNullable()
            .references("kd_brg")
            .inTable(tables.barang);

        table.integer("qty").defaultTo(0);
        table.integer("harga").defaultTo(0);
        table.integer("discount").defaultTo(0);
        table.integer("total_discount").defaultTo(0);

        table.timestamp("created_at").defaultTo(knex.fn.now());
        table.timestamp("updated_at").defaultTo(knex.fn.now());
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable(tables.po_detail);
};
