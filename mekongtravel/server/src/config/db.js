const mongoose = require('mongoose')

const connection = mongoose.createConnection('mongodb+srv://taititans:Taititans2301.@clustermekongtravel.uynjxj9.mongodb.net/mekongtravel').on('open', ()=>{
    console.log("MongoDB Connected");
}).on('Error',()=>{
    console.log('MongoDB Connection Error');
})

module.exports = connection