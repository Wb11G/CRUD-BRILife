const express = require('express');
const cors = require('cors')
const helmet = require('helmet')
const morgan = require('morgan')
const knex = require('knex')

const { KnexConfig, tables } = require('./config')

const app = express();

// Database Connection
/**
 * @type {import("knex").Knex}
 */
const Database = knex(KnexConfig);
Database.raw("SELECT 1") // test connection...
    .then(() => {
        console.log("Database connected!");
        app.listen(8080, console.log("Listen at 8080"))
    })
    .catch((e) => {
        console.log("Database not connected!");
        console.error(e);
        process.exit(1);
    });

// ============================================================

// Middlewares
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cors())
app.use(helmet())
app.use(morgan("dev"))

// ============================================================

// Auth Management
app.post("/api/auth/v1/login", async (req, res) => {
    return res.status(200).json({
        //
    })
})

// ============================================================

// Barang Management
app.post("/api/barang/v1/add", async (req, res) => {
    const { kd_brg, nama_brg, satuan, qty, harga, stok_min } = req.body;
    if (!(kd_brg && nama_brg && satuan && qty && harga && stok_min)) {
        return res.status(400).json({
            message: "body is'n complete!"
        })
    }

    const isKdBrgExist = await Database(tables.barang).select("id").where("kd_brg", kd_brg).first()
    if (isKdBrgExist) {
        return res.status(400).json({
            message: "kd_brg sudah ada!"
        })
    }

    await Database(tables.barang).insert({
        kd_brg, nama_brg, satuan, qty, harga, stok_min
    })

    return res.status(200).json({
        message: "success inserted!"
    })
})

app.get("/api/barang/v1/list", async (req, res) => {
    const data = await Database(tables.barang).select("*")
    return res.status(200).json({
        data,
    })
})

app.get("/api/barang/v1/detail/:kd_brg", async (req, res) => {
    const find = await Database(tables.barang).select("*").where("kd_brg", req.params.kd_brg).first()
    if (!find) {
        return res.status(404).json({
            message: "kd_brg tidak ditemukan!",
        })
    }
    return res.status(200).json(find)
})

app.put("/api/barang/v1/edit/:kd_brg", async (req, res) => {
    const kd_brg = req.params.kd_brg
    const { nama_brg, satuan, qty, harga, stok_min } = req.body;
    if (!(nama_brg || satuan || qty || harga || stok_min)) {
        return res.status(400).json({
            message: "tidak ada yang dirubah?"
        })
    }

    const isKdBrgExist = await Database(tables.barang).select("id").where("kd_brg", kd_brg).first()
    if (!isKdBrgExist) {
        return res.status(400).json({
            message: "kd_brg tidak ada!"
        })
    }

    await Database(tables.barang).where("kd_brg", kd_brg).update({
        nama_brg, satuan, qty, harga, stok_min
    })

    return res.status(200).json({
        message: "success updated!"
    })
})

app.delete("/api/barang/v1/remove/:kd_brg", async (req, res) => {
    const kd_brg = req.params.kd_brg

    const isKdBrgExist = await Database(tables.barang).select("id").where("kd_brg", kd_brg).first()
    if (!isKdBrgExist) {
        return res.status(400).json({
            message: "kd_brg tidak ada!"
        })
    }

    await Database(tables.barang).where("kd_brg", kd_brg).delete()

    return res.status(200).json({
        message: "success deleted!"
    })
})










// ============================================================

// Supplier Management
app.post("/api/supplier/v1/add", async (req, res) => {
    const { kd_sup, nama_sup, alamat, kota, telp, email, pic } = req.body;
    if (!(kd_sup && nama_sup && alamat && kota && telp && email && pic)) {
        return res.status(400).json({
            message: "body is'n complete!"
        })
    }

    const isKdSupExist = await Database(tables.suplier).select("id").where("kd_sup", kd_sup).first()
    if (isKdSupExist) {
        return res.status(400).json({
            message: "kd_sup sudah ada!"
        })
    }

    await Database(tables.suplier).insert({
        kd_sup, nama_sup, alamat, kota, telp, email, pic
    })

    return res.status(200).json({
        message: "success inserted!"
    })
})

app.get("/api/supplier/v1/list", async (req, res) => {
    const data = await Database(tables.suplier).select("*")
    return res.status(200).json({
        data,
    })
})

app.get("/api/supplier/v1/detail/:kd_sup", async (req, res) => {
    const find = await Database(tables.suplier).select("*").where("kd_sup", req.params.kd_sup).first()
    if (!find) {
        return res.status(404).json({
            message: "kd_sup tidak ditemukan!",
        })
    }
    return res.status(200).json(find)
})

app.put("/api/supplier/v1/edit/:kd_sup", async (req, res) => {
    const kd_sup = req.params.kd_sup
    const { nama_sup, alamat, kota, telp, email, pic } = req.body;
    if (!(nama_sup || alamat || kota || telp || email || pic)) {
        return res.status(400).json({
            message: "tidak ada yang dirubah?"
        })
    }

    const isKdSupExist = await Database(tables.suplier).select("id").where("kd_sup", kd_sup).first()
    if (!isKdSupExist) {
        return res.status(400).json({
            message: "kd_sup tidak ada!"
        })
    }

    await Database(tables.suplier).where("kd_sup", kd_sup).update({
        nama_sup, alamat, kota, telp, email, pic
    })

    return res.status(200).json({
        message: "success updated!"
    })
})

app.delete("/api/supplier/v1/remove/:kd_sup", async (req, res) => {
    const kd_sup = req.params.kd_sup

    const isKdBrgExist = await Database(tables.suplier).select("id").where("kd_sup", kd_sup).first()
    if (!isKdBrgExist) {
        return res.status(400).json({
            message: "kd_sup tidak ada!"
        })
    }

    await Database(tables.suplier).where("kd_sup", kd_sup).delete()

    return res.status(200).json({
        message: "success deleted!"
    })
})







// ============================================================

// Barang Supplier Management
app.post("/api/barang-supplier/v1/add", async (req, res) => {
    const { kd_brg, kd_sup, harga, discount_percentage } = req.body
    if (!(kd_brg && kd_sup && harga && discount_percentage)) {
        return res.status(400).json({
            message: "body is'n complete!"
        })
    }

    const isBrgSupExist = await Database(tables.barang_suplier).select("id")
        .where("kd_brg", kd_brg)
        .andWhere("kd_sup", kd_sup)
        .first()
    if (isBrgSupExist) {
        return res.status(404).json({
            message: "barang supplier sudah ada!",
        })
    }

    const find_kd_brg = await Database(tables.barang).select("id").where("kd_brg", kd_brg).first()
    if (!find_kd_brg) {
        return res.status(404).json({
            message: "kd_brg tidak ditemukan!",
        })
    }

    const find_kd_sup = await Database(tables.suplier).select("id").where("kd_sup", kd_sup).first()
    if (!find_kd_sup) {
        return res.status(404).json({
            message: "kd_sup tidak ditemukan!",
        })
    }

    await Database(tables.barang_suplier).insert({
        kd_brg,
        kd_sup,
        harga,
        discount: discount_percentage
    })

    return res.status(200).json({
        message: "success inserted!"
    })
})

app.get("/api/barang-supplier/v1/list", async (req, res) => {
    const data = await Database(tables.barang_suplier).select("*")
    return res.status(200).json({
        data,
    })
})

// ============================================================

// PO Management
app.post("/api/po/v1/add", async (req, res) => {
    const { kt_trans, tgl_trans, kd_sup, userid, total_item, total_harga, discount } = req.body
    if (!(kt_trans && tgl_trans && kd_sup && userid && total_item && total_harga && discount)) {
        return res.status(400).json({
            message: "body is'n complete!"
        })
    }

    const isPoExist = await Database(tables.po).select("id")
        .where("kt_trans", kt_trans)
        .first()
    if (isPoExist) {
        return res.status(404).json({
            message: "po sudah ada!",
        })
    }

    const find_kd_sup = await Database(tables.suplier).select("id").where("kd_sup", kd_sup).first()
    if (!find_kd_sup) {
        return res.status(404).json({
            message: "kd_sup tidak ditemukan!",
        })
    }

    await Database(tables.po).insert({
        kt_trans, tgl_trans: new Date(tgl_trans), kd_sup, userid, total_item, total_harga, discount
    })

    return res.status(200).json({
        message: "success inserted!"
    })
})

app.get("/api/po/v1/list", async (req, res) => {
    const data = await Database(tables.po).select("*")
    return res.status(200).json({
        data,
    })
})

// ============================================================

// PO Detail Management
app.post("/api/po-detail/v1/add", async (req, res) => {
    const { kt_trans, kd_brg, qty, harga, discount_percentage, total_discount } = req.body
    if (!(kt_trans && kd_brg && qty && harga && discount_percentage && total_discount)) {
        return res.status(400).json({
            message: "body is'n complete!"
        })
    }

    const isPoDetailExist = await Database(tables.po_detail)
        .select("id")
        .where("kt_trans", kt_trans)
        .first()
    if (isPoDetailExist) {
        return res.status(404).json({
            message: "po detail sudah ada!",
        })
    }

    const find_kt_trans = await Database(tables.po)
        .select("id")
        .where("kt_trans", kt_trans)
        .first()
    if (!find_kt_trans) {
        return res.status(404).json({
            message: "kt_trans tidak ditemukan!",
        })
    }

    const find_kd_brg = await Database(tables.barang)
        .select("id")
        .where("kd_brg", kd_brg)
        .first()
    if (!find_kd_brg) {
        return res.status(404).json({
            message: "kd_brg tidak ditemukan!",
        })
    }

    await Database(tables.po_detail).insert({
        kt_trans, kd_brg, qty, harga, discount: discount_percentage, total_discount
    })

    return res.status(200).json({
        message: "success inserted!"
    })
})

app.get("/api/po-detail/v1/list", async (req, res) => {
    const data = await Database(tables.po_detail).select("*")
    return res.status(200).json({
        data,
    })
})