exports.KnexConfig = {
    client: 'mysql2',
    connection: {
        database: 'DBINVENTORI',
        user: 'root',
        password: ''
    },
    migrations: {
        tableName: 'knex_migrations'
    }
}

exports.tables = {
    barang: "barang",
    suplier: "suplier",
    barang_suplier: "barang_suplier",
    po: "po",
    po_detail: "po_detail",
}