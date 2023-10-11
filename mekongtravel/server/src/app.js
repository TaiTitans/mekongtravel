const compression = require('compression') // tang toc va giam dung luong bo nho network
const express = require ('express')
const { default: helmet } = require('helmet')   // bao mat lo hong
const morgan = require('morgan') //tra ve test case
const app = express()


//init middleware
app.use(morgan('dev'))
app.use(helmet())
app.use(compression())
//init db
require('./dbs/init.mongodb')
const {checkOverload} = require('./helper/check.connect')
checkOverload()
//init routes
app.get('/', (req, res, next)=>{
    const strCompress = 'Mekong Travel'
    return res.status(500).json({
        messsage: 'Welcome to Mekong Travel',
        metadata: strCompress.repeat(1000)
    })
})



//handling error
module.exports = app


