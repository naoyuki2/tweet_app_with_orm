import {Retweet} from "@prisma/client";
import {databaseManager} from "@/db/index";

type RetweetData = Pick<Retweet, "userId" | "postId">;

export const hasUserRetweetedPost = async (
    userId: number,
    postId: number
  ): Promise<boolean> => {
    const prisma = databaseManager.getInstance();
    const retweet = await prisma.retweet.findFirst({
      where: {
        userId,
        postId,
      },
    });
    return retweet !== null;
  };