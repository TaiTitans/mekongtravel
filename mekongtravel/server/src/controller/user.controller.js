const UserService = require('../service/user.service');

exports.register = async (req, res, next) => {
  try {
    const username = req.body.username;
    const email = req.body.email;
    const password = req.body.password;
    const successRes = await UserService.registerUser(username, email, password);
    res.json({ status: true, success: "User Registered Successfully" });
  } catch (error) {
    console.error("Error in registration:", error);
    res.status(500).json({ status: false, error: "Registration failed" });
  }
};

exports.login = async (req, res, next) => {
  try {
    const email = req.body.email;
    const password = req.body.password;

    const user = await UserService.checkUser(email);
    console.log("----------------User--------------", user);

    if (!user) {
      res.status(401).json({ status: false, error: "User doesn't exist" });
      return;
    }

    const isMatch = await user.comparePassword(password);
    if (isMatch === false) {
      res.status(401).json({ status: false, error: "Invalid password" });
      return;
    }

    let tokenData = { _id: user._id, email: user.email };
    const token = await UserService.generateToken(tokenData, "secretkey", "1h");
    res.status(200).json({ status: true, token: token });
  } catch (error) {
    console.error("Error in login:", error);
    res.status(500).json({ status: false, error: "Login failed" });
  }
};
