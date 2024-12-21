-- AlterTable
ALTER TABLE `user` ADD COLUMN `boardId` INTEGER NULL,
    ADD COLUMN `instituteId` INTEGER NULL;

-- CreateTable
CREATE TABLE `SelectMaster` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OptionMaster` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subCategory` VARCHAR(191) NOT NULL,
    `selectId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_instituteId_fkey` FOREIGN KEY (`instituteId`) REFERENCES `OptionMaster`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_boardId_fkey` FOREIGN KEY (`boardId`) REFERENCES `OptionMaster`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OptionMaster` ADD CONSTRAINT `OptionMaster_selectId_fkey` FOREIGN KEY (`selectId`) REFERENCES `SelectMaster`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
