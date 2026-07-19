/*
  Warnings:

  - You are about to drop the column `salary` on the `jobapplication` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `jobapplication` DROP COLUMN `salary`,
    ADD COLUMN `deadline` DATETIME(3) NULL,
    ADD COLUMN `isExpired` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `jobType` VARCHAR(191) NULL,
    ADD COLUMN `salaryMax` INTEGER NULL,
    ADD COLUMN `salaryMin` INTEGER NULL,
    ADD COLUMN `workMode` VARCHAR(191) NULL;
