import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const selectnstitute = async (req, res) => {
  try {
    const { name, age, instituteId } = req.body;

    if (!name || !age || !instituteId) {
      res.json("please fill all details");
    }

    const user = await prisma.user.create({
      data: {
        name,
        age,
        institute: { connect: { id: instituteId } },
      },
      select: {
        id: true,
        name: true,
      },
    });
    console.log(user);
    res.cookie("token", user).json("user created successfully");
  } catch (error) {
    console.log(error);
    res.json("something went wrong");
  }
};
