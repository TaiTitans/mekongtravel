'use strict'
const mongoose = require('mongoose')
const {countConnect} = require('../helper/check.connect')
const {db: {host,port,name}} = require('../configs/conif.mongodb')
const connectString = `${process.env.PRO_DB_HOST}`

//Connected New
class Database{
    constructor(){
        this.connect()
    }
    connect(type = 'mongodb'){
        if(1 === 1){
            mongoose.set('debug', true)
            mongoose.set('debug', {color:true})

        }
        mongoose.connect(connectString).then(_ => {console.log(`Connected MongoDB Success!`), countConnect()})
        .catch(err => console.log('Error Connect!'))
    }
    static getInstance(){
        if(!Database.instance){
            Database.instance = new Database()
        }
        return Database.instance
    }
}

const instanceMongoDB = Database.getInstance()

// Schema and Model

const monAnSchema = new mongoose.Schema({
    tenMonAn: String,
    moTa: String,
    soTien: Number,
    hinhAnh: String,

});


const diaDiemSchema = new mongoose.Schema({
    tenDiaDiem: String,
    moTa: String,
    soSao:Number,
    hinhAnh: String
});

const tinhThanhSchema = new mongoose.Schema({
    tenTinhThanh: String,
    maTinh: String,
    amThuc: [monAnSchema],
    diaDiem: [diaDiemSchema]
});

const TinhThanh = mongoose.model('TinhThanh', tinhThanhSchema);

tinhThanhSchema.methods = function (items) {
    TinhThanh.required();
    return TinhThanh.validate(items);
};


module.exports = {instanceMongoDB,TinhThanh}