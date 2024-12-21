-- AlterTable
ALTER TABLE `user` ADD COLUMN `classId` INTEGER NULL,
    ADD COLUMN `degreeType` VARCHAR(191) NULL,
    ADD COLUMN `examId` INTEGER NULL,
    ADD COLUMN `mediumId` INTEGER NULL,
    ADD COLUMN `university` VARCHAR(191) NULL;

-- CreateTable
CREATE TABLE `Exams` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_mediumId_fkey` FOREIGN KEY (`mediumId`) REFERENCES `OptionMaster`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `OptionMaster`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_examId_fkey` FOREIGN KEY (`examId`) REFERENCES `Exams`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
