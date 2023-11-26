/*
  Warnings:

  - You are about to drop the `Retweet` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Retweet` DROP FOREIGN KEY `Retweet_post_id_fkey`;

-- DropForeignKey
ALTER TABLE `Retweet` DROP FOREIGN KEY `Retweet_user_id_fkey`;

-- DropTable
DROP TABLE `Retweet`;

-- CreateTable
CREATE TABLE `retweets` (
    `user_id` INTEGER NOT NULL,
    `post_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`user_id`, `post_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `retweets` ADD CONSTRAINT `retweets_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `retweets` ADD CONSTRAINT `retweets_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts`(`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;
