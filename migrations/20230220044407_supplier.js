const { tables } = require('../config')

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable(tables.suplier, function (table) {
        table.increments();

        table.string("kd_sup", 5).unique().notNullable();
        table.string("nama_sup").notNullable();
        table.string("alamat").notNullable();
        table.string("kota").notNullable();
        table.string("telp").notNullable();
        table.string("email").notNullable();
        table.string("pic").notNullable();

        table.timestamp("created_at").defaultTo(knex.fn.now());
        table.timestamp("updated_at").defaultTo(knex.fn.now());

        //-> Indexing
        table.index(["kd_sup"], "kd_sup_idx");
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTable(tables.suplier);
};
