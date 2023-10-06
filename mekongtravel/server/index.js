const express = require('express')
const authRouter = require("./routes/auth")
const app = express()
const port = 3000

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

app.use('./routes/auth', authRouter);