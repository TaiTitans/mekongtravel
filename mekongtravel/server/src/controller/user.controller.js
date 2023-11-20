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
exports.login = async (req,res,next) =>{
    try {
        const email = req.body.email;
        const password = req.body.password;

        const user = await UserService.checkUser(email);
        console.log("----------------User--------------", user);

        if(!user){
            throw new Error('User dont exist')
        }
        const isMatch = await user.comparePassword(password);
        if(isMatch === false){
            throw new Error('Password Invalid')
        }
        let tokenData = {_id:user._id,email:user.email}
        const token = await UserService.generateToken(tokenData, "secretkey", "1h");
        res.status(200).json({ status: true, token: token });
    } catch (error) {
        throw error
    }
}