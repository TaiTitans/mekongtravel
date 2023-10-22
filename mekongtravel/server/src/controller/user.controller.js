const UserService = require('../service/user.service')

exports.register = async (req,res,next) =>{
    try {
        const username = req.body.username;
        const email = req.body.email;
        const password = req.body.password;
        const successRes = await UserService.registerUser(username,email,password)
        res.json({status:true,success:"User Registered Successfully"})
    } catch (error) {
        throw error
    }
}