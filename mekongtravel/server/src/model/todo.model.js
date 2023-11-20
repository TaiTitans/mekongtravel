const db = require('../config/db');
const mongoose = require('mongoose');
const UserModel = require('../model/user.model')
const { Schema } = mongoose;

var todoSchema = new Schema({
    userID: {
        type: Schema.Types.ObjectId,
        ref:UserModel.modelName
    },
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
});

const TodoModel = db.model('todo', todoSchema);
module.exports = TodoModel;