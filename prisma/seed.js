import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const categories = ["institutes", "boards", "class", "medium"];
const defaultData = {
  "institutes": ["Playhouse", "School", "College", "Competitive Exam Center"],
  "board": ["GSEB", "CBSE", "ICSC"],
};

const main = async () => {
  try {
    for (const key of categories) {
      console.log(key, "key");
      let obj = [];
      for (const item of defaultData[key]) {
        obj.push({ subCategory: item });
      }
      const exist = await prisma.selectMaster.findFirst({
        where: { category: key },
      });
      if (!exist) {
        const data = await prisma.selectMaster.create({
          data: {
            category: key,
            options: {
              create: [],
            },
          },
        });
      } else {
        const data = await prisma.selectMaster.update({
          where: { id: exist.id },
          data: {
            options: {
              create: obj,
            },
          },
        });
      }
    }
  } catch (error) {
    console.log(error);
  }
};

main();
