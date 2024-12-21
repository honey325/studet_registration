import { Router } from "express";
import { selectnstitute } from "../controller/institute.controller.js";

export const router = Router();

// router.use("/", (req, res) => {
//   res.json("hello world");
// });

router.post('/institute',selectnstitute)