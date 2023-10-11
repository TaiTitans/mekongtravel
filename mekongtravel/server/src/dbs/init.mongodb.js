'use strict'

const mongoose = require('mongoose')
const {countConnect} = require('../helper/check.connect')
const connectString = "mongodb+srv://taititans:Taititans2301.@clustermekongtravel.uynjxj9.mongodb.net/?retryWrites=true&w=majority"

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
module.exports = instanceMongoDB