const mongoose = require('mongoose');
const db = require('../config/db');
const bcrypt = require('bcrypt');
const { Schema } = mongoose;

// Định nghĩa schema cho món ăn
const monAnSchema = Schema({
    tenMonAn: String,
    moTa: String,
    soTien: Number,
    hinhAnh: String
});

// Định nghĩa schema cho địa điểm
const diaDiemSchema = Schema({
    tenDiaDiem: String,
    moTa: String,
    soSao: Number,
    hinhAnh: String
});

// Định nghĩa schema cho dữ liệu chính
const tinhThanhSchema = Schema({
    tenTinhThanh: String,
    maTinh: String,
    amThuc: [{ type: [monAnSchema] }],
    diaDiem: [{ type: [diaDiemSchema] }]
}, { _id : false });

// Tạo một model sử dụng kết nối từ db.js
const TinhThanh = db.model('TinhThanh', tinhThanhSchema);

module.exports = TinhThanh;
