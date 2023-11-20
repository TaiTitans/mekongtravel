const UserModel = require("../model/user.model");
const jwt  = require('jsonwebtoken')
class UserService{
    static async registerUser(username,email,password){
        try {
            const createUser = new UserModel({ username,email,password });
            return await createUser.save();
        } catch (error) {
            throw error;
        }
    }
    static async checkUser(email){
        try {
            return await UserModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }
    static async generateToken(tokenData, secretkey,jwt_expire){
        return jwt.sign(tokenData, secretkey, {expiresIn:jwt_expire});
    }
}

module.exports = UserService;