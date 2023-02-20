const { tables } = require('../config')

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable(tables.barang, function (table) {
        table.increments();

        table.string("kd_brg", 5).unique().notNullable();
        table.string("nama_brg").notNullable();
        table.string("satuan").notNullable();
        table.integer("qty").defaultTo(0);
        table.integer("harga").defaultTo(0);
        table.integer("stok_min").defaultTo(0);

        table.timestamp("created_at").defaultTo(knex.fn.now());
        table.timestamp("updated_at").defaultTo(knex.fn.now());

        //-> Indexing
        table.index(["kd_brg"], "kd_brg_idx");
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable(tables.barang);
};
