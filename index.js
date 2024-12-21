import express from "express";
import dotenv from "dotenv";
import { router } from "./src/routes/index.route.js";
import bodyParser from 'body-parser'


dotenv.config();
const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.listen(process.env.PORT, (err) => {
  if (err) console.log("error occur in running app" + err);
  else console.log("server running on " + process.env.PORT);
});

app.use(router);
