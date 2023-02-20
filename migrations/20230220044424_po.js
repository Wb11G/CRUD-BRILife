const { tables } = require('../config')

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable(tables.po, function (table) {
        table.increments();

        table.string("kt_trans", 5).unique().notNullable();
        table.date("tgl_trans").defaultTo(knex.fn.now());
        table
            .string("kd_sup")
            .notNullable()
            .references("kd_sup")
            .inTable(tables.suplier);
        table.string("userid").notNullable();
        table.integer("total_item").defaultTo(0);
        table.integer("total_harga").defaultTo(0);
        table.integer("discount").defaultTo(0);

        table.timestamp("created_at").defaultTo(knex.fn.now());
        table.timestamp("updated_at").defaultTo(knex.fn.now());

        //-> Indexing
        table.index(["kt_trans"], "kt_trans_idx");
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable(tables.po);
};
